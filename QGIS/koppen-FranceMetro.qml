<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis version="3.22.16-Białowieża" styleCategories="AllStyleCategories" maxScale="0" minScale="1e+08" hasScaleBasedVisibilityFlag="0">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
    <Private>0</Private>
  </flags>
  <temporal enabled="0" mode="0" fetchMode="0">
    <fixedRange>
      <start></start>
      <end></end>
    </fixedRange>
  </temporal>
  <customproperties>
    <Option type="Map">
      <Option name="WMSBackgroundLayer" value="false" type="QString"/>
      <Option name="WMSPublishDataSourceUrl" value="false" type="QString"/>
      <Option name="embeddedWidgets/count" value="0" type="QString"/>
      <Option name="identify/format" value="Value" type="QString"/>
    </Option>
  </customproperties>
  <pipe-data-defined-properties>
    <Option type="Map">
      <Option name="name" value="" type="QString"/>
      <Option name="properties"/>
      <Option name="type" value="collection" type="QString"/>
    </Option>
  </pipe-data-defined-properties>
  <pipe>
    <provider>
      <resampling zoomedInResamplingMethod="nearestNeighbour" enabled="false" zoomedOutResamplingMethod="nearestNeighbour" maxOversampling="2"/>
    </provider>
    <rasterrenderer band="1" nodataColor="" alphaBand="-1" type="paletted" opacity="1">
      <rasterTransparency/>
      <minMaxOrigin>
        <limits>None</limits>
        <extent>WholeRaster</extent>
        <statAccuracy>Estimated</statAccuracy>
        <cumulativeCutLower>0.02</cumulativeCutLower>
        <cumulativeCutUpper>0.98</cumulativeCutUpper>
        <stdDevFactor>2</stdDevFactor>
      </minMaxOrigin>
      <colorPalette>
        <paletteEntry alpha="255" value="9" color="#254525" label="Cfa - tempéré, humide toute l'année et été chaud  = océanique"/>
        <paletteEntry alpha="255" value="10" color="#0fb70f" label="Cfb - tempéré, humide toute l'année et été tempéré = océanique"/>
        <paletteEntry alpha="255" value="12" color="#f6f67c" label="Csa - tempéré, été plus sec et chaud = méditerranéen"/>
        <paletteEntry alpha="255" value="13" color="#efc164" label="Csb - tempéré, été plus sec et tempéré = méditerranéen, façade atlantique"/>
        <paletteEntry alpha="255" value="19" color="#0fcfdc" label="Dfb - continental, humide, été tempéré = montagnard"/>
        <paletteEntry alpha="255" value="20" color="#009dbc" label="Dfc - continental, humide, été frais = montagnard"/>
        <paletteEntry alpha="255" value="23" color="#ef4def" label="Dsb - continental, été sec et tempéré = continental méditerranéen"/>
        <paletteEntry alpha="255" value="30" color="#c2cece" label="ET - &quot;polaire&quot;, température moyenne froide, été froid = haute montagne"/>
      </colorPalette>
      <colorramp name="[source]" type="randomcolors">
        <Option/>
      </colorramp>
    </rasterrenderer>
    <brightnesscontrast brightness="0" gamma="1" contrast="0"/>
    <huesaturation colorizeOn="0" colorizeGreen="128" invertColors="0" colorizeStrength="100" saturation="0" grayscaleMode="0" colorizeRed="255" colorizeBlue="128"/>
    <rasterresampler maxOversampling="2"/>
    <resamplingStage>resamplingFilter</resamplingStage>
  </pipe>
  <blendMode>0</blendMode>
</qgis>
