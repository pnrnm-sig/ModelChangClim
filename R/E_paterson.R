# Parc naturel régional & Géoparc Normandie-Maine - version du 15/10/2024

#
# calcul de la valeur "E" pour l'indice de Paterson CVP, "Climat, Végétation, Productivité"
#
# Le calcul peut être un peu long
#

# ####### #
# entrées #
# ####### #
# chemin vers dossier d'un fichier correspondant à la zone d'étude pour E
p <- 'pr'
path <- paste('S:\\4_METIERS\\Environnement\\ChangClim\\ReproModel2023\\data\\results\\',toupper(p),'\\Temp_desag2\\',sep='')

# ########### #
# calcul de E #

# couche correspondant à l'étendue géographique des résultats pour la zone d'étude (peut importe le fichier)
etendue <- raster(paste(path,'temp01_',p,'_expo.tif',sep=''))
# projection en WGS84
newproj <- CRS("+init=epsg:4326")
raster_E <- projectRaster(etendue, crs=newproj)

# remplacer les valeurs du raster avec la latitude
for(i in 1:nrow(raster_E)){
  raster_E[i,][!is.na(raster_E[i,])] <- yFromRow(raster_E,i)
}
raster_E <- 0.02*raster_E*raster_E-0.9*raster_E+56 # formule valable pour les latitudes France métropolitaine, d'après le graphique fourni

# retour projection en mètres
raster_E <- projectRaster(raster_E, crs=crs(etendue))
raster_E <- crop(raster_E, etendue)
raster_E <- resample(raster_E, etendue)

writeRaster(raster_E,"E_paterson.tif")