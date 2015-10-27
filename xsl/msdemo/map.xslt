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
  
	<div class="col-md-12" style="padding-left:0px !important;padding-right:0px !important;">
      <div id="map" class="gmaps margin-bottom-40" style="height: 400px; position: relative; overflow: hidden; transform: translateZ(0px); background-color: rgb(229, 227, 223);">
				  
		<iframe width="100%" height="100%" frameborder="0" style="border:0" src="https://www.google.com/maps/embed/v1/place?q=Sitecore%20UK%20Ltd.%2C%20London%20E1W%201UN%2C%20United%20Kingdom&amp;key=AIzaSyABDFeZiHB1dYtYG_GYL_1XjFtrsGxNmQA"></iframe>
				  
	  </div>
	</div>
	
  </xsl:template>

</xsl:stylesheet>
