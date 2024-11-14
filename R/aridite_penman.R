# Parc naturel régional & Géoparc Normandie-Maine - version du 15/10/2024

#
# calcul de l'indice d'aridité de penman
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
path_preci <- paste(path,'results\\',toupper(p),'\\Prec_desag\\preci_annuel_',p,'_alti.tif',sep='')

# ####### #
# entrées #
# ####### #

ETP <- raster(path_etp)
P <-  raster(path_preci)

# ####### #
# calcul et sortie #
# ####### #

penman <- P/ETP
writeRaster(x=penman,filename = paste("./aridite_penman",'_',p,'.tif',sep='') ,format ='GTiff',overwrite=TRUE)