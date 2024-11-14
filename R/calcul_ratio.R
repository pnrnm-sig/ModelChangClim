# Parc naturel régional & Géoparc Normandie-Maine - version du 15/10/2024

#
# calcul du ratio d'exposition à partir du rayonnement solaire modélisé à partir du MNT et avec SAGA
#
# Le calcul repose sur une moyenne focale de 101 pixels
# Pour finaliser les traitements, il est recommandé d'analyser les distributions des ratios
# et d'enlever les valeurs extrèmes
#
# adapter les entrées et sorties à votre projet
#

# ######################## #
# paramètres en entrées :  #
# ######################## #

path <- 'S:\\4_METIERS\\Environnement\\ChangmntClimtq\\ReproductionModelisation2023\\data\\intermed\\RSol\\ta_lighting'

# les mois
j <- c('01','02','03','04','05','06','07','08','09','10','11','12')
# matrice de 101*101 pixel de côté (pixel de 25 m donc 2.5 km de côté [le plus proche possible des 8 km d'origine tout en restant faisable]
m <- matrix(1,nrow=101,ncol=101)

for(i in j){
  rs <- raster(paste(path,'\\TotalInsolation_',i,'.sdat',sep=''))
  fo <- focal(rs, w=m  , fun=mean)
  ratio <- rs/fo
  writeRaster(x=ratio,filename = paste("./ratio",i,'.tif',sep='') ,format ='GTiff')
}

#########################
# explo des résultats   #
#########################
# la boucle fait un histogramme et donne des stats pour chaque raster d'expo
for(i in j){
  print(i[1])
  ratio <- raster(paste("./ratio",i,'.tif',sep=''))
  hist(ratio,main=i[1])
  print(cellStats(ratio,min))
  print(cellStats(ratio,max))
  print(cellStats(ratio,mean))
  print(cellStats(ratio,median))
  stop
}

##########################
# modif valeurs extrêmes #
##########################

# redresse les ratios pour éviter les valeurs trop grandes (outliers / valeurs extrèmes) : premier et dernier percentiles
# plot le raster modifié pour chaque mois
for(i in j){
  ratio <- raster(paste("./ratio",i,'.tif',sep=''))
  q <- quantile(ratio,c(0.01,0.99))
  q1 <- q[1]
  q2 <- q[2]
  ratio_mod <- (ratio>q1 & ratio<q2)*ratio + (ratio<=q1)*q1 + (ratio>=q2)*q2
  writeRaster(x=ratio_mod,filename = paste("./ratio",i,'_mod.tif',sep='') ,format ='GTiff')
  plot(ratio_mod)
}

