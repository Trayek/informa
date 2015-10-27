<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
  xmlns:sc="http://www.sitecore.net/sc"  
  xmlns:sql="http://www.sitecore.net/sql"
  xmlns:xdb="http://www.sitecore.net/xDB" 
  exclude-result-prefixes="sc sql">

  <!-- output directives -->
  <xsl:output method="html" indent="no" encoding="UTF-8"  />

  <!-- sitecore parameters -->
  <xsl:param name="lang" select="'en'"/>
  <xsl:param name="id" select="''"/>
  <xsl:param name="sc_item"/>
  <xsl:param name="sc_currentitem"/>
  
  <xsl:variable name="home" select="sc:item('110D559F-DEA5-42EA-9C1C-8A5DF7E70EF9',.)"/>
  <xsl:variable name="colourid" select="sc:fld('theme',$home)"/>
  <xsl:variable name="colouritem" select="sc:item($colourid,.)"/>
  <xsl:variable name="css" select="sc:fld('css',$colouritem)"/>
  
  <!-- entry point -->
  <xsl:template match="*">    

  <xsl:choose>
	<xsl:when test="sc:pageMode()/pageEditor">
		<div class="color-panel hidden-sm">
		  <div class="color-mode-icons icon-color {sc:fld('css',$colouritem)}">

		  </div> 
		  <div class="color-mode-icons icon-color-close {sc:fld('css',$colouritem)}" style="display: none;"></div>
		  <div class="color-mode {sc:fld('css',$colouritem)}" style="display: none;">
			<p>DISABLED IN EXPERIENCE EDITOR</p>
		  </div>
		</div>
	</xsl:when>
	<xsl:otherwise>
		<div class="color-panel hidden-sm">
		  <div class="color-mode-icons icon-color {sc:fld('css',$colouritem)}">

		  </div> 
		  <div class="color-mode-icons icon-color-close {sc:fld('css',$colouritem)}" style="display: none;"></div>
		  <div class="color-mode {sc:fld('css',$colouritem)}" style="display: none; width: 350px;">
			<p>ANALYTICS PROFILE</p>
				<!-- amCharts javascript code -->
				<script type="text/javascript">
					AmCharts.makeChart("chartdiv1",
						{
							"type": "pie",
							"path": "https://www.amcharts.com/lib/3/",
							"labelText": "[[title]]",
							"labelRadius": 5,
							"radius": 75,
							"sequencedAnimation": false,
							"startDuration": 0,
							"titleField": "category",
							"valueField": "column-1",
							"marginBottom": 0,
							"marginTop": 0,
							"fontSize": 10,
							"theme": "light",
							"allLabels": [],
							"balloon": {},
							"titles": [
								{
									"id": "Title-1",
									"text": "Site Interest"
								}
							],
							
							<xsl:choose>
								<xsl:when test="xdb:ProfileKeyValue('site interest','mobile')=''">
									"dataProvider": [
										{
											"category": "Mobile",
											"column-1": 1
										},
										{
											"category": "Surface",
											"column-1": 1
										},
										{
											"category": "Office",
											"column-1": 1
										},
										{
											"category": "Xbox",
											"column-1": 1
										}
									]
								</xsl:when>
								<xsl:otherwise>
									"dataProvider": [
										{
											"category": "Mobile",
											"column-1": <xsl:value-of select="xdb:ProfileKeyValue('site interest','mobile')"/>
										},
										{
											"category": "Surface",
											"column-1": <xsl:value-of select="xdb:ProfileKeyValue('site interest','surface')"/>
										},
										{
											"category": "Office",
											"column-1": <xsl:value-of select="xdb:ProfileKeyValue('site interest','office')"/>
										},
										{
											"category": "Xbox",
											"column-1": <xsl:value-of select="xdb:ProfileKeyValue('site interest','xbox')"/>
										}
									]
								</xsl:otherwise>
							</xsl:choose>
						}
					);
				</script>
			
				<div id="chartdiv1" style="width: 100%; height: 250px; background-color: #FFFFFF;" ></div>


			<!-- amCharts javascript code -->
				<script type="text/javascript">
					AmCharts.makeChart("chartdiv2",
						{
							"type": "pie",
							"path": "https://www.amcharts.com/lib/3/",
							"labelText": "[[title]]",
							"labelRadius": 5,
							"radius": 75,
							"sequencedAnimation": false,
							"startDuration": 0,
							"titleField": "category",
							"valueField": "column-1",
							"marginBottom": 0,
							"marginTop": 0,
							"fontSize": 10,
							"theme": "light",
							"allLabels": [],
							"balloon": {},
							"titles": [
								{
									"id": "Title-1",
									"text": "Gaming Interest"
								}
							],
							
							<xsl:choose>
								<xsl:when test="xdb:ProfileKeyValue('gaming interest','action')='' and xdb:ProfileKeyValue('gaming interest','adventure')='' and xdb:ProfileKeyValue('gaming interest','fighting')='' and xdb:ProfileKeyValue('gaming interest','racing')='' and xdb:ProfileKeyValue('gaming interest','sports')='' or xdb:ProfileKeyValue('gaming interest','action')='0' and xdb:ProfileKeyValue('gaming interest','adventure')='0' and xdb:ProfileKeyValue('gaming interest','fighting')='0' and xdb:ProfileKeyValue('gaming interest','racing')='0' and xdb:ProfileKeyValue('gaming interest','sports')='0'">
									"dataProvider": [
										{
											"category": "Action",
											"column-1": 1
										},
										{
											"category": "Adventure",
											"column-1": 1
										},
										{
											"category": "Fighting",
											"column-1": 1
										},
										{
											"category": "Racing",
											"column-1": 1
										},
										{
											"category": "Sports",
											"column-1": 1
										}
									]
								</xsl:when>
								<xsl:otherwise>
									"dataProvider": [
										{
											"category": "Action",
											"column-1": <xsl:value-of select="xdb:ProfileKeyValue('gaming interest','action')"/>
										},
										{
											"category": "Adventure",
											"column-1": <xsl:value-of select="xdb:ProfileKeyValue('gaming interest','adventure')"/>
										},
										{
											"category": "Fighting",
											"column-1": <xsl:value-of select="xdb:ProfileKeyValue('gaming interest','fighting')"/>
										},
										{
											"category": "Racing",
											"column-1": <xsl:value-of select="xdb:ProfileKeyValue('gaming interest','racing')"/>
										},
										{
											"category": "Sports",
											"column-1": <xsl:value-of select="xdb:ProfileKeyValue('gaming interest','sports')"/>
										}
									]
								
								</xsl:otherwise>
							</xsl:choose>
						}
					);
				</script>
			
				<div id="chartdiv2" style="width: 100%; height: 250px; background-color: #FFFFFF;" ></div>
				<!-- <div id="chart_9" style="height: 400px;"></div>	 -->

				<!--
				Mobile:<xsl:value-of select="xdb:ProfileKeyValue('site interest','mobile')"/><br/>
				Surface:<xsl:value-of select="xdb:ProfileKeyValue('site interest','surface')"/><br/>
				Office:<xsl:value-of select="xdb:ProfileKeyValue('site interest','office')"/><br/>
				Xbox:<xsl:value-of select="xdb:ProfileKeyValue('site interest','xbox')"/>
				
				Action:<xsl:value-of select="xdb:ProfileKeyValue('gaming interest','action')"/><br/>
				Adventure:<xsl:value-of select="xdb:ProfileKeyValue('gaming interest','adventure')"/><br/>
				Fighting:<xsl:value-of select="xdb:ProfileKeyValue('gaming interest','fighting')"/><br/>
				Racing:<xsl:value-of select="xdb:ProfileKeyValue('gaming interest','racing')"/><br/>
				Sports:<xsl:value-of select="xdb:ProfileKeyValue('gaming interest','sports')"/>
				-->

		  </div>
		</div>
	</xsl:otherwise>
  </xsl:choose>


  </xsl:template>

</xsl:stylesheet>
