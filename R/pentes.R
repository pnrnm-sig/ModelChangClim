# Parc naturel régional & Géoparc Normandie-Maine - version du 15/10/2024

#
# reclass pentes en coeff d'écoulement
# voir "rcl" pour les bornes et les coefficients
#

# ####### #
# entrées #
# ####### #
path <- "S:\\4_METIERS\\Environnement\\ChangClim\\ReproModel2023\\"
pentes <- raster(paste(path,"data\\intermed\\MNT\\pente_qgis.tif",sep=''))

# reclass
rcl <- c(c(0,2.7,5.5,11.5,16.5),c(2.7,5.5,11.5,16.5,ceiling(cellStats(pentes,max))),c(0.1,0.3,0.5,0.6,0.8))
rcl <- matrix(rcl,5,3)

coefecoul <- reclassify(pentes, rcl,include.lowest=TRUE)

# ####### #
# sorties #
# ####### #
writeRaster(x=coefecoul,filename = './pentes_reclass_ecoul.tif' ,format ='GTiff',overwrite=TRUE)
