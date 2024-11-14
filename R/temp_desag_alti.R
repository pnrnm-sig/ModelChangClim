# Parc naturel régional & Géoparc Normandie-Maine - version du 15/10/2024

#
# étape désagrégation spatiale, après le krigeage
#
# désagrège le résultat du krigeage avec le MNT (altitudes) en fonction du gradient
#
# (changer les variables "chemin", "nom", etc, en fonction de votre projet)
#

# ######################## #
# paramètres en entrées :  #
# ######################## #

# # chemins et variables à changer en fonction

chemin <- "S:\\4_METIERS\\Environnement\\ChangClim\\ReproModel2023\\data"
dossier_mnt <- '\\intermed\\MNT'
dossier_temp <- '\\intermed\\HL85\\Temp_bkrige' # dossier contenant les fichiers interpolés
p <- 'hl85' # période/scénarios : pr, hp45, hp85, hm45, hm85, hl45, hl85, ...

# mnt
mnt <- raster(paste(chemin,dossier_mnt,"\\MNT_quadrillage_mailles_drias.tif",sep=""))

# gradients
g_temp <- -0.0042

###########
# calculs #
###########

# boucle par mois
mois <- c('01','02','03','04','05','06','07','08','09','10','11','12')

# sortie calculs températures désagrégées
for(m in mois){
  
  temp <- raster(paste(chemin,dossier_temp,'\\temp',m,'_',p,'_krigeb.sdat',sep='')) # nom et format de fichier à vérifier en fonction du projet
  temp <- crop(temp,mnt) # refait l'étendue de la variable en fonction du MNT
  desag <- temp + mnt * g_temp
  writeRaster(desag,paste('./temp',m,'_',p,'_alti.tif',sep=''),format="GTiff") # enregistre dans le dossier courant
  
}


