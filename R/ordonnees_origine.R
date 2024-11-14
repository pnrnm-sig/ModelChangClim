# Parc naturel régional & Géoparc Normandie-Maine - version du 15/10/2024

#
# étape pré-krigeage :calculs des ordonnées à l'origine : température, précipitations
# (à une altitude théorique de 0, en fonction des gradients)
# (voir méthodo pour le détail du calcul des gradients en fonction de la zone d'étude)
# Modifier les paramètres en entrées en fonction du projet (gradients, chemin, nom, etc.)
# et aussi nom en sortie
#

# ######################## #
# paramètres en entrées :  #
# ######################## #

# gradients : variation  par mètres de températures (moyenne) et précipitation (cumul par mois)
g_temp <- -0.0042
g_preci <- 0.0821

# charger les données
chemin <- 'S:\\4_METIERS\\Environnement\\ChangClim\\ReproModel2023\\data\\entrees\\DRIAS_dc2020\\'
nom <- 'horizon_lointain_85'

nom2 <- paste(nom,"_moyennes_mensuelles_reformat",sep="")
extension <- '.csv'

fichierentree <- paste(chemin,nom2,extension,sep='')
data <- read.csv(fichierentree, sep = ",", dec = ".")

# # 'pr' 'hp45' 'hp85' 'hm45' 'hm85' 'hl45' 'hl85'
nomsortie <- "hl85" # nom du fichier résultats

# ######### #
# calculs : #
# ######### #

# précipitations
data$preci01_b <- data$preci01 - g_preci * data$Altitude
data$preci02_b <- data$preci02 - g_preci * data$Altitude
data$preci03_b <- data$preci03 - g_preci * data$Altitude
data$preci04_b <- data$preci04 - g_preci * data$Altitude
data$preci05_b <- data$preci05 - g_preci * data$Altitude
data$preci06_b <- data$preci06 - g_preci * data$Altitude
data$preci07_b <- data$preci07 - g_preci * data$Altitude
data$preci08_b <- data$preci08 - g_preci * data$Altitude
data$preci09_b <- data$preci09 - g_preci * data$Altitude
data$preci10_b <- data$preci10 - g_preci * data$Altitude
data$preci11_b <- data$preci11 - g_preci * data$Altitude
data$preci12_b <- data$preci12 - g_preci * data$Altitude

# températures
data$temp01_b <- data$temp01 - g_temp * data$Altitude
data$temp02_b <- data$temp02 - g_temp * data$Altitude
data$temp03_b <- data$temp03 - g_temp * data$Altitude
data$temp04_b <- data$temp04 - g_temp * data$Altitude
data$temp05_b <- data$temp05 - g_temp * data$Altitude
data$temp06_b <- data$temp06 - g_temp * data$Altitude
data$temp07_b <- data$temp07 - g_temp * data$Altitude
data$temp08_b <- data$temp08 - g_temp * data$Altitude
data$temp09_b <- data$temp09 - g_temp * data$Altitude
data$temp10_b <- data$temp10 - g_temp * data$Altitude
data$temp11_b <- data$temp11 - g_temp * data$Altitude
data$temp12_b <- data$temp12 - g_temp * data$Altitude

# ################# #
# sorties RESULTATS #
# ################# #

# résultats en sortie, format shp

# ordonnées à l'origine, précipitations
# # VERIFIER que les bonnes colonnes sont bien sélectionnées

points <- data[,c(1:4,41:52)]
coordinates(points) <- ~LambertX+LambertY
proj4string(points) <- CRS("+init=epsg:27572") # Lambert II carto étendu
points <- sp::spTransform(points,CRS("+init=epsg:2154")) # Lambert 93
points <- vect(points) # conversion en format Terra
writeVector(points, paste("preci01_12_",nomsortie,'_b','.shp',sep=""),filetype ='ESRI Shapefile', overwrite=TRUE)

# ordonnées à l'origine, températures
# # VERIFIER que les bonnes colonnes sont bien sélectionnées
points <- data[,c(1:4,53:64)]
coordinates(points) <- ~LambertX+LambertY
proj4string(points) <- CRS("+init=epsg:27572") # Lambert II carto étendu
points <- sp::spTransform(points,CRS("+init=epsg:2154")) # Lambert 93
points <- vect(points) # conversion en format Terra
writeVector(points, paste("temp01_12_",nomsortie,'_b','.shp',sep=""),filetype ='ESRI Shapefile', overwrite=TRUE)