# Parc naturel régional & Géoparc Normandie-Maine - version du 15/10/2024

#
# calcul de l'indice de potentialité bioclim d'Houzard
#

# ####### #
# entrées #
# ####### #
# chemin principal
path <- 'S:\\4_METIERS\\Environnement\\ChangClim\\ReproModel2023\\data\\'

# périodes/scénarios 'pr','hm45','hm85','hp45','hp85','hl45','hl85'
p <- 'pr'

# chemin ETP
path_etp <- paste(path,'results\\',toupper(p),'\\BilHyd\\etp\\ETP_an_',p,'.tif',sep='')
# chemin précipitation
path_etr <- paste(path,'results\\',toupper(p),'\\BilHyd\\etr\\ETR_an_',p,'.tif',sep='')

# ####### #
# entrées #
# ####### #

ETR <- raster(path_etr)
ETP <- raster(path_etp)
delta <- ETP - ETR
delta_relatif <- 100 * delta / ETP
IPB <- sqrt(ETR*(ETR-delta))

# ####### #
# sorties #
# ####### #
writeRaster(x=IPB,filename = paste("./IPB_houzard",'_',p,'.tif',sep='') ,format ='GTiff',overwrite=TRUE)
writeRaster(x=delta_relatif,filename = paste("./delta_rel_houzard",'_',p,'.tif',sep='') ,format ='GTiff',overwrite=TRUE)
