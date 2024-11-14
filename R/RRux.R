# Parc naturel régional & Géoparc Normandie-Maine - version du 15/10/2024

#
# enlève valeur 0 du RRux (sinon no data dans les résultats de bilan hydrique)
# en fonction d'une couche 'masque' préalablement créé
# Remplace les valeurs NA par 0
# (remplace par NA => utiliser l'outils fill na raster de Qgis)
# Changer chemin, nomentree et resultat en fonction du projet
#

# ######################## #
# paramètres en entrées :  #
# ######################## #
chemin <- "./"
nomentree <- paste(chemin,"\\RUx_Float32_Resamp.tif",sep='')
nommasque <- paste(chemin,"\\masque.tif",sep='')
resultat <- paste(chemin,'\\RUx_Float32_tempo.tif',sep='')

rux <- raster(nomentree)
masque <- raster(nommasque)

# ######### #
# calculs : #
# ######### #

condition <- (rux==0) * (masque==1) # utilisation du masque (0/1) et pour pixel = 0
rux[rux<(-1000)] <- 0 # valeurs aberrantes et NA remplacés par 0
rux[is.na(rux)] <- 0
rux[condition==1] <- NA # pixels selectionnés remplacés par NA

# ################# #
# sorties RESULTATS #
# ################# #
writeRaster(x=rux,filename = resultat ,format ='GTiff',overwrite=TRUE)
