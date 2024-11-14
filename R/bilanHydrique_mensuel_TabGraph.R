# Parc naturel régional & Géoparc Normandie-Maine - version du 15/10/2024

#
# variable pour produire le tableau du modèle du bilan hydrique
# et son diagramme. Modèle Olivier Cantat
#

# ######################## #
# paramètres en entrée :  #
# ######################## #

path <- "S:\\4_METIERS\\Environnement\\ChangClim\\ReproModel2023\\data"

# 'pr','hp45','hp85','hm45','hm85','hl45','hl85'
periode <- 'pr'

# zones d'étude - à modifier pour faire l'analyse sur une zone
zone <- st_read(dsn="S:/4_METIERS/Evaluation/REVISION/PERIMETRE_ETUDE/shp",layer = "perimetre_etude_bdtopo")

############################################################################
## calculs
############################################################################

j <- c('01','02','03','04','05','06','07','08','09','10','11','12')
  
bilanhydrique <- data.frame(matrix(rep(rep(0,7),12),ncol=12)
                              ,row.names = c("P","D","S","S+ETP","ETP","ETR","si P>=ETP;ETR;P"))
names(bilanhydrique) <- c("jan","fév","mar","avr","mai","juin","juil","aoû","sep","oct","nov","déc")
  
# tableau bilan hydrique
for(i in 1:12){
    p <- raster(paste(path,"\\results\\",toupper(periode),"\\Prec_desag\\preci",j[i],"_",periode,"_alti.tif",sep=''))
    p <- crop(p,zone)
    p <- mask(p,zone)
    
    d <- raster(paste(path,"\\results\\",toupper(periode),"\\BilHyd\\d\\DefHydro",j[i],"_",periode,".tif",sep=''))
    d <- crop(d,zone)
    d <- mask(d,zone)
    
    s <- raster(paste(path,"\\results\\",toupper(periode),"\\BilHyd\\s\\SurpHydro",j[i],"_",periode,".tif",sep=''))
    s <- crop(s,zone)
    s <- mask(s,zone)
    
    etp <- raster(paste(path,"\\results\\",toupper(periode),"\\BilHyd\\etp\\EvaTranpPot",j[i],"_",periode,".tif",sep=''))
    etp <- crop(etp,zone)
    etp <- mask(etp,zone)
    
    etr <- raster(paste(path,"\\results\\",toupper(periode),"\\BilHyd\\etr\\EvaTranpReel",j[i],"_",periode,".tif",sep=''))
    etr <- crop(etr,zone)
    etr <- mask(etr,zone)
    
    p <- cellStats(p,mean,na.rm=TRUE)
    d <- cellStats(d,mean,na.rm=TRUE)
    s <- cellStats(s,mean,na.rm=TRUE)
    etp <- cellStats(etp,mean,na.rm=TRUE)
    etr <- cellStats(etr,mean,na.rm=TRUE)
    if(p>=etp){
      condition <- etr
    }else{
      condition <- p
    }
    
    bilanhydrique[,i] <- c(p,d,s,s+etp,etp,etr,condition)
}

############################################################################
## plot bilan hydrique
############################################################################
x <- c(0,1,1,2,2,3,3,4,4,5,5,6,6,7,7,8,8,9,9,10,10,11,11,12)
  
jpeg(paste("./bilanhydr_",periode,".jpg",sep=""),width = 480*1.7,height = 480)
# PRECIPITATION : bleu/violet = reconstitution
plot(x=x,y=rep(bilanhydrique[1,],each=2), type="l" , 
       lwd=1,ylim=c(min(bilanhydrique),max(bilanhydrique)),
       ylab='mm',xlab='mois',main=paste('Bilan hydrique',periode,sep=' - '),xaxt = "n")
axis(1, at = c(0:12),labels=FALSE)
axis(1, at = c(0:11)+0.5,tick = FALSE,
       labels=c('jan','fév','mar','avr','mai','jui','juil','aoû','sep','oct','nov','déc'),
       las=2)
polygon( 
    c(min(x), x , max(x)) , 
    c( min(bilanhydrique) , rep(bilanhydrique[1,],each=2) , min(bilanhydrique)) , 
    col=rgb(149/255,175/255,255/255,1) , border=F
)
# surplus : bleu roi / foncé
par(new=TRUE)
plot(x=x,y=rep(bilanhydrique[4,],each=2),type="l", 
       lwd=1, ylim=c(min(bilanhydrique),max(bilanhydrique)),xlab=NA,ylab=NA,xaxt = "n")
  polygon( 
    c(min(x), x , max(x)) , 
    c( min(bilanhydrique) , rep(bilanhydrique[4,],each=2) , min(bilanhydrique)) , 
    col=rgb(0/255,0/255,255/255,1) , border=F
)
# evapo transpi potentielle : jaune
par(new=TRUE)
plot(x=x,y=rep(bilanhydrique[5,],each=2),type="l", lwd=1, 
       ylim=c(min(bilanhydrique),max(bilanhydrique)),xlab=NA,ylab=NA,xaxt = "n")
polygon( 
    c(min(x), x , max(x)) , 
    c( min(bilanhydrique) , rep(bilanhydrique[5,],each=2) , min(bilanhydrique)) , 
    col=rgb(255/255,255/255,0/255,1) , border=F
)
# evapo transpi réelle : orange
par(new=TRUE)
plot(x=x,y=rep(bilanhydrique[6,],each=2),type="l", lwd=1, 
       ylim=c(min(bilanhydrique),max(bilanhydrique)),xlab=NA,ylab=NA,xaxt = "n")
polygon( 
    c(min(x), x , max(x)) , 
    c( min(bilanhydrique) , rep(bilanhydrique[6,],each=2) , min(bilanhydrique)) , 
    col=rgb(255/255,113/255,0/255,1) , border=F
)
# P>=ETP;ETR;P => précipitation quand déficit hydrique
par(new=TRUE)
plot(x=x,y=rep(bilanhydrique[7,],each=2),type="l", 
       lwd=1, ylim=c(min(bilanhydrique),max(bilanhydrique)),xlab=NA,ylab=NA,xaxt = "n")
polygon( 
    c(min(x), x , max(x)) , 
    c( min(bilanhydrique) , rep(bilanhydrique[7,],each=2) , min(bilanhydrique)) , 
    col=rgb(204/255,255/255,255/255,1) , border=F
)
dev.off()
