﻿<?xml version="1.0" encoding="UTF-8"?>
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
  
  <xsl:variable name="home" select="sc:item('8E810B67-BFF3-4D1F-AA07-EFA0B90C345F',.)"/>
  <xsl:variable name="section" select="$sc_item/ancestor-or-self::item[@template='products subsection']" />
  
  <!-- entry point -->
  <xsl:template match="*">    

	<div class="sidebar">
		<ul class="list-group margin-bottom-25 sidebar-menu">

			<xsl:for-each select="sc:GetItemsOfType('product',$home/item)">
			
			<!--<xsl:for-each select="ancestor-or-self::item[sc:IsItemOfType('page',$home)]">-->
			
			  <li class="list-group-item clearfix">
			  	<xsl:if test="./@id=$sc_currentitem/@id">
				  <xsl:attribute name="class">
					<xsl:value-of select="'list-group-item clearfix active'"/>
				  </xsl:attribute>
				</xsl:if>
				<sc:link>
					<i class="fa fa-angle-right"></i><sc:text field="menu title"/>
				</sc:link>
			  </li>
			</xsl:for-each>
		</ul>
	</div>
	
  </xsl:template>

</xsl:stylesheet>
