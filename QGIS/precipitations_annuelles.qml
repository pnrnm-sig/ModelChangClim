<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis minScale="1e+08" hasScaleBasedVisibilityFlag="0" styleCategories="AllStyleCategories" version="3.34.9-Prizren" maxScale="0">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
    <Private>0</Private>
  </flags>
  <temporal mode="0" fetchMode="0" enabled="0">
    <fixedRange>
      <start></start>
      <end></end>
    </fixedRange>
  </temporal>
  <elevation symbology="Line" zoffset="0" zscale="1" enabled="0" band="1">
    <data-defined-properties>
      <Option type="Map">
        <Option type="QString" value="" name="name"/>
        <Option name="properties"/>
        <Option type="QString" value="collection" name="type"/>
      </Option>
    </data-defined-properties>
    <profileLineSymbol>
      <symbol type="line" force_rhr="0" alpha="1" clip_to_extent="1" is_animated="0" frame_rate="10" name="">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" value="" name="name"/>
            <Option name="properties"/>
            <Option type="QString" value="collection" name="type"/>
          </Option>
        </data_defined_properties>
        <layer locked="0" id="{230c05ea-8230-4764-a3ec-94b68840c113}" enabled="1" class="SimpleLine" pass="0">
          <Option type="Map">
            <Option type="QString" value="0" name="align_dash_pattern"/>
            <Option type="QString" value="square" name="capstyle"/>
            <Option type="QString" value="5;2" name="customdash"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="customdash_map_unit_scale"/>
            <Option type="QString" value="MM" name="customdash_unit"/>
            <Option type="QString" value="0" name="dash_pattern_offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="dash_pattern_offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="dash_pattern_offset_unit"/>
            <Option type="QString" value="0" name="draw_inside_polygon"/>
            <Option type="QString" value="bevel" name="joinstyle"/>
            <Option type="QString" value="145,82,45,255" name="line_color"/>
            <Option type="QString" value="solid" name="line_style"/>
            <Option type="QString" value="0.6" name="line_width"/>
            <Option type="QString" value="MM" name="line_width_unit"/>
            <Option type="QString" value="0" name="offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="offset_unit"/>
            <Option type="QString" value="0" name="ring_filter"/>
            <Option type="QString" value="0" name="trim_distance_end"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_end_map_unit_scale"/>
            <Option type="QString" value="MM" name="trim_distance_end_unit"/>
            <Option type="QString" value="0" name="trim_distance_start"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_start_map_unit_scale"/>
            <Option type="QString" value="MM" name="trim_distance_start_unit"/>
            <Option type="QString" value="0" name="tweak_dash_pattern_on_corners"/>
            <Option type="QString" value="0" name="use_custom_dash"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="width_map_unit_scale"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
    </profileLineSymbol>
    <profileFillSymbol>
      <symbol type="fill" force_rhr="0" alpha="1" clip_to_extent="1" is_animated="0" frame_rate="10" name="">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" value="" name="name"/>
            <Option name="properties"/>
            <Option type="QString" value="collection" name="type"/>
          </Option>
        </data_defined_properties>
        <layer locked="0" id="{5bf1b342-d153-4021-8d6a-b8b25b81c820}" enabled="1" class="SimpleFill" pass="0">
          <Option type="Map">
            <Option type="QString" value="3x:0,0,0,0,0,0" name="border_width_map_unit_scale"/>
            <Option type="QString" value="145,82,45,255" name="color"/>
            <Option type="QString" value="bevel" name="joinstyle"/>
            <Option type="QString" value="0,0" name="offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="offset_unit"/>
            <Option type="QString" value="35,35,35,255" name="outline_color"/>
            <Option type="QString" value="no" name="outline_style"/>
            <Option type="QString" value="0.26" name="outline_width"/>
            <Option type="QString" value="MM" name="outline_width_unit"/>
            <Option type="QString" value="solid" name="style"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
    </profileFillSymbol>
  </elevation>
  <customproperties>
    <Option type="Map">
      <Option type="bool" value="false" name="WMSBackgroundLayer"/>
      <Option type="bool" value="false" name="WMSPublishDataSourceUrl"/>
      <Option type="int" value="0" name="embeddedWidgets/count"/>
    </Option>
  </customproperties>
  <mapTip enabled="1"></mapTip>
  <pipe-data-defined-properties>
    <Option type="Map">
      <Option type="QString" value="" name="name"/>
      <Option name="properties"/>
      <Option type="QString" value="collection" name="type"/>
    </Option>
  </pipe-data-defined-properties>
  <pipe>
    <provider>
      <resampling maxOversampling="2" zoomedOutResamplingMethod="nearestNeighbour" enabled="false" zoomedInResamplingMethod="nearestNeighbour"/>
    </provider>
    <rasterrenderer type="singlebandpseudocolor" nodataColor="" classificationMax="1200" alphaBand="-1" opacity="1" classificationMin="625" band="1">
      <rasterTransparency/>
      <minMaxOrigin>
        <limits>None</limits>
        <extent>WholeRaster</extent>
        <statAccuracy>Exact</statAccuracy>
        <cumulativeCutLower>0.02</cumulativeCutLower>
        <cumulativeCutUpper>0.98</cumulativeCutUpper>
        <stdDevFactor>2</stdDevFactor>
      </minMaxOrigin>
      <rastershader>
        <colorrampshader maximumValue="1200" clip="0" colorRampType="DISCRETE" labelPrecision="0" classificationMode="2" minimumValue="625">
          <colorramp type="gradient" name="[source]">
            <Option type="Map">
              <Option type="QString" value="234,113,12,255" name="color1"/>
              <Option type="QString" value="254,192,207,255" name="color2"/>
              <Option type="QString" value="ccw" name="direction"/>
              <Option type="QString" value="0" name="discrete"/>
              <Option type="QString" value="gradient" name="rampType"/>
              <Option type="QString" value="rgb" name="spec"/>
              <Option type="QString" value="0.0434783;234,113,12,255;rgb;ccw:0.0869565;236,155,36,255;rgb;ccw:0.130435;240,201,55,255;rgb;ccw:0.173913;249,241,91,255;rgb;ccw:0.217391;238,252,120,255;rgb;ccw:0.26087;219,246,154,255;rgb;ccw:0.304348;197,241,187,255;rgb;ccw:0.347826;178,237,215,255;rgb;ccw:0.391304;159,230,246,255;rgb;ccw:0.434783;131,198,247,255;rgb;ccw:0.478261;106,156,229,255;rgb;ccw:0.521739;78,115,218,255;rgb;ccw:0.565217;46,74,204,255;rgb;ccw:0.608696;21,30,191,255;rgb;ccw:0.652174;10,0,179,255;rgb;ccw:0.695652;44,0,177,255;rgb;ccw:0.73913;82,0,178,255;rgb;ccw:0.782609;119,0,183,255;rgb;ccw:0.826087;152,0,175,255;rgb;ccw:0.869565;189,0,175,255;rgb;ccw:0.913043;254,109,142,255;rgb;ccw:0.956522;253,146,172,255;rgb;ccw" name="stops"/>
            </Option>
          </colorramp>
          <item label="&lt;= 650 mm" color="#ea710c" alpha="255" value="650"/>
          <item label="650 - 675 mm" color="#ec9b24" alpha="255" value="675"/>
          <item label="675 - 700 mm" color="#f0c937" alpha="255" value="700"/>
          <item label="700 - 725 mm" color="#f9f15b" alpha="255" value="725"/>
          <item label="725 - 750 mm" color="#eefc78" alpha="255" value="750"/>
          <item label="750 - 775 mm" color="#dbf69a" alpha="255" value="775"/>
          <item label="775 - 800 mm" color="#c5f1bb" alpha="255" value="800"/>
          <item label="800 - 825 mm" color="#b2edd7" alpha="255" value="825"/>
          <item label="825 - 850 mm" color="#9fe6f6" alpha="255" value="850"/>
          <item label="850 - 875 mm" color="#83c6f7" alpha="255" value="875"/>
          <item label="875 - 900 mm" color="#6a9ce5" alpha="255" value="900"/>
          <item label="900 - 925 mm" color="#4e73da" alpha="255" value="925"/>
          <item label="925 - 950 mm" color="#2e4acc" alpha="255" value="950"/>
          <item label="950 - 975 mm" color="#151ebf" alpha="255" value="975"/>
          <item label="975 - 1000 mm" color="#0a00b3" alpha="255" value="1000"/>
          <item label="1000 - 1025 mm" color="#2c00b1" alpha="255" value="1025"/>
          <item label="1025 - 1050 mm" color="#5200b2" alpha="255" value="1050"/>
          <item label="1050 - 1075 mm" color="#7700b7" alpha="255" value="1075"/>
          <item label="1075 - 1100 mm" color="#9800af" alpha="255" value="1100"/>
          <item label="1100 - 1125 mm" color="#bd00af" alpha="255" value="1125"/>
          <item label="1125 - 1150 mm" color="#fe6d8e" alpha="255" value="1150"/>
          <item label="1150 - 1175 mm" color="#fd92ac" alpha="255" value="1175"/>
          <item label="> 1175 mm" color="#fec0cf" alpha="255" value="inf"/>
          <rampLegendSettings prefix="" maximumLabel="" useContinuousLegend="1" suffix="" minimumLabel="" orientation="2" direction="0">
            <numericFormat id="basic">
              <Option type="Map">
                <Option type="invalid" name="decimal_separator"/>
                <Option type="int" value="6" name="decimals"/>
                <Option type="int" value="0" name="rounding_type"/>
                <Option type="bool" value="false" name="show_plus"/>
                <Option type="bool" value="true" name="show_thousand_separator"/>
                <Option type="bool" value="false" name="show_trailing_zeros"/>
                <Option type="invalid" name="thousand_separator"/>
              </Option>
            </numericFormat>
          </rampLegendSettings>
        </colorrampshader>
      </rastershader>
    </rasterrenderer>
    <brightnesscontrast brightness="0" gamma="1" contrast="0"/>
    <huesaturation grayscaleMode="0" colorizeRed="255" invertColors="0" colorizeOn="0" colorizeGreen="128" colorizeBlue="128" colorizeStrength="100" saturation="0"/>
    <rasterresampler maxOversampling="2"/>
    <resamplingStage>resamplingFilter</resamplingStage>
  </pipe>
  <blendMode>0</blendMode>
</qgis>
