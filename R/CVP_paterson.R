# Parc naturel régional & Géoparc Normandie-Maine - version du 15/10/2024

#
# calcul de l'indice CVP de Paterson, "Climat, Végétation, Productivité"
# changer les paramètres en fonction de votre projet
# voir le paramètre G pour des variations du résultat
#
# plusieurs résultats sont proposés pour G :
# - 1 = calculs par pixel // 2 = par zone d'étude
# - a = G quand temp mensuelle >=7
# - b = G quand Martonne mensuel >= 20
# - c = G quand temp mensuelle >=7 et P>=2T
#
# Le calcul de E peut être un peu long
#
#	Tv : température moyenne du mois le plus chaud, en °C 
#	Ta : la différence entre la température moyenne du mois le plus chaud et le mois le plus froid, en °C
#	P : précipitations annuelles cumulées moyennes
#	G : nombre de mois de la saison de végétation
#	E : facteur de réduction pour ETP, en fonction de la latitude, donné par une table. 

# ################# #
# données en entrée #
# ################# #

# période/scénario : pr, hp45, hp85, hm45, hm85, hl45, hl85, ...
p <- 'hl85' 

# chemin dossier températures
path1 <- paste('S:\\4_METIERS\\Environnement\\ChangClim\\ReproModel2023\\data\\results\\',toupper(p),'\\Temp_desag2\\',sep='')
# chemin précipitations
path2 <- paste('S:\\4_METIERS\\Environnement\\ChangClim\\ReproModel2023\\data\\results\\',toupper(p),'\\Prec_desag\\',sep='')

# chemin et fichier E (voir script pour calcul de E)
path3 <- './'
E <- raster(paste(path3,'E_paterson.tif',sep=''))

# ####### #
# calculs #
# ####### #

mois <- c('02','03','04','05','06','07','08','09','10','11','12')

# # températures mensuelles
temp <- raster(paste(path1,'temp','01','_',p,'_expo.tif',sep=''))
temps <- stack(temp)
for(m in mois){
  temp <- raster(paste(path1,'temp',m,'_',p,'_expo.tif',sep=''))
  temps <- stack(temps,temp)
}

# ############### #
#  précipitations annuelles
P <- raster(paste(path2,'preci_annuel_',p,'_alti.tif',sep=''))
# p mensuelles
preci <- raster(paste(path2,'preci','01','_',p,'_alti.tif',sep=''))
precis <- stack(preci)
for(m in mois){
  preci <- raster(paste(path2,'preci',m,'_',p,'_alti.tif',sep=''))
  precis <- stack(precis,preci)
}

# ############### #
# G, méthode 1 : pixels

# methode a
G_1a <- temps[[1]]>=7
for(i in 2:12){G_1a <- G_1a + (temps[[i]]>=7)}

plot(G_1a) # explo des résultats
barplot(G_1a)

# methode b # 20 : seuil pour l'agriculture sans irrigation. # 30 : seuil pour la forêt
G_1b <- ((precis[[1]]*12)/(temps[[1]]+10))>30
for(i in 2:12){G_1b <- G_1b + (((precis[[i]]*12)/(temps[[i]]+10))>30)}

plot(G_1b) # explo des résultats
barplot(G_1b)

# méthode C
G_1c <- (temps[[1]]>=7) * (precis[[1]]>=2*temps[[1]])
for(i in 2:12){G_1c <- G_1c + ((temps[[i]]>=7) * (precis[[i]]>(2*temps[[i]])))}

plot(G_1c) # explo des résultats
barplot(G_1c)

# ############### #
# G, méthode 2 : moyennes
## compte les mois où la moyenne du raster est supérieure ou égale à 7°C
temps_mean <- cellStats(temps,mean)
precis_mean <- cellStats(precis,mean)

# methode a
G_2a <- temps_mean>=7
G_2a <- sum(G_2a)

G_2a

# methode b
G_2b <- sum(((precis_mean*12)/(temps_mean+10))>20)
G_2b

# methode c
G_2c <- sum((temps_mean>=7) * (precis_mean>=2*(temps_mean)))
G_2c

# ############### #
# choix des mois pour Tv et Ta
boxplot(temps)
plot(temps[[1]]>temps[[2]])
plot(temps[[1]]>temps[[12]])
plot(temps[[8]]>temps[[9]])
plot(temps[[8]]>temps[[7]])

# mois le plus chaud : août. Le plus froid : janvier
Tv <- temps[[8]]
Ta <- temps[[8]]-temps[[1]]

#
# formule de calcul et fichiers en sortie
#
Ip_G1a <- Tv/Ta * P * G_1a/12 * E/100
Ip_G1b <- Tv/Ta * P * G_1b/12 * E/100
Ip_G1c <- Tv/Ta * P * G_1c/12 * E/100

Ip_G2a <- Tv/Ta * P * G_2a/12 * E/100
Ip_G2b <- Tv/Ta * P * G_2b/12 * E/100
Ip_G2c <- Tv/Ta * P * G_2c/12 * E/100

writeRaster(Ip_G1a,paste("Ip_G1a_",p,".tif"))
writeRaster(Ip_G1a,paste("Ip_G1b_",p,".tif"))
writeRaster(Ip_G1a,paste("Ip_G1c_",p,".tif"))

writeRaster(Ip_G1a,paste("Ip_G2a_",p,".tif"))
writeRaster(Ip_G1a,paste("Ip_G2b_",p,".tif"))
writeRaster(Ip_G1a,paste("Ip_G2c_",p,".tif"))
