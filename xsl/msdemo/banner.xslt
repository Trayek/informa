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
  
  <xsl:variable name="home" select="sc:item('110D559F-DEA5-42EA-9C1C-8A5DF7E70EF9',.)"/>
  
  <!-- entry point -->
  <xsl:template match="*">    

  
	<div>
		<div >
			<div>
				<sc:image select="." field="image" border="0" title="#htmlcaption1" style="height:auto;"/>
			</div>
		</div>
	</div>
	
	<div id="htmlcaption1" style="display:none">
		<div class="nivo-caption1">How to choose the Right Sofa for Your Room</div>
		<div class="nivo-caption1a" >Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod <a href="./index.html" >tempor incididunt</a>
		ut labore et dolore magna aliqua.
		</div>
	</div>
	
  </xsl:template>

</xsl:stylesheet>
