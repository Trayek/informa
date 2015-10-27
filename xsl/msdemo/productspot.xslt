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
  <xsl:variable name="colourid" select="sc:fld('theme',$home)"/>
  <xsl:variable name="colouritem" select="sc:item($colourid,.)"/>
  <xsl:variable name="css" select="sc:fld('css',$colouritem)"/>
  
  <!-- entry point -->
  <xsl:template match="*">    

	<xsl:variable name="colour" select="sc:fld('button colour',.)"/>
	<xsl:variable name="home" select="sc:item($colour,.)"/>

  
	<div class="form-info">
		<h2><em><sc:text field="title"/></em></h2>
		<div class="margin-bottom-10">
			<sc:image field="image" mw="230"  />
		</div>
		<div class="margin-bottom-10">
			<sc:text field="summary"/>
		</div>
		<a href="{sc:path($sc_item)}" class="btn {$css} btn-block">
	
		Find out more</a>

    </div>
	
  </xsl:template>

</xsl:stylesheet>
