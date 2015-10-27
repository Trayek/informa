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
  
  <div class="row margin-bottom-10">
	<div class="col-md-12">
		<div class="content-page">

			<video controls="controls" style="width:100%;">
				<xsl:if test="sc:pageMode()/normal">
				  <xsl:attribute name="autoplay">
					<xsl:value-of select="'autoplay'"/>
				  </xsl:attribute>
				</xsl:if>
			   <source src="{concat('', sc:GetMediaUrl(.))}" type="video/mp4" />
			   <div style="width:100%; height:300px; padding: 20px; text-align:center;background-color:#000;color:#fff;">Your browser does not support the <code>video</code> element.</div>
			 </video>
			 
		</div>
	</div>
  </div>
	
  </xsl:template>

</xsl:stylesheet>
