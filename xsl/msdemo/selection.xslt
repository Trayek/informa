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

	<!-- BEGIN RECENT WORKS -->
	<div class="row recent-work margin-bottom-40">
	  <div class="col-md-12">
		<div class="owl-carousel owl-carousel3">
			<xsl:for-each select="./item">
				<xsl:if test="sc:fld('show in menu',.)!=''">
				  <div class="recent-work-item">
					
					<em>
					<sc:link>
					  <sc:image select="." field="image" class="img-responsive" w="370" h="247" mw="370" mh="247" bc="#ffffff"/>
					</sc:link>
					</em>
					<sc:link class="recent-work-description">
					  <strong style="text-align:center;"><xsl:value-of select="sc:fld('title',.)"/></strong>
					</sc:link>
				  </div>
				</xsl:if>
			</xsl:for-each>
		</div>       
	  </div>
	</div>   
	<!-- END RECENT WORKS -->	
	
  </xsl:template>

</xsl:stylesheet>
