<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
  xmlns:sc="http://www.sitecore.net/sc"  
  xmlns:sql="http://www.sitecore.net/sql"
  exclude-result-prefixes="sc sql">

  <!-- output directives -->
  <xsl:output method="html" indent="no" encoding="UTF-8"  />

  <!-- sitecore parameters -->
  <xsl:param name="lang" select="'en'"/>
  <xsl:param name="id" select="''"/>
  <xsl:param name="sc_item"/>
  <xsl:param name="sc_currentitem"/>
  
  <!-- entry point -->
  <xsl:template match="*">    
  
	<xsl:variable name="title" select="sc:fld('title',.)"/>
	<xsl:variable name="type" select="sc:fld('type',.)"/>
	<xsl:variable name="width" select="sc:fld('width',.)"/>
	<xsl:variable name="height" select="sc:fld('height',.)"/>
	<xsl:variable name="background" select="sc:fld('background',.)"/>
	  
	<!-- amCharts javascript code -->
	<script type="text/javascript">
		AmCharts.makeChart("chartdiv99",
			{
				<xsl:choose>
					<xsl:when test="$type = 'pie'">
						"type": "pie",
						"path": "https://www.amcharts.com/lib/3/",


						"sequencedAnimation": false,
						"startDuration": 0,
						"titleField": "category",
						"valueField": "column-1",
						"marginBottom": 0,
						"marginTop": 0,
						"fontSize": 10,
						"theme": "light",
						"legend": {
						   "markerType": "circle",
						   "position": "right",
						   "marginRight": 80,
						   "autoMargins": false
						},
						"allLabels": [],
						"balloon": {},
						"titles": [
							{
								"id": "Title-1",
								"text": "<xsl:value-of select="$title" />"
							}
						],
						"dataProvider": [
							<xsl:for-each select="./item">
								<xsl:variable name="field" select="sc:fld('field',.)"/>
								<xsl:variable name="value" select="sc:fld('value',.)"/>
								
								{
									"category": "<xsl:value-of select="$field" />",
									"column-1": <xsl:value-of select="$value" />
								},
							</xsl:for-each>	
						]
					</xsl:when>
					<xsl:otherwise>
						"path": "https://www.amcharts.com/lib/3/",
						"type": "serial",
						"theme": "light",
						"titles": [
							{
								"id": "Title-1",
								"text": "<xsl:value-of select="$title" />"
							}
						],
						"dataProvider": [
							<xsl:for-each select="./item">
								<xsl:variable name="field" select="sc:fld('field',.)"/>
								<xsl:variable name="value" select="sc:fld('value',.)"/>
								{
									"country": "<xsl:value-of select="$field" />",
									"visits": <xsl:value-of select="$value" />
								},
							</xsl:for-each>	
						],
						"valueAxes": [ {
						"gridColor": "#FFFFFF",
						"gridAlpha": 0.2,
						"dashLength": 0
						} ],
						"gridAboveGraphs": true,
						"startDuration": 1,
						"graphs": [ {
						"balloonText": "[[category]]: <b>[[value]]</b>",
						"fillAlphas": 0.8,
						"lineAlpha": 0.2,
						"type": "column",
						"valueField": "visits"
						} ],
						"categoryField": "country",
						"categoryAxis": {
						"gridPosition": "start",
						"gridAlpha": 0,
						"tickPosition": "start",
						"tickLength": 20
						}
					</xsl:otherwise>
				</xsl:choose>
			}
		);
	</script>

	<div id="chartdiv99" style="width: {$width}; height: {$height}; background-color: {$background};" ></div>
	
  </xsl:template>

</xsl:stylesheet>
