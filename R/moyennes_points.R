# Parc naturel régional & Géoparc Normandie-Maine - version du 15/10/2024

#
# charger les données DRIAS téléchargées (quotidiennes corrigées),
# calculs et prétraitements (moyennes, reformatage)
# Modifier les variables "chemin" et 'nom" ci-dessous en fonction
#

# ######################## #
# paramètres en entrées :  #
# ######################## #

# # dossier dans lequel se trouve les fichiers de données téléchargées DRIAS
chemin <- 'S:/4_METIERS/Environnement/ChangClim/ReproModel2023/data/entrees/DRIAS_dc2020/'

# # nom du fichier en entrée 
# # exemples : 'periode_reference' 'horizon_proche_45' 'horizon_proche_85' 'horizon_moyen_45' 'horizon_moyen_85' 'horizon_lointain_45' 'horizon_lointain_85'
nom <- 'horizon_lointain_85'
nom2 <- paste(nom,"_DRIAS",sep="")

# # période et scénarios
# # 'pr' 'hp45' 'hp85' 'hm45' 'hm85' 'hl45' 'hl85'
p <- 'hl85'

# # extension du fichier de données (.txt ou .csv)
extension <- '.txt'
fichierentree <- paste(chemin,nom2,extension,sep='')

# # modifier la valeur "skip" (nombre de ligne sautées) si besoin
# # vérfier les noms ("col.names") et format des colonnes ("col.classes") en fonction des variables du fichier en entrée
data <- read.csv(fichierentree, sep = ";", header = FALSE,
                 dec = ".",skip=53, # nombre de lignes à passer du fichier texte / vérifier la première ligne : premier jour de janvier
                 col.names=c("idPoint","LambertX","LambertY","Altitude",
                             "An","Mois","Jour","tasAdjust","prtotAdjust","rsdsAdjust"),
                 colClasses=c("factor","integer","integer","integer",
                              "factor","factor","factor","numeric",
                              "numeric","numeric"))

# ######### #
# calculs : #
# ######### #

# calcul des cumul de précipitations pour chaque mois de chaque année
precip_sum_jour <-  aggregate(prtotAdjust ~ idPoint + Mois + An, data, sum)
# calcul des moyennes mensuelles des cumul de précipitations
precip <-  aggregate(prtotAdjust ~ idPoint + Mois, precip_sum_jour, mean)
# calcul des moyennes mensuelles de températures
temp <- aggregate(tasAdjust ~ idPoint + Mois, data, mean)
# calcul des moyennes mensuelles du rayonnement solaire
rs <-  aggregate(rsdsAdjust ~ idPoint + Mois, data, mean)

# regrouper les données, en lignes
data2 <- data[,c(1:4,6)] 
data_reference <- unique(join_all(list(data2, precip, temp, rs), by=c("idPoint","Mois"), type='left'))

# modifier pour regrouper par colonne variables*mois
data_reference2 <- unique(data_reference[,1:4])

# preci = cumul des précipitations en mm
data_reference2$preci01 <- data_reference$prtotAdjust[data_reference$Mois == '01']
data_reference2$preci02 <- data_reference$prtotAdjust[data_reference$Mois == '02']
data_reference2$preci03 <- data_reference$prtotAdjust[data_reference$Mois == '03']
data_reference2$preci04 <- data_reference$prtotAdjust[data_reference$Mois == '04']
data_reference2$preci05 <- data_reference$prtotAdjust[data_reference$Mois == '05']
data_reference2$preci06 <- data_reference$prtotAdjust[data_reference$Mois == '06']
data_reference2$preci07 <- data_reference$prtotAdjust[data_reference$Mois == '07']
data_reference2$preci08 <- data_reference$prtotAdjust[data_reference$Mois == '08']
data_reference2$preci09 <- data_reference$prtotAdjust[data_reference$Mois == '09']
data_reference2$preci10 <- data_reference$prtotAdjust[data_reference$Mois == '10']
data_reference2$preci11 <- data_reference$prtotAdjust[data_reference$Mois == '11']
data_reference2$preci12 <- data_reference$prtotAdjust[data_reference$Mois == '12']

# temp = température moyenne, en °C
data_reference2$temp01 <- data_reference$tasAdjust[data_reference$Mois == '01']
data_reference2$temp02 <- data_reference$tasAdjust[data_reference$Mois == '02']
data_reference2$temp03 <- data_reference$tasAdjust[data_reference$Mois == '03']
data_reference2$temp04 <- data_reference$tasAdjust[data_reference$Mois == '04']
data_reference2$temp05 <- data_reference$tasAdjust[data_reference$Mois == '05']
data_reference2$temp06 <- data_reference$tasAdjust[data_reference$Mois == '06']
data_reference2$temp07 <- data_reference$tasAdjust[data_reference$Mois == '07']
data_reference2$temp08 <- data_reference$tasAdjust[data_reference$Mois == '08']
data_reference2$temp09 <- data_reference$tasAdjust[data_reference$Mois == '09']
data_reference2$temp10 <- data_reference$tasAdjust[data_reference$Mois == '10']
data_reference2$temp11 <- data_reference$tasAdjust[data_reference$Mois == '11']
data_reference2$temp12 <- data_reference$tasAdjust[data_reference$Mois == '12']

# rsds = rayonnement solaire incident, en W/m2
data_reference2$rsds01 <- data_reference$rsdsAdjust[data_reference$Mois == '01']
data_reference2$rsds02 <- data_reference$rsdsAdjust[data_reference$Mois == '02']
data_reference2$rsds03 <- data_reference$rsdsAdjust[data_reference$Mois == '03']
data_reference2$rsds04 <- data_reference$rsdsAdjust[data_reference$Mois == '04']
data_reference2$rsds05 <- data_reference$rsdsAdjust[data_reference$Mois == '05']
data_reference2$rsds06 <- data_reference$rsdsAdjust[data_reference$Mois == '06']
data_reference2$rsds07 <- data_reference$rsdsAdjust[data_reference$Mois == '07']
data_reference2$rsds08 <- data_reference$rsdsAdjust[data_reference$Mois == '08']
data_reference2$rsds09 <- data_reference$rsdsAdjust[data_reference$Mois == '09']
data_reference2$rsds10 <- data_reference$rsdsAdjust[data_reference$Mois == '10']
data_reference2$rsds11 <- data_reference$rsdsAdjust[data_reference$Mois == '11']
data_reference2$rsds12 <- data_reference$rsdsAdjust[data_reference$Mois == '12']

# ################# #
# sorties RESULTATS #
# ################# #

# export en csv => dans le dossier de travail. cf. getwd()
# # modifier le nom du fichier en sortie en fonction
write.csv(x = data_reference, file = paste("./",nom,"_moyennes_mensuelles",".csv",sep=''),row.names = F)
write.csv(x = data_reference2, file = paste("./",nom,"_moyennes_mensuelles_reformat",".csv",sep=''),row.names = F)

# # format shp
# # précipitations
points <- data_reference2[,c(1:4,5:16)]
coordinates(points) <- ~LambertX+LambertY
proj4string(points) <- CRS("+init=epsg:27572") # Lambert II carto étendu
points <- sp::spTransform(points,CRS("+init=epsg:2154")) # Lambert 93
points <- vect(points) # conversion en format Terra
writeVector(points, paste("preci01_12_",p,'.shp',sep=""),filetype ='ESRI Shapefile', overwrite=TRUE)

# # températures
points <- data_reference2[,c(1:4,17:28)]
coordinates(points) <- ~LambertX+LambertY
proj4string(points) <- CRS("+init=epsg:27572") # Lambert II carto étendu
points <- sp::spTransform(points,CRS("+init=epsg:2154")) # Lambert 93
points <- vect(points) # conversion en format Terra
writeVector(points, paste("temp01_12_",p,'.shp',sep=""),filetype ='ESRI Shapefile', overwrite=TRUE)

# 
# quadrillage drias
#

# # executer les lignes suivantes pour créer les fichiers de points "quadrillages drias" en plus (uniquement les géométries)
# # (il n'est pas nécessaire de refaire ce traitement plusieurs fois)
# format csv
write.csv(x = unique(data_reference[,1:4]), file = "./quadrillage_points_drias.csv",row.names = F) # XY en Lambert II carto étendu

# format shp
points <- unique(data_reference[,1:4])
coordinates(points) <- ~LambertX+LambertY
proj4string(points) <- CRS("+init=epsg:27572") # Lambert II carto étendu
points <- sp::spTransform(points,CRS("+init=epsg:2154")) # Lambert 93
points <- vect(points) # conversion en format Terra
writeVector(points, paste("quadrillage_points_drias",'.shp',sep=""),filetype ='ESRI Shapefile', overwrite=TRUE)

