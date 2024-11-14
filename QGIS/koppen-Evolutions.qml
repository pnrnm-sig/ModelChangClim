<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis version="3.16.16-Hannover" styleCategories="AllStyleCategories" minScale="1e+08" hasScaleBasedVisibilityFlag="0" maxScale="0">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
  </flags>
  <temporal enabled="0" fetchMode="0" mode="0">
    <fixedRange>
      <start></start>
      <end></end>
    </fixedRange>
  </temporal>
  <customproperties>
    <property key="WMSBackgroundLayer" value="false"/>
    <property key="WMSPublishDataSourceUrl" value="false"/>
    <property key="embeddedWidgets/count" value="0"/>
    <property key="identify/format" value="Value"/>
  </customproperties>
  <pipe>
    <provider>
      <resampling enabled="false" zoomedInResamplingMethod="nearestNeighbour" zoomedOutResamplingMethod="nearestNeighbour" maxOversampling="2"/>
    </provider>
    <rasterrenderer opacity="1" band="1" nodataColor="" type="paletted" alphaBand="-1">
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
        <paletteEntry value="2211" color="#003223" label="&quot;danubisation&quot; à l'horizon 2070" alpha="255"/>
        <paletteEntry value="2212" color="#6eb79d" label="évolution incertaine : &quot;danubisation&quot; à l'horizon 2070, maintien du climat océanique à l'horizon 2100" alpha="255"/>
        <paletteEntry value="2213" color="#daf67c" label="évolution incertaine : &quot;danubisation&quot; à l'horizon 2070, &quot;méditerranéisation&quot; à l'horizon 2100" alpha="255"/>
        <paletteEntry value="2214" color="#cccd64" label="évolution incertaine : &quot;danubisation&quot; à l'horizon 2070, &quot;charentaisation&quot; à l'horizon 2100" alpha="255"/>
        <paletteEntry value="2221" color="#265526" label="&quot;danubisation&quot; à l'horizon 2100" alpha="255"/>
        <paletteEntry value="2222" color="#0fb70f" label="évolution moindre : maintien du climat océanique" alpha="255"/>
        <paletteEntry value="2223" color="#f6f67c" label="&quot;méditerranéisation&quot; à l'horizon 2100" alpha="255"/>
        <paletteEntry value="2224" color="#efc164" label="&quot;charentaisation&quot; à l'horizon 2100" alpha="255"/>
        <paletteEntry value="2233" color="#ff6200" label="&quot;méditerranéisation&quot; à l'horizon 2070" alpha="255"/>
        <paletteEntry value="2243" color="#f6c4a7" label="évolution incertaine : &quot;charentaisation&quot; à l'horizon 2070, &quot;méditerranéisation&quot; à l'horizon 2100" alpha="255"/>
        <paletteEntry value="2244" color="#d0a857" label="&quot;charentaisation&quot; à l'horizon 2070" alpha="255"/>
      </colorPalette>
      <colorramp name="[source]" type="randomcolors"/>
    </rasterrenderer>
    <brightnesscontrast contrast="0" brightness="0" gamma="1"/>
    <huesaturation colorizeGreen="128" grayscaleMode="0" saturation="0" colorizeRed="255" colorizeBlue="128" colorizeStrength="100" colorizeOn="0"/>
    <rasterresampler maxOversampling="2"/>
    <resamplingStage>resamplingFilter</resamplingStage>
  </pipe>
  <blendMode>0</blendMode>
</qgis>
