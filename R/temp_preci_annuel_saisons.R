# Parc naturel régional & Géoparc Normandie-Maine - version du 15/10/2024

#
# calcul témpératures et précipitations annuelles et saisonniers
#

# ####### #
# entrées #
# ####### #

# chemin principal
path <- 'S:\\4_METIERS\\Environnement\\ChangClim\\ReproModel2023\\data\\'

# périodes/scénarios 'pr','hm45','hm85','hp45','hp85','hl45','hl85'
p <- 'pr'

# chemins températures, précipitations
path_preci <- paste(path,'results\\',toupper(p),'\\Prec_desag',sep='')
path_temp <- paste(path,'results\\',toupper(p),'\\Temp_desag2',sep='')


# ####### #
# calculs #
# ####### #
temp01 <- raster(paste(path_temp,'\\temp','01','_',p,'_expo.tif',sep=''))
temp02 <- raster(paste(path_temp,'\\temp','02','_',p,'_expo.tif',sep=''))
temp03 <- raster(paste(path_temp,'\\temp','03','_',p,'_expo.tif',sep=''))
temp04 <- raster(paste(path_temp,'\\temp','04','_',p,'_expo.tif',sep=''))
temp05 <- raster(paste(path_temp,'\\temp','05','_',p,'_expo.tif',sep=''))
temp06 <- raster(paste(path_temp,'\\temp','06','_',p,'_expo.tif',sep=''))
temp07 <- raster(paste(path_temp,'\\temp','07','_',p,'_expo.tif',sep=''))
temp08 <- raster(paste(path_temp,'\\temp','08','_',p,'_expo.tif',sep=''))
temp09 <- raster(paste(path_temp,'\\temp','09','_',p,'_expo.tif',sep=''))
temp10 <- raster(paste(path_temp,'\\temp','10','_',p,'_expo.tif',sep=''))
temp11 <- raster(paste(path_temp,'\\temp','11','_',p,'_expo.tif',sep=''))
temp12 <- raster(paste(path_temp,'\\temp','12','_',p,'_expo.tif',sep=''))

temp <- temp01 + temp02 + temp03 + temp04 + temp05 + temp06 + temp07 + temp08 + temp09 + temp10 + temp11 + temp12

temp_printemps <- temp03 + temp04 + temp05
temp_ete <- temp06 + temp07 + temp08
temp_automne <- temp09 + temp10 + temp11
temp_hiver <- temp12 + temp01 + temp02

precip01 <- raster(paste(path_preci,'\\preci','01','_',p,'_alti.tif',sep=''))
precip02 <- raster(paste(path_preci,'\\preci','02','_',p,'_alti.tif',sep=''))
precip03 <- raster(paste(path_preci,'\\preci','03','_',p,'_alti.tif',sep=''))
precip04 <- raster(paste(path_preci,'\\preci','04','_',p,'_alti.tif',sep=''))
precip05 <- raster(paste(path_preci,'\\preci','05','_',p,'_alti.tif',sep=''))
precip06 <- raster(paste(path_preci,'\\preci','06','_',p,'_alti.tif',sep=''))
precip07 <- raster(paste(path_preci,'\\preci','07','_',p,'_alti.tif',sep=''))
precip08 <- raster(paste(path_preci,'\\preci','08','_',p,'_alti.tif',sep=''))
precip09 <- raster(paste(path_preci,'\\preci','09','_',p,'_alti.tif',sep=''))
precip10 <- raster(paste(path_preci,'\\preci','10','_',p,'_alti.tif',sep=''))
precip11 <- raster(paste(path_preci,'\\preci','11','_',p,'_alti.tif',sep=''))
precip12 <- raster(paste(path_preci,'\\preci','12','_',p,'_alti.tif',sep=''))

precip <- precip01 + precip02 + precip03 + precip04 + precip05 + precip06 + precip07 + precip08 + precip09 + precip10 + precip11 + precip12

precip_printemp <- precip03 + precip04 + precip05
precip_ete <- precip06 + precip07 + precip08
precip_automne <- precip09 + precip10 + precip11
precip_hiver <- precip12 + precip01 + precip02

# ####### #
# sorties #
# ####### #
writeRaster(x=precip,filename = paste("./",'preci','_annuel','_',p,'_alti.tif',sep='') ,format ='GTiff',overwrite=TRUE)
writeRaster(x=temp,filename = paste("./",'temp','_annuel','_',p,'_expo.tif',sep='') ,format ='GTiff',overwrite=TRUE)

writeRaster(x=precip_printemp,filename = paste("./",'preci','_printemp','_',p,'_alti.tif',sep='') ,format ='GTiff',overwrite=TRUE)
writeRaster(x=temp_printemp,filename = paste("./",'temp','_printemp','_',p,'_expo.tif',sep='') ,format ='GTiff',overwrite=TRUE)
writeRaster(x=precip_ete,filename = paste("./",'preci','_ete','_',p,'_alti.tif',sep='') ,format ='GTiff',overwrite=TRUE)
writeRaster(x=temp_ete,filename = paste("./",'temp','_ete','_',p,'_expo.tif',sep='') ,format ='GTiff',overwrite=TRUE)
writeRaster(x=precip_automne,filename = paste("./",'preci','_automne','_',p,'_alti.tif',sep='') ,format ='GTiff',overwrite=TRUE)
writeRaster(x=temp_automne,filename = paste("./",'temp','_automne','_',p,'_expo.tif',sep='') ,format ='GTiff',overwrite=TRUE)
writeRaster(x=precip_hiver,filename = paste("./",'preci','_hiver','_',p,'_alti.tif',sep='') ,format ='GTiff',overwrite=TRUE)
writeRaster(x=temp_hiver,filename = paste("./",'temp','_hiver','_',p,'_expo.tif',sep='') ,format ='GTiff',overwrite=TRUE)