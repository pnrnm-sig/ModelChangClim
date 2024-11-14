# Parc naturel régional & Géoparc Normandie-Maine - version du 15/10/2024

#
# calcul la durée en mois et l'intensité en mm du déficit hydrique
# boucle sur la liste des périodes, ne fonctionne qu'à partir d'une arborescence
# commune de dossiers
#

# ####### #
# entrées #
# ####### #

# chemin en entrée
path <- "S:\\4_METIERS\\Environnement\\ChangClim\\ReproModel2023\\data\\results\\"

# la liste des périodes. A modifier en fonction de ce dont vous avez besoin
peri_list <- c('pr','hm45','hm85','hp45','hp85','hl45','hl85')

# listes des mois, le premier exclu (pour sous-boucles)
l <- c('02','03','04','05','06','07','08','09','10','11','12')

for(periode in peri_list){
  #####################
  # déficit hydrique  #
  #####################
  d <- raster(paste(path,toupper(periode),"\\BilHyd\\d\\DefHydro",'01','_',periode,'.tif',sep=''))
  # nombre de mois avec déficit hydrique : somme des déficits > à 0
  nd <- d > 0
  for(i in l){
    nd <- nd + (raster(paste(path,toupper(periode),"\\BilHyd\\d\\DefHydro",i,'_',periode,'.tif',sep='')) > 1)
  }
  # intensité du déficit : somme des déficits
  id <- d
  for(i in l){
    id <- id + raster(paste(path,toupper(periode),"\\BilHyd\\d\\DefHydro",i,'_',periode,'.tif',sep=''))
  }
  writeRaster(x=nd,filename = paste("./DefHydro",'_Nmois_',periode,'.tif',sep=''),format ='GTiff',overwrite=TRUE)
  writeRaster(x=id,filename = paste("./DefHydro",'_Total_',periode,'.tif',sep=''),format ='GTiff',overwrite=TRUE)
  
  ############################################
  # ETP annuelle : somme des ETP mensuelles  #
  ############################################
  etp_an <- raster(paste(path,toupper(periode),"\\BilHyd\\etp\\EvaTranpPot",'01','_',periode,'.tif',sep=''))
  for (i in l){
    etp_an <- etp_an + raster(paste(path,toupper(periode),"\\BilHyd\\etp\\EvaTranpPot",i,'_',periode,'.tif',sep=''))
  }
  writeRaster(x=etp_an,filename = paste("./ETP_an",'_',periode,'.tif',sep='') ,format ='GTiff',overwrite=TRUE)
  
  ############################################
  # ETR annuelle : somme des ETR mensuelles
  ############################################
  etr_an <- raster(paste(path,toupper(periode),"\\BilHyd\\etr\\EvaTranpReel",'01','_',periode,'.tif',sep=''))
  for (i in l){
    etr_an <- etr_an + raster(paste(path,toupper(periode),"\\BilHyd\\etr\\EvaTranpReel",i,'_',periode,'.tif',sep=''))
  }
  writeRaster(x=etr_an,filename = paste("./ETR_an",'_',periode,'.tif',sep='') ,format ='GTiff',overwrite=TRUE)
  
  #########################
  # surplus hydro annuel  #
  #########################
  s_an <- raster(paste(path,toupper(periode),"\\BilHyd\\s\\SurpHydro",'01','_',periode,'.tif',sep=''))
  for (i in l){
    s_an <- s_an + raster(paste(path,toupper(periode),"\\BilHyd\\s\\SurpHydro",i,'_',periode,'.tif',sep=''))
  }
  writeRaster(x=etp_an,filename = paste("./results/etp/EvaTranpPot_an",'_',periode,'.tif',sep='') ,format ='GTiff',overwrite=TRUE)
  
  d <- raster(paste(path,toupper(periode),"\\BilHyd\\d\\DefHydro",'01','_',periode,'.tif',sep=''))
  
  ####################################################################
  # nombre de mois avec déficit hydrique : somme des déficits > à 0  #
  ####################################################################
  nd <- d > 0
  for(i in l){
    nd <- nd + (raster(paste(path,toupper(periode),"\\BilHyd\\d\\DefHydro",i,'_',periode,'.tif',sep='')) > 1)
  }
  # intensité du déficit : somme des déficits
  id <- d
  for(i in l){
    id <- id + raster(paste(path,toupper(periode),"\\BilHyd\\d\\DefHydro",i,'_',periode,'.tif',sep=''))
  }
  writeRaster(x=nd,filename = paste("./DefHydro",'_Nmois_',periode,'.tif',sep=''),format ='GTiff',overwrite=TRUE)
  writeRaster(x=id,filename = paste("./DefHydro",'_Total_',periode,'.tif',sep=''),format ='GTiff',overwrite=TRUE)
}
