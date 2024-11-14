:: Parc naturel régional & Géoparc Normandie-Maine - version du 15/10/2024
:: Automatisation du calcul du RS par mois avec l'outil "ta_lighting" (potential incomming solar radiation) de SAGA

:: FONCTIONNEMENT : ouvrir OSGeo4W Shell et executer ce script depuis la fenêtre de commande (il faut le paramétrer avant)

:: PARAMETRAGE : éditer (avec Notepad++ par exemple) 
:: remplacer si besoin le chemin du logiciel exécutbale de SAGA : C:\"Program Files"\"QGIS 3.22.14"\apps\saga\
:: remplacer les variables, cf. doc sur https://saga-gis.sourceforge.io/saga_tool_doc/2.2.0/ta_lighting_2.html
:: :: MNT, format SAGA, avec la projection définie dans SAGA: "C:\Users\rlouvet\Desktop\RS\MNT_zone_etude_filled.sgrd"
:: :: output (MM = mois ; YY = année): rayonnement direct : "C:\Users\rlouvet\Desktop\RS\Direct MM YY.sgrd"
:: :: output : rayonnement difus : "C:\Users\rlouvet\Desktop\RS\Diffus MM YY.sgrd"
:: :: output : rayonnement total : "C:\Users\rlouvet\Desktop\RS\Total MM YY.sgrd"
:: :: dates : -DAY=YYYY-MM-DD -DAY_STOP=YYYY-MM-DD exemple : -DAY=2051-12-01 -DAY_STOP=2051-12-31

:: NB : l'année est importante uniquement pour l'année bisextile (1 jour en plus)

:: janvier
C:\"Program Files"\"QGIS 3.22.14"\apps\saga\saga_cmd ta_lighting 2 -GRD_DEM="C:\Users\rlouvet\Desktop\RS\MNT_zone_etude_filled.sgrd" -GRD_DIRECT="C:\Users\rlouvet\Desktop\RS\Direct 01 52.sgrd" -GRD_DIFFUS="C:\Users\rlouvet\Desktop\RS\Diffus 01 52.sgrd" -GRD_TOTAL="C:\Users\rlouvet\Desktop\RS\Total 01 52.sgrd" -SOLARCONST=1367.000000 -LOCALSVF=1 -UNITS=2 -SHADOW=1 -LOCATION=1 -PERIOD=2 -DAY=2052-01-01 -DAY_STOP=2052-01-31 -DAYS_STEP=1 -HOUR_RANGE_MIN=0.000000 -HOUR_RANGE_MAX=24.000000 -HOUR_STEP=1.000000 -METHOD=2 -LUMPED=70.000000

:: février
C:\"Program Files"\"QGIS 3.22.14"\apps\saga\saga_cmd ta_lighting 2 -GRD_DEM="C:\Users\rlouvet\Desktop\RS\MNT_zone_etude_filled.sgrd" -GRD_DIRECT="C:\Users\rlouvet\Desktop\RS\Direct 02 52.sgrd" -GRD_DIFFUS="C:\Users\rlouvet\Desktop\RS\Diffus 02 52.sgrd" -GRD_TOTAL="C:\Users\rlouvet\Desktop\RS\Total 02 52.sgrd" -SOLARCONST=1367.000000 -LOCALSVF=1 -UNITS=2 -SHADOW=1 -LOCATION=1 -PERIOD=2 -DAY=2052-02-01 -DAY_STOP=2052-02-29 -DAYS_STEP=1 -HOUR_RANGE_MIN=0.000000 -HOUR_RANGE_MAX=24.000000 -HOUR_STEP=1.000000 -METHOD=2 -LUMPED=70.000000

:: mars
C:\"Program Files"\"QGIS 3.22.14"\apps\saga\saga_cmd ta_lighting 2 -GRD_DEM="C:\Users\rlouvet\Desktop\RS\MNT_zone_etude_filled.sgrd" -GRD_DIRECT="C:\Users\rlouvet\Desktop\RS\Direct 03 52.sgrd" -GRD_DIFFUS="C:\Users\rlouvet\Desktop\RS\Diffus 03 52.sgrd" -GRD_TOTAL="C:\Users\rlouvet\Desktop\RS\Total 03 52.sgrd" -SOLARCONST=1367.000000 -LOCALSVF=1 -UNITS=2 -SHADOW=1 -LOCATION=1 -PERIOD=2 -DAY=2052-03-01 -DAY_STOP=2052-03-31 -DAYS_STEP=1 -HOUR_RANGE_MIN=0.000000 -HOUR_RANGE_MAX=24.000000 -HOUR_STEP=1.000000 -METHOD=2 -LUMPED=70.000000

:: avril
C:\"Program Files"\"QGIS 3.22.14"\apps\saga\saga_cmd ta_lighting 2 -GRD_DEM="C:\Users\rlouvet\Desktop\RS\MNT_zone_etude_filled.sgrd" -GRD_DIRECT="C:\Users\rlouvet\Desktop\RS\Direct 04 52.sgrd" -GRD_DIFFUS="C:\Users\rlouvet\Desktop\RS\Diffus 04 52.sgrd" -GRD_TOTAL="C:\Users\rlouvet\Desktop\RS\Total 04 52.sgrd" -SOLARCONST=1367.000000 -LOCALSVF=1 -UNITS=2 -SHADOW=1 -LOCATION=1 -PERIOD=2 -DAY=2052-04-01 -DAY_STOP=2052-04-30 -DAYS_STEP=1 -HOUR_RANGE_MIN=0.000000 -HOUR_RANGE_MAX=24.000000 -HOUR_STEP=1.000000 -METHOD=2 -LUMPED=70.000000

:: mai
C:\"Program Files"\"QGIS 3.22.14"\apps\saga\saga_cmd ta_lighting 2 -GRD_DEM="C:\Users\rlouvet\Desktop\RS\MNT_zone_etude_filled.sgrd" -GRD_DIRECT="C:\Users\rlouvet\Desktop\RS\Direct 05 52.sgrd" -GRD_DIFFUS="C:\Users\rlouvet\Desktop\RS\Diffus 05 52.sgrd" -GRD_TOTAL="C:\Users\rlouvet\Desktop\RS\Total 05 52.sgrd" -SOLARCONST=1367.000000 -LOCALSVF=1 -UNITS=2 -SHADOW=1 -LOCATION=1 -PERIOD=2 -DAY=2052-05-01 -DAY_STOP=2052-05-31 -DAYS_STEP=1 -HOUR_RANGE_MIN=0.000000 -HOUR_RANGE_MAX=24.000000 -HOUR_STEP=1.000000 -METHOD=2 -LUMPED=70.000000

:: juin
C:\"Program Files"\"QGIS 3.22.14"\apps\saga\saga_cmd ta_lighting 2 -GRD_DEM="C:\Users\rlouvet\Desktop\RS\MNT_zone_etude_filled.sgrd" -GRD_DIRECT="C:\Users\rlouvet\Desktop\RS\Direct 06 52.sgrd" -GRD_DIFFUS="C:\Users\rlouvet\Desktop\RS\Diffus 06 52.sgrd" -GRD_TOTAL="C:\Users\rlouvet\Desktop\RS\Total 06 52.sgrd" -SOLARCONST=1367.000000 -LOCALSVF=1 -UNITS=2 -SHADOW=1 -LOCATION=1 -PERIOD=2 -DAY=2052-06-01 -DAY_STOP=2052-06-30 -DAYS_STEP=1 -HOUR_RANGE_MIN=0.000000 -HOUR_RANGE_MAX=24.000000 -HOUR_STEP=1.000000 -METHOD=2 -LUMPED=70.000000

:: juillet
C:\"Program Files"\"QGIS 3.22.14"\apps\saga\saga_cmd ta_lighting 2 -GRD_DEM="C:\Users\rlouvet\Desktop\RS\MNT_zone_etude_filled.sgrd" -GRD_DIRECT="C:\Users\rlouvet\Desktop\RS\Direct 07 52.sgrd" -GRD_DIFFUS="C:\Users\rlouvet\Desktop\RS\Diffus 07 52.sgrd" -GRD_TOTAL="C:\Users\rlouvet\Desktop\RS\Total 07 52.sgrd" -SOLARCONST=1367.000000 -LOCALSVF=1 -UNITS=2 -SHADOW=1 -LOCATION=1 -PERIOD=2 -DAY=2052-07-01 -DAY_STOP=2052-07-31 -DAYS_STEP=1 -HOUR_RANGE_MIN=0.000000 -HOUR_RANGE_MAX=24.000000 -HOUR_STEP=1.000000 -METHOD=2 -LUMPED=70.000000

:: aout
C:\"Program Files"\"QGIS 3.22.14"\apps\saga\saga_cmd ta_lighting 2 -GRD_DEM="C:\Users\rlouvet\Desktop\RS\MNT_zone_etude_filled.sgrd" -GRD_DIRECT="C:\Users\rlouvet\Desktop\RS\Direct 08 52.sgrd" -GRD_DIFFUS="C:\Users\rlouvet\Desktop\RS\Diffus 08 52.sgrd" -GRD_TOTAL="C:\Users\rlouvet\Desktop\RS\Total 08 52.sgrd" -SOLARCONST=1367.000000 -LOCALSVF=1 -UNITS=2 -SHADOW=1 -LOCATION=1 -PERIOD=2 -DAY=2052-08-01 -DAY_STOP=2052-08-31 -DAYS_STEP=1 -HOUR_RANGE_MIN=0.000000 -HOUR_RANGE_MAX=24.000000 -HOUR_STEP=1.000000 -METHOD=2 -LUMPED=70.000000

:: septembre
C:\"Program Files"\"QGIS 3.22.14"\apps\saga\saga_cmd ta_lighting 2 -GRD_DEM="C:\Users\rlouvet\Desktop\RS\MNT_zone_etude_filled.sgrd" -GRD_DIRECT="C:\Users\rlouvet\Desktop\RS\Direct 09 52.sgrd" -GRD_DIFFUS="C:\Users\rlouvet\Desktop\RS\Diffus 09 52.sgrd" -GRD_TOTAL="C:\Users\rlouvet\Desktop\RS\Total 09 52.sgrd" -SOLARCONST=1367.000000 -LOCALSVF=1 -UNITS=2 -SHADOW=1 -LOCATION=1 -PERIOD=2 -DAY=2052-09-01 -DAY_STOP=2052-09-30 -DAYS_STEP=1 -HOUR_RANGE_MIN=0.000000 -HOUR_RANGE_MAX=24.000000 -HOUR_STEP=1.000000 -METHOD=2 -LUMPED=70.00000

:: octobre
C:\"Program Files"\"QGIS 3.22.14"\apps\saga\saga_cmd ta_lighting 2 -GRD_DEM="C:\Users\rlouvet\Desktop\RS\MNT_zone_etude_filled.sgrd" -GRD_DIRECT="C:\Users\rlouvet\Desktop\RS\Direct 10 52.sgrd" -GRD_DIFFUS="C:\Users\rlouvet\Desktop\RS\Diffus 10 52.sgrd" -GRD_TOTAL="C:\Users\rlouvet\Desktop\RS\Total 10 52.sgrd" -SOLARCONST=1367.000000 -LOCALSVF=1 -UNITS=2 -SHADOW=1 -LOCATION=1 -PERIOD=2 -DAY=2052-10-01 -DAY_STOP=2052-10-31 -DAYS_STEP=1 -HOUR_RANGE_MIN=0.000000 -HOUR_RANGE_MAX=24.000000 -HOUR_STEP=1.000000 -METHOD=2 -LUMPED=70.00000

:: novembre
C:\"Program Files"\"QGIS 3.22.14"\apps\saga\saga_cmd ta_lighting 2 -GRD_DEM="C:\Users\rlouvet\Desktop\RS\MNT_zone_etude_filled.sgrd" -GRD_DIRECT="C:\Users\rlouvet\Desktop\RS\Direct 11 52.sgrd" -GRD_DIFFUS="C:\Users\rlouvet\Desktop\RS\Diffus 11 52.sgrd" -GRD_TOTAL="C:\Users\rlouvet\Desktop\RS\Total 11 52.sgrd" -SOLARCONST=1367.000000 -LOCALSVF=1 -UNITS=2 -SHADOW=1 -LOCATION=1 -PERIOD=2 -DAY=2052-11-01 -DAY_STOP=2052-11-30 -DAYS_STEP=1 -HOUR_RANGE_MIN=0.000000 -HOUR_RANGE_MAX=24.000000 -HOUR_STEP=1.000000 -METHOD=2 -LUMPED=70.00000

:: decembre
C:\"Program Files"\"QGIS 3.22.14"\apps\saga\saga_cmd ta_lighting 2 -GRD_DEM="C:\Users\rlouvet\Desktop\RS\MNT_zone_etude_filled.sgrd" -GRD_DIRECT="C:\Users\rlouvet\Desktop\RS\Direct 12 52.sgrd" -GRD_DIFFUS="C:\Users\rlouvet\Desktop\RS\Diffus 12 52.sgrd" -GRD_TOTAL="C:\Users\rlouvet\Desktop\RS\Total 12 52.sgrd" -SOLARCONST=1367.000000 -LOCALSVF=1 -UNITS=2 -SHADOW=1 -LOCATION=1 -PERIOD=2 -DAY=2052-12-01 -DAY_STOP=2052-12-31 -DAYS_STEP=1 -HOUR_RANGE_MIN=0.000000 -HOUR_RANGE_MAX=24.000000 -HOUR_STEP=1.000000 -METHOD=2 -LUMPED=70.00000
