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
  
  <!-- TABS -->
  <div class="col-md-12 tab-style-1">
	<ul class="nav nav-tabs">
	  <li class="active"><a href="#tab-1" data-toggle="tab">Images</a></li>	
	  <xsl:if test="sc:fld('video',.)">
		<li><a href="#tab-2" data-toggle="tab">Videos</a></li>
	  </xsl:if>
	  
	</ul>
	<div class="tab-content">
	  <div class="tab-pane row fade in active" id="tab-1">
	  
	  
		  <xsl:if test="sc:fld('images',.)">
			<xsl:for-each select="sc:Split('images',.)">
			
			  <xsl:for-each select="sc:item(text(),.)">

				<div class="col-md-3 col-sm-4 gallery-item">
				  <a data-rel="fancybox-button" title="" href="{concat('', sc:GetMediaUrl(.))}" class="fancybox-button">

					 <xsl:variable name="img" select="concat('http://officecore.demo', sc:GetMediaUrl(.),'?w=100&amp;h=75&amp;as=1&amp;bc=FAFAFA')" />
					 <img alt="" src="{sc:SignMediaUrl($img)}" class="img-responsive"/>

					<!--<div class="zoomix"><i class="fa fa-search"></i></div>-->
				  </a> 
				</div>

			  </xsl:for-each>
			</xsl:for-each>
		  </xsl:if>	  
	  
	  
	  

	  </div>
	  <div class="tab-pane fade" id="tab-2">
		  <xsl:if test="sc:fld('video',.)">
			<xsl:for-each select="sc:Split('video',.)">
			  <xsl:for-each select="sc:item(text(),.)">
				<video controls="controls" style="width:100%;background-color:#fff !important;">
	<!--				<xsl:if test="sc:pageMode()/normal">
					  <xsl:attribute name="autoplay">
						<xsl:value-of select="'autoplay'"/>
					  </xsl:attribute>
					</xsl:if>-->
				   <source src="{concat('', sc:GetMediaUrl(.))}" type="video/mp4" />
				   <p>Your browser does not support the <code>video</code> element.</p>
				 </video>
			  </xsl:for-each>
			</xsl:for-each>
		  </xsl:if>
	  </div>
	</div>
  </div>
  <!-- END TABS -->
  	
  </xsl:template>

 
  
</xsl:stylesheet>
