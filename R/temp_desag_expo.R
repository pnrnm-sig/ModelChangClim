# Parc naturel régional & Géoparc Normandie-Maine - version du 15/10/2024

#
# étape désagrégation spatiale, après la désagrégation avec les altitudes
#
# affine le résultat de désagrégation des altitudes en utilisant le ratio d'exposition (ratio ray sol modifié)
#
# (changer les variables "chemin", "nom", etc, en fonction de votre projet)
#

# ######################## #
# paramètres en entrées :  #
# ######################## #

# # chemins et variables à changer en fonction

chemin <- "S:\\4_METIERS\\Environnement\\ChangClim\\ReproModel2023\\data"
dossier <- '\\results\\HL85\\Temp_desag' # dossier température désagrégées alti
dossier1 <- '\\intermed\\RSol_SAGA\\ratio' # dossier ratio exposition

p <- 'pr' # période/scénario : pr, hp45, hp85, hm45, hm85, hl45, hl85, ...


###########
# calculs #
###########

# boucle par mois
mois1 <- c('01','02','03','04','05','06','07','08','09','10','11','12')
mois2 <- c('12','01','02','03','04','05','06','07','08','09','10','11')

for(i in c(1:12)){
  
  temp <- raster(paste(chemin,dossier,'\\temp',mois1[i],'_',p,'_alti.tif',sep='')) # noms de fichiers à vérifier
  ratio <- raster(paste(chemin,dossier1,'\\ratio',mois2[i],'_mod.tif',sep=''))
  ratio <- crop(ratio,temp) # refait l'étendue de la variable en fonction du résultat précédent
  
  #desag <- temp*ratio
  c1 <- temp==0
  c2 <- temp!=0
  desag <- c1*(ratio-1) # si températures = 0, varie entre 0 et -1 si ratio < 1 ; et entre 0 et + si ratio > 1
  desag <- desag + c2*(temp+(abs(temp)*(ratio-1)*temp/temp)) # si température != 0, diminue ou augmente en fonction si temp positive ou négative
  writeRaster(desag,paste('./temp',mois1[i],'_',p,'_expo.tif',sep=''),format="GTiff")  

}


