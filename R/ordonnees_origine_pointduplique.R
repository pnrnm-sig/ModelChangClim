# Parc naturel régional & Géoparc Normandie-Maine - version du 15/10/2024

#
# étape pré-krigeage :calculs des ordonnées à l'origine : température, précipitations
# (à une altitude théorique de 0, en fonction des gradients)
# (voir méthodo pour le détail du calcul des gradients en fonction de la zone d'étude)
# Modifier les paramètres en entrées en fonction du projet (gradients, chemin, nom, etc.)
# et aussi nom en sortie
#
# effectue les traitements sur les points dupliqués puis concaténe avec l'ensemble des points
# de votre zone d'étude
#

# ######################## #
# paramètres en entrées :  #
# ######################## #

# gradients : variation  par mètres de températures (moyenne) et précipitation (cumul par mois)
g_temp <- -0.0042
g_preci <- 0.0821
g_temp_dupli <- -0.0042 # pour les points dupliqués (pas nécessairement différent des gradients)
g_preci_dupli <- 0.0821 # pour les points dupliqués (pas nécessairement différent des gradients)

# # 'pr' 'hp45' 'hp85' 'hm45' 'hm85' 'hl45' 'hl85'
scenario <- 'pr'

# dossier de travail
path <- "./"

# nom du fichier résultats
nomsortie <- "BSN_PR" 

#######################
# points dupliqués    #
#######################

# charger les données
datapreci <- st_read(dsn=paste(path,'PRECI_base/'),paste('preci01_12',scenario,sep='_'))
datapreci_dup <- st_read(dsn=paste(path,'./PRECI_duplique/'),paste('preci01_12',scenario,'dupli',sep='_'))

datatemp <- st_read(dsn=paste(path,'./TEMP_base/'),paste('temp01_12',scenario,sep='_'))
datatemp_dup <- st_read(dsn=paste(path'./TEMP_duplique/'),paste('temp01_12',scenario,'dupli',sep='_'))

# precip - gradient dupli
datapreci_dup$preci01 <- datapreci_dup$preci01 - g_preci_dupli * datapreci_dup$Altitude
datapreci_dup$preci02 <- datapreci_dup$preci02 - g_preci_dupli * datapreci_dup$Altitude
datapreci_dup$preci03 <- datapreci_dup$preci03 - g_preci_dupli * datapreci_dup$Altitude
datapreci_dup$preci04 <- datapreci_dup$preci04 - g_preci_dupli * datapreci_dup$Altitude
datapreci_dup$preci05 <- datapreci_dup$preci05 - g_preci_dupli * datapreci_dup$Altitude
datapreci_dup$preci06 <- datapreci_dup$preci06 - g_preci_dupli * datapreci_dup$Altitude
datapreci_dup$preci07 <- datapreci_dup$preci07 - g_preci_dupli * datapreci_dup$Altitude
datapreci_dup$preci08 <- datapreci_dup$preci08 - g_preci_dupli * datapreci_dup$Altitude
datapreci_dup$preci09 <- datapreci_dup$preci09 - g_preci_dupli * datapreci_dup$Altitude
datapreci_dup$preci10 <- datapreci_dup$preci10 - g_preci_dupli * datapreci_dup$Altitude
datapreci_dup$preci11 <- datapreci_dup$preci11 - g_preci_dupli * datapreci_dup$Altitude
datapreci_dup$preci12 <- datapreci_dup$preci12 - g_preci_dupli * datapreci_dup$Altitude

# températures - gradient dupli
datatemp_dup$temp01 <- datatemp_dup$temp01 - g_temp_dupli * datatemp_dup$Altitude
datatemp_dup$temp02 <- datatemp_dup$temp02 - g_temp_dupli * datatemp_dup$Altitude
datatemp_dup$temp03 <- datatemp_dup$temp03 - g_temp_dupli * datatemp_dup$Altitude
datatemp_dup$temp04 <- datatemp_dup$temp04 - g_temp_dupli * datatemp_dup$Altitude
datatemp_dup$temp05 <- datatemp_dup$temp05 - g_temp_dupli * datatemp_dup$Altitude
datatemp_dup$temp06 <- datatemp_dup$temp06 - g_temp_dupli * datatemp_dup$Altitude
datatemp_dup$temp07 <- datatemp_dup$temp07 - g_temp_dupli * datatemp_dup$Altitude
datatemp_dup$temp08 <- datatemp_dup$temp08 - g_temp_dupli * datatemp_dup$Altitude
datatemp_dup$temp09 <- datatemp_dup$temp09 - g_temp_dupli * datatemp_dup$Altitude
datatemp_dup$temp10 <- datatemp_dup$temp10 - g_temp_dupli * datatemp_dup$Altitude
datatemp_dup$temp11 <- datatemp_dup$temp11 - g_temp_dupli * datatemp_dup$Altitude
datatemp_dup$temp12 <- datatemp_dup$temp12 - g_temp_dupli * datatemp_dup$Altitude

# modif des données
datapreci_dup <- st_transform(datapreci_dup,CRS("+init=epsg:2154"))
datapreci_dup$Altitude <- 0 # applique altitude 0 = niveau de la mer
datapreci_dup$idPoint <- as.character(as.integer(datapreci_dup$idPoint)*1000) # modifie les identifiants


#######################
# tous les points     #
#######################

datapreci <- st_transform(datapreci,CRS("+init=epsg:2154"))

datapreci <- rbind(datapreci,datapreci_dup)
datapreci$X <- st_coordinates(datapreci)[,1]
datapreci$Y <- st_coordinates(datapreci)[,2]

datapreci <- as.data.frame(datapreci)

datatemp_dup <- st_transform(datatemp_dup,CRS("+init=epsg:2154"))
datatemp_dup$Altitude <- 0
datatemp_dup$idPoint <- as.character(as.integer(datatemp_dup$idPoint)*1000) 

datatemp <- st_transform(datatemp,CRS("+init=epsg:2154"))
datatemp <- rbind(datatemp,datatemp_dup)
datatemp$X <- st_coordinates(datatemp)[,1]
datatemp$Y <- st_coordinates(datatemp)[,2]

datatemp <- as.data.frame(datatemp)

# toutes les données precip, temp et dupli ensemble
data <- merge(datatemp, datapreci, by = c('idPoint'))

# ######### #
# calculs : #
# ######### #

# précipitations
data$preci01_b<- data$preci01 - g_preci * data$Altitude.x
data$preci02_b <- data$preci02 - g_preci * data$Altitude.x
data$preci03_b <- data$preci03 - g_preci * data$Altitude.x
data$preci04_b <- data$preci04 - g_preci * data$Altitude.x
data$preci05_b <- data$preci05 - g_preci * data$Altitude.x
data$preci06_b <- data$preci06 - g_preci * data$Altitude.x
data$preci07_b <- data$preci07 - g_preci * data$Altitude.x
data$preci08_b <- data$preci08 - g_preci * data$Altitude.x
data$preci09_b <- data$preci09 - g_preci * data$Altitude.x
data$preci10_b <- data$preci10 - g_preci * data$Altitude.x
data$preci11_b <- data$preci11 - g_preci * data$Altitude.x
data$preci12_b <- data$preci12 - g_preci * data$Altitude.x

# températures
data$temp01_b <- data$temp01 - g_temp * data$Altitude.x
data$temp02_b <- data$temp02 - g_temp * data$Altitude.x
data$temp03_b <- data$temp03 - g_temp * data$Altitude.x
data$temp04_b <- data$temp04 - g_temp * data$Altitude.x
data$temp05_b <- data$temp05 - g_temp * data$Altitude.x
data$temp06_b <- data$temp06 - g_temp * data$Altitude.x
data$temp07_b <- data$temp07 - g_temp * data$Altitude.x
data$temp08_b <- data$temp08 - g_temp * data$Altitude.x
data$temp09_b <- data$temp09 - g_temp * data$Altitude.x
data$temp10_b <- data$temp10 - g_temp * data$Altitude.x
data$temp11_b <- data$temp11 - g_temp * data$Altitude.x
data$temp12_b <- data$temp12 - g_temp * data$Altitude.x

# ################# #
# sorties RESULTATS #
# ################# #

# résultats en sortie, format shp
# ordonnées à l'origine, précipitations
points <- data[,c(1:2,16:17,34:45)]
coordinates(points) <- ~X.x+Y.x
proj4string(points) <- CRS("+init=epsg:2154") # Lambert 93
points <- vect(points) # conversion en format Terra
writeVector(points, paste("preci01_12_",nomsortie,'_b','.shp',sep=""),filetype ='ESRI Shapefile', overwrite=TRUE)

# ordonnées à l'origine, températures
points <- data[,c(1:2,16:17,46:57)]
coordinates(points) <- ~X.x+Y.x
proj4string(points) <- CRS("+init=epsg:2154") # Lambert 93
points <- vect(points) # conversion en format Terra
writeVector(points, paste("temp01_12_",nomsortie,'_b','.shp',sep=""),filetype ='ESRI Shapefile', overwrite=TRUE)