# Parc naturel régional & Géoparc Normandie-Maine - version du 15/10/2024

#
# étape désagrégation spatiale, pour le rayonnement solaire après l'interpolation
#
# affine le résultat de désagrégation du rayonnement solaire interpoléà partir des données DRIAS
# en utilisant les expositions (ratio ray sol modifié)
#
# (changer les variables "chemin", "nom", etc, en fonction de votre projet)
#

# ######################## #
# paramètres en entrées :  #
# ######################## #

# # chemins et variables à changer en fonction

chemin<- 'S:\\4_METIERS\\Environnement\\ChangClim\\ReproModel2023\\data'

dossier <- '\\intermed\\PR\\RSol_krige' # dossier rayonnement solaire DRIAS interpolé
dossier1 <- '\\intermed\\RSol_SAGA\\ratio' # dossier ratio exposition

p <- 'pr' # période/scénario : pr, hp45, hp85, hm45, hm85, hl45, hl85, ...

# ######################## #
#         calculs          #
# ######################## #
# boucle par mois
mois <- c('01','02','03','04','05','06','07','08','09','10','11','12')

# ######################## #
#         sorties          #
# ######################## #
# calculs températures désagrégées
for(m in mois){
  
  rsdrias <- raster(paste(chemin,dossier,'\\rsds',m,'Jcm2_',p,'_krige.sdat',sep='')) # nom et format de fichier à vérifier en fonction du projet
  ratio <- raster(paste(chemin,dossier1,'\\ratio',m,'_mod.tif',sep=''))
  ratio <- crop(ratio,rsdrias)
  
  desag <- rsdrias*ratio
  writeRaster(desag,paste('\\rsds',m,'Jcm2_',p,'_expo.tif',sep=''),format="GTiff") # enregistre dans le dossier courant
  
}
