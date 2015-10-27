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
  
	  <xsl:variable name="colour" select="sc:fld('colour',.)"/>
	  <xsl:variable name="home" select="sc:item($colour,.)"/>
	  <xsl:variable name="hovercolour" select="sc:fld('hover colour',.)"/>
	  <xsl:variable name="hoverhome" select="sc:item($hovercolour,.)"/>
	  
	  <xsl:variable name="sitehome" select="sc:item('110D559F-DEA5-42EA-9C1C-8A5DF7E70EF9',.)"/>
	  <xsl:variable name="colourid" select="sc:fld('theme',$sitehome)"/>
	  <xsl:variable name="colouritem" select="sc:item($colourid,.)"/>
	  
	<!-- BEGIN BLOCKQUOTE BLOCK -->   
	<xsl:choose>
		<xsl:when test="$sc_item/@id = '{8CBDA387-0FFE-4258-ACD9-AA7CE0ABF10A}'">
			<div class="row quote-oc {sc:fld('css',$colouritem)} {sc:fld('css',$hoverhome)}hover margin-bottom-30">
			  <div class="col-md-9">
				<span><sc:text select="." field="quote"/></span>
			  </div>
			  <div class="col-md-3 text-right">

				<sc:link field="link" class="btn-transparent" target="_self"><i class="{sc:fld('icon',.)}"></i><sc:text select="." field="link text"/></sc:link>
			  </div>
			</div>
		</xsl:when>
		<xsl:otherwise>
			<div class="row quote-oc {sc:fld('css',$home)} {sc:fld('css',$hoverhome)}hover margin-bottom-30">
			  <div class="col-md-9">
				<span><sc:text select="." field="quote"/></span>
			  </div>
			  <div class="col-md-3 text-right">

				<sc:link field="link" class="btn-transparent" target="_self"><i class="{sc:fld('icon',.)}"></i><sc:text select="." field="link text"/></sc:link>
			  </div>
			</div>
		</xsl:otherwise>
	</xsl:choose>

	<!-- END BLOCKQUOTE BLOCK -->
	
  </xsl:template>

</xsl:stylesheet>
