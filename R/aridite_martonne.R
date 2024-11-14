# Parc naturel régional & Géoparc Normandie-Maine - version du 15/10/2024

#
# calcul indice d'aridité de martonne
#

# ####### #
# entrées #
# ####### #
# chemin principal
path <- 'S:\\4_METIERS\\Environnement\\ChangClim\\ReproModel2023\\data\\'

# périodes/scénarios 'pr','hm45','hm85','hp45','hp85','hl45','hl85'
p <- 'pr'

# chemin températures
path_temp <- paste(path,'results\\',toupper(p),'\\Temp_desag2\\temp_annuel_',p,'_expo.tif',sep='')
# chemin précipitation
path_preci <- paste(path,'results\\',toupper(p),'\\Prec_desag\\preci_annuel_',p,'_alti.tif',sep='')

# ####### #
# entrées #
# ####### #
T <- raster(path_temp)
P <-  raster(path_preci)

mois <- c('02','03','04','05','06','07','08','09','10','11','12')

preci <- paste(path,'results\\',toupper(p),'\\Prec_desag\\preci','01','_',p,'_alti.tif',sep='')
precis <- stack(preci)
for(m in mois){
  preci <- raster(paste(path,'results\\',toupper(p),'\\Prec_desag\\preci',m,'_',p,'_alti.tif',sep=''))
  precis <- stack(precis,preci)
}

temp <- paste(path,'results\\',toupper(p),'\\Temp_desag2\\temp','01','_',p,'_expo.tif',sep='')
temps <- stack(temp)
for(m in mois){
  temp <- raster(paste(path,'results\\',toupper(p),'\\Temp_desag2\\temp',m,'_',p,'_expo.tif',sep=''))
  temps <- stack(temps,temp)
}

#           #
# résultats #
#           #
martonne <- P/(T+10)
writeRaster(x=martonne,filename = paste("./aridite_martonne",'_',p,'.tif',sep='') ,format ='GTiff',overwrite=TRUE)

martonne_m <- stack(((precis[[1]]*12)/(temps[[1]]+10)))
for(i in 2:12){martonne_m <- stack(martonne_m,((precis[[i]]*12)/(temps[[i]]+10)))}

martonne_m <- stack(((precis[[1]]*12)/(temps[[1]]+10)))>30
for(i in 2:12){martonne_m <- martonne_m+(((precis[[i]]*12)/(temps[[i]]+10))>30)}

for(i in 1:12){
  writeRaster(x=martonne,filename = paste("./aridite_martonne",'_',p,'_',i,'.tif',sep='') ,format ='GTiff',overwrite=TRUE)
}

