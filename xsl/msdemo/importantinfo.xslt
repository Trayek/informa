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

	<xsl:variable name="colour" select="sc:fld('button colour',.)"/>
	<xsl:variable name="home" select="sc:item($colour,.)"/>

  
	<div class="form-info">
		<sc:text field="title"/>
		<!--<h2><em>Important</em> Information</h2>-->
		<sc:text field="text"/>
		<!-- <button type="button" class="btn btn-default {sc:fld('css',$home)}hover"><sc:text field="button text" /></button> -->
		
    </div>
	
  </xsl:template>

</xsl:stylesheet>
