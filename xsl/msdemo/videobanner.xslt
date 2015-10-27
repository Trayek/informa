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
  
  <xsl:variable name="vidfolder" select="sc:item('DA1B9BCB-DEFA-4F4D-AD0B-331A7C923874',.)"/>
  
  <!-- entry point -->
  <xsl:template match="*">    

  
      <!-- BEGIN SLIDER -->
    <div class="page-slider margin-bottom-25">
      <div class="fullwidthbanner-container revolution-slider" style="max-height:720px; height:720px; background-color:#F8F8F8;">
        <div class="fullwidthabnner">
		  <ul id="revolutionul" style="height:auto;!important">
		    <xsl:if test="sc:pageMode()/pageEditor/edit">
			  <xsl:attribute name="style">
				<xsl:value-of select="'height:auto;!important; text-align:center;'"/>
			  </xsl:attribute>
			</xsl:if>
			


					<li data-transition="fade" data-slotamount="8" data-masterspeed="700" data-delay="9400" style="text-align:center;">
					  <xsl:if test="sc:fld('video',.)">
						<xsl:for-each select="sc:Split('video',.)">
						  <xsl:for-each select="sc:item(text(),.)">
							<video controls="controls" style="height:720px;">
								<xsl:if test="sc:pageMode()/normal">
								  <xsl:attribute name="autoplay">
									<xsl:value-of select="'autoplay'"/>
								  </xsl:attribute>
								</xsl:if>
							   <source src="{concat('', sc:GetMediaUrl(.))}" type="video/mp4" />
							   <p>Your browser does not support the <code>video</code> element.</p>
							 </video>
						  </xsl:for-each>
						</xsl:for-each>
					  </xsl:if>
					</li>


		  
		  </ul>
        </div>
      </div>
    </div>
    <!-- END SLIDER -->

  
  
  
  

	
  </xsl:template>

</xsl:stylesheet>
