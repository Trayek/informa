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
  
  <xsl:variable name="footer" select="sc:item('7FBC4CFA-EAE4-45A9-B7B5-C2799D2B01F6',.)"/>
  <xsl:variable name="social" select="sc:item('7839B152-B098-43E8-9AA0-A6808D195404',.)"/>
  
  <!-- entry point -->
  <xsl:template match="*">	
	

	<div class="content-page">
		<!-- BEGIN CAROUSEL -->            
		<div class="front-carousel margin-bottom-20">
			<div id="myCarousel" class="carousel slide">
				<!-- Carousel items -->
				<div class="carousel-inner">
					<div class="item active">
					  <sc:image field="teaser image" mw="700" />
					</div>
				</div>
				<!-- Carousel nav 
				 <a class="carousel-control left" href="#myCarousel" data-slide="prev">
				  <i class="fa fa-angle-left"></i>
				</a>
				<a class="carousel-control right" href="#myCarousel" data-slide="next">
				  <i class="fa fa-angle-right"></i>
				</a>
				-->
			</div>                
		</div>
		<!-- END CAROUSEL --> 

		<!-- BEGIN INFO BLOCK -->               
		<h4><sc:date field="date" format="MMMM dd, yyyy"/></h4>
		<xsl:if test="sc:pageMode()/pageEditor/edit">
			<br/>
			<div style="border: 1px solid #f00; padding: 5px;">
				<strong>Summary:</strong><br/>
				<sc:text field="summary" />
			</div>
			<br/>
			<strong>Main text:</strong><br/>
		</xsl:if>

		<sc:text field="text" />
	</div>
	
  </xsl:template>

</xsl:stylesheet>
