# Parc naturel régional & Géoparc Normandie-Maine - version du 15/10/2024

#
# produit un graphique "diagramme ombrothermique" à partir des données modélisées
# sur une zone données (format shp)
# diagramme P = 2T , c-à-d 10°C = 20 mm sur le graphique 
#
# source du code pour le diagramme :
# https://sites.google.com/site/rgraphiques/realiser-des-graphiques-avec-le-logiciel-r/g%C3%A9rer-les-graphiques-combinaisons-forme-et-sauvegarde/combinaisons-graphiques/diagramme-ombrothermique-avec-le-logiciel-r-project
#

# ######################## #
# paramètres en entrées :  #
# ######################## #

path <- 'S:\\4_METIERS\\Environnement\\ChangClim\\ReproModel2023\\data\\'

# 'pr' 'hp45' 'hp85' 'hm45' 'hm85' 'hl45' 'hl85'
# 'PR' 'HP45' 'HP85' 'HM45' 'HM85' 'HL85' 'HL85'
p <- 'pr'
path_preci <- paste(path,'results\\PR\\Prec_desag',sep='')
path_temp <- paste(path,'results\\PR\\Temp_desag2',sep='')

zone <- st_read(dsn="S:/4_METIERS/Evaluation/REVISION/PERIMETRE_ETUDE/shp",layer = "perimetre_etude_bdtopo")

titregraph <- paste("Précipitations cumulées et températures moyennes",p,sep='\n')

# ####### #
# CALCULS #
# ####### #
j <- c('01','02','03','04','05','06','07','08','09','10','11','12')
precip <- c()
temp <- c()
for(i in j){
  precip0 <- raster(paste(path_preci,'\\preci',i,'_',p,'_alti.tif',sep=''))
  temp0 <- raster(paste(path_temp,'\\temp',i,'_',p,'_expo.tif',sep=''))
  #precip <- c(precip, cellStats(precip0, stat = mean))
  precip0 <- crop(precip0,zone)
  precip0 <- mask(precip0,zone)
  precip <- c(precip,cellStats(precip0,stat=mean,na.rm=T))
  #temp <- c(temp, cellStats(temp0, stat = mean))
  temp0 <- crop(temp0,zone)
  temp0 <- mask(temp0,zone)
  temp <- c(temp,cellStats(temp0,stat=mean,na.rm=T))
}

# ######### #
# DIAGRAMME #
# ######### #
plot.new()
label <- c("Jan.","Fév.","Mar.","Avr.","Mai","Jui.","Juil.","Aou.","Sep.","Oct.","Nov.","Déc.")

par(mar=c(4,4,3,4),bg="#F6E3CE") # bg : couleur du fond du graphique

position <- barplot(precip,col="cyan",
                    names.arg=label,axes=F,ylab="",xlab="",ylim=c(0,100), 
                    las=2, space=0,plot=F)

plot(position,temp,col="red",type="o",lwd=2,pch=16,axes=F,
     ylab="",xlab="",ylim=c(0,50), xlim=c(0,length(temp)),yaxs ="i")

polygon(c(position[1],position,position[length(position)]),c(0,temp,0),col="yellow")

par(new=T,mar=c(4,4,3,4))

barplot(precip,col="cyan",names.arg=label,axes=F,ylab="",
        xlab="",main=titregraph,
        ylim=c(0,100), 
        las=2,space=0,cex.main=0.8)

axis(2,col="black",at=seq(0, 100, by=10))

par(new=TRUE,mar=c(4,4,3,4))

maximal = max(position)+(position[2]-position[1])

plot(position,temp,col="red",type="o",
     lwd=2,pch=16,axes=F,ylab="",xlab="",ylim=c(0,50), xlim=c(0,length(temp)),yaxs ="i")
axis(4,col.axis="red",col="red")
box();grid()

mtext("Précipitations (mm)",side=2,line=2,cex=1.1)
mtext("Température (°C)",side=4,col="red",line=2,cex=1.1)
mtext("Mois",side=1,col="black",line=2.5,cex=1.1)