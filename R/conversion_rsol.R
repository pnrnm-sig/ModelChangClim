# Parc naturel régional & Géoparc Normandie-Maine - version du 15/10/2024

#
# étape pré-krigeage : formatage des fichiers points pour le rayonnement solaire
# (intervient après les traitements de "moyennes_points.R")
# converti l'unité et enregistre en fichier de points pour le krigeage avec SAGA
# (changer les variables "chemin", "nom", etc, en fonction de votre projet)
#

# ######################## #
# paramètres en entrées :  #
# ######################## #

chemin <- './'
nom <- 'horizon_lointain_85'
nom2 <- paste(nom,"_moyennes_mensuelles_reformat",sep="")
extension <- '.csv'
fichierentree <- paste(chemin,nom2,extension,sep='')

# # 'pr' 'hp45' 'hp85' 'hm45' 'hm85' 'hl45' 'hl85'
nomsortie <- "hl85" # nom du fichier résultats

data <- read.csv(fichierentree, sep = ",", dec = ".")

# ######### #
# calculs : #
# ######### #

# rayonnement solaire : conversion en rayonnement total par mois, en J/cm2
data$rsds01Jcm2 <- (data$rsds01 * 86400 * 31) / 10000
data$rsds02Jcm2 <- (data$rsds02 * 86400 * 28) / 10000
data$rsds03Jcm2 <- (data$rsds03 * 86400 * 31) / 10000
data$rsds04Jcm2 <- (data$rsds04 * 86400 * 30) / 10000
data$rsds05Jcm2 <- (data$rsds05 * 86400 * 31) / 10000
data$rsds06Jcm2 <- (data$rsds06 * 86400 * 30) / 10000
data$rsds07Jcm2 <- (data$rsds07 * 86400 * 31) / 10000
data$rsds08Jcm2 <- (data$rsds08 * 86400 * 31) / 10000
data$rsds09Jcm2 <- (data$rsds09 * 86400 * 30) / 10000
data$rsds10Jcm2 <- (data$rsds10 * 86400 * 31) / 10000
data$rsds11Jcm2 <- (data$rsds11 * 86400 * 30) / 10000
data$rsds12Jcm2 <- (data$rsds12 * 86400 * 31) / 10000

# ################# #
# sorties RESULTATS #
# ################# #

# résultats en sortie, format shp
# rayonnement solaire total, J/cm2
points <- data[,c(1:4,41:52)]
coordinates(points) <- ~LambertX+LambertY
proj4string(points) <- CRS("+init=epsg:27572") # Lambert II carto étendu
points <- sp::spTransform(points,CRS("+init=epsg:2154")) # Lambert 93
points <- vect(points) # conversion en format Terra
writeVector(points, paste("rsds01_12_",nomsortie,'.shp',sep=""),filetype ='ESRI Shapefile', overwrite=TRUE)