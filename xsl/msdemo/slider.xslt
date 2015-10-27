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

    <!-- BEGIN SLIDER -->
    <div class="page-slider margin-bottom-40">
      <div class="fullwidthbanner-container revolution-slider">
        <div class="fullwidthabnner">
		  <ul id="revolutionul" style="height:auto;!important">
		    <xsl:if test="sc:pageMode()/pageEditor/edit">
			  <xsl:attribute name="style">
				<xsl:value-of select="'height:auto;!important;'"/>
			  </xsl:attribute>
			</xsl:if>
			
			<xsl:if test="sc:fld('source',.)">
				<xsl:for-each select="sc:Split('source',.)">
				  <xsl:for-each select="sc:item(text(),.)">
					<xsl:variable name="alt">
					  <xsl:choose>
						<xsl:when test="sc:fld('alt',.)">
						  <xsl:value-of select="sc:fld('alt',.)" />
						</xsl:when>
						<xsl:otherwise>
						  <xsl:value-of select="@name" />
						</xsl:otherwise>
					  </xsl:choose>
					</xsl:variable>
					<li data-transition="fade" data-slotamount="8" data-masterspeed="700" data-delay="9400" data-thumb="/metronic/frontend/pages/img/revolutionslider/thumbs/thumb2.jpg">
					<sc:image field="background image" border="0" alt="{$alt}" />

					<sc:text select="." field="content" />
					</li>

				  </xsl:for-each>
				</xsl:for-each>
			</xsl:if>
		  
		  </ul>
                <div class="tp-bannertimer tp-bottom"></div>
            </div>
        </div>
    </div>
    <!-- END SLIDER -->
	

	
  </xsl:template>

</xsl:stylesheet>
