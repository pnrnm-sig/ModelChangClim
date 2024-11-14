# Parc naturel régional & Géoparc Normandie-Maine - version du 15/10/2024

#
# lancer ce script pour installer / charger les librairies requises
#

if(!require('sp')){install.packages('sp')}else{library(sp)}
if(!require('terra')){install.packages('terra')}else{library(terra)}
if(!require('sf')){install.packages('sf')}else{library(sf)}
if(!require('raster')){install.packages('raster')}else{library(raster)}
if(!require('SpatialPosition')){install.packages('SpatialPosition')}else{library(SpatialPosition)}
if(!require('plyr')){install.packages('plyr')}else{library(plyr)}
