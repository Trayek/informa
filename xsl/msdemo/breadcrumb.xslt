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
  
  <xsl:variable name="home" select="$sc_item/ancestor-or-self::item[@template='home']" />
  
  <!-- entry point -->
	<xsl:template match="*">
	  <ul class="breadcrumb">
		  <xsl:for-each select="ancestor-or-self::item">
			<xsl:if test="position() > 2 and @template != 'folder'">
			  <xsl:choose>
				<xsl:when test="position() != last()">
				  <li><sc:link><xsl:call-template name="GetNavTitle" /></sc:link></li>
				</xsl:when>
				<xsl:otherwise>
				  <li class="active"><xsl:call-template name="GetNavTitle" /></li>
				</xsl:otherwise>
			  </xsl:choose>
			</xsl:if>
		  </xsl:for-each>
	  </ul>
	</xsl:template>

	<xsl:template name="GetNavTitle">
	  <xsl:param name="item" select="." />
	  <xsl:choose>
		<xsl:when test="sc:fld( 'menu title', $item )">
		  <sc:text field="menu title" select="$item" />
		</xsl:when>
		<xsl:otherwise>
		  <xsl:value-of select="$item/@name" />
		</xsl:otherwise>
	  </xsl:choose>
	</xsl:template>

</xsl:stylesheet>
