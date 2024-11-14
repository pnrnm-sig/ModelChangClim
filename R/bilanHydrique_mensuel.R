# Parc naturel régional & Géoparc Normandie-Maine - version du 15/10/2024

#
# modélisation changement climatique, bilan hydrique
#
# à partir des températures désagrégées (altitudes) mensuelles, des précipitations désagrégées (altitudes) mensuelles,
# et du rayonnement solaire désagrégé (exposition) mensuel, 
# et aussi de la réserve utile totale et des pentes reclassées en coefficient d'écoulement
# Calculs les éléments du bilan hydrique : 
# - ETP : évapotranspiration potentielle
# - ETR : évapotranspiration réelle
# - RU : réserve utile
# - CHRU : changement de réserve utile
# - RRU : recharge réserve utile
# - D : déficit hydrique
# - S : surplus hydrique
# - Q : écoulements superficiels
#
## DEFINITIONS :
## rs : rayonnement solaire total, en J/cm2
## t : température moyenne mensuelle, en °C
## p : précipitation totale mensuelle, en mm
## RUx : réserve utile maximale (INRAe)
## a : coefficient d'écoulement (reclass des pentes)
#
# RUavant : 
## janvier  = RUx
## autres mois = RU mois précédent
#
# Qavant : 
## janvier = 60 (constante modifiable en fonction de la nature des sols)
## autres mois = Q mois précédent
#
# k : constante pour le calcul de ETP. Constante de 0.4, sauf en février 0.37
# NB. attention à ce que tous les raster soit au même format
# (projection, étendu, résolution, encodage). Une partie du code
# corrige cela (extent) mais pas tout.
#
#
# NB changer les variables "chemin", "nom", etc, en fonction de votre projet
# 
# Source : 
## BILAN HYDRIQUE  (décroissance RU logarithmique) 
## MENSUEL  (O. Cantat, Géophen, UCBN 2011)
#

# ######################## #
# paramètres en entrées :  #
# ######################## #

### variables de départ [[A VERIFIER en fonction des données]]

chemin <- "S:\\4_METIERS\\Environnement\\ChangClim\\ReproModel2023\\data"
dossier_mnt <- '\\intermed\\MNT'
dossier_a <- '\\intermed\\MNT'
dossier_rux <- '\\intermed\\INRAe'
dossier_rs <- '\\results\\PR\\RSol_desag'
dossier_temp <- '\\results\\PR\\Temp_desag'
dossier_preci <- '\\results\\PR\\Prec_desag'

periode <- 'pr' # 'pr','hm45','hm85','hp45','hp85', 'hl45', 'hl85'

# raster du MNT pour corriger les étendues
mnt <- raster(paste(chemin,dossier_mnt,"\\MNT_quadrillage_mailles_drias.tif",sep=""))

# pente reclass : coefficient d'écoulement
a <- raster(paste(chemin,dossier_a,"\\pentes_reclass_ecoul.tif",sep=""))
a <- crop(a,mnt)

# réserve utile max théorique
RUx_file <- paste(chemin,dossier_rux,"\\RUx_Float32_ResampFilled.tif",sep="")
RUx <- raster(RUx_file)
RUx <- crop(RUx,mnt)

### autres variables

# variables pour les noms de fichiers (mois)
j <- c('01','02','03','04','05','06','07','08','09','10','11','12')
l <- c('01','02','03','04','05','06','07','08','09','10','11')

# coeff k & n j par mois
k_liste <- c(0.4,0.37,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4,0.4)
lmonth <- c(31,28,31,30,31,30,31,31,30,31,30,31)

# listes de fichiers
rs_files <- paste(chemin,dossier_rs,"\\rsds",j,"Jcm2_",periode,"_expo.tif",sep="")
t_files <- paste(chemin,dossier_temp,"\\temp",j,"_",periode,"_alti.tif",sep="") # alti pas expo, pour ne pas utiliser *2 l'expo avec le rsol
p_files <- paste(chemin,dossier_preci,"\\preci",j,"_",periode,"_alti.tif",sep="")

RUavant_files <- c(RUx_file, # réserve utile max 
                   paste("./ru/ResUti",l,'_',periode,'.tif',sep=""))
Qavant_files <- c(60.0, #surplus hydro de départ théorique d'après le modèle
                  paste("./q/EcoulSup",l,'_',periode,'.tif',sep=""))

# créé des sous-répertoire pour ranger les résultats
dir.create(file.path('./','chru'), showWarnings = FALSE)
dir.create(file.path('./','d'), showWarnings = FALSE)
dir.create(file.path('./','etp'), showWarnings = FALSE)
dir.create(file.path('./','etr'), showWarnings = FALSE)
dir.create(file.path('./','q'), showWarnings = FALSE)
dir.create(file.path('./','rru'), showWarnings = FALSE)
dir.create(file.path('./','ru'), showWarnings = FALSE)
dir.create(file.path('./','s'), showWarnings = FALSE)

############################################################################
## boucle calculs par mois et sorties                                      #
############################################################################

for (i in c(1:12)){
  rs <- raster(rs_files[i])
  t <- raster(t_files[i])
  p <- raster(p_files[i])
  
  RUavant <- raster(RUavant_files[i])
  if(i == 1){Qavant <- as.numeric(Qavant_files[i]) * a}else{Qavant <- raster(Qavant_files[i])}
  k <- k_liste[i]
  
  rs <- crop(rs,mnt )
  t <- crop(t,mnt)
  p <- crop(p,mnt)

  RUavant <- crop(RUavant, mnt)
  Qavant <- crop(Qavant,mnt )
  
  # Ig : irradiation solaire globale et par jour 
  ### nb conversion RS Jcm2 en calories/cm² ###
  Ig <- (rs/4.184) / lmonth[i]
  
  # ETP : évapotranspiration potentielle
  etp <- k * (t/(t + 15)) * (Ig + 50) 
  
  # calculs bilan hydrique mensuel (unités : en mm)
  ## RU : réserve utile
  ## CHRU : changement de la réserve utile
  ## ETR : évapo transpiration réelle
  ## D : déficit hydrique
  ## RRU : reconstitution de la réserve utile
  ## S : surplus hydrologique
  ## Q : écoulement superficiel
  
  ru1 <- ((p - etp) < 0) * (RUavant * exp((p - etp) / RUx)) 
  ru2 <- ((p - etp) >= 0) * ((RUavant + p - etp) < RUx) * (RUavant + p - etp)
  ru3 <- ((p - etp) >= 0) * ((RUavant + p - etp) >= RUx) * RUx
  ru <- ru1 + ru2 + ru3
  
  chru <- ru - RUavant
  etr <- (((p - etp) < 0) * (p - chru))
  etr <- etr + ((p - etp) >= 0) * etp
  d <- etp - etr
  rru <- ru + p - etr - chru
  s <- (rru >= RUx) * (rru - RUx)
  q <- (a * s) + (1 - a) * Qavant
  
  #########################
  # enregistrer résultats #
  #########################
  m <- j[i]
  print(paste('Calcul mois',m,'...',sep=' '))
  writeRaster(x=etp,filename = paste("./etp/EvaTranpPot",m,'_',periode,'.tif',sep='') ,format ='GTiff',overwrite=TRUE)
  writeRaster(x=ru,filename = paste("./ru/ResUti",m,'_',periode,'.tif',sep=''),format ='GTiff',overwrite=TRUE)
  writeRaster(x=chru,filename = paste("./chru/ChanResUti",m,'_',periode,'.tif',sep=''),format ='GTiff',overwrite=TRUE)
  writeRaster(x=etr,filename = paste("./etr/EvaTranpReel",m,'_',periode,'.tif',sep=''),format ='GTiff',overwrite=TRUE)
  writeRaster(x=d,filename = paste("./d/DefHydro",m,'_',periode,'.tif',sep=''),format ='GTiff',overwrite=TRUE)
  writeRaster(x=rru,filename = paste("./rru/RecoResUti",m,'_',periode,'.tif',sep=''),format ='GTiff',overwrite=TRUE)
  writeRaster(x=s,filename = paste("./s/SurpHydro",m,'_',periode,'.tif',sep=''),format ='GTiff',overwrite=TRUE)
  writeRaster(x=q,filename = paste("./q/EcoulSup",m,'_',periode,'.tif',sep=''),format ='GTiff',overwrite=TRUE)
}