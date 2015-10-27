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
	

<div class="row margin-bottom-30">
	<!-- BEGIN CAROUSEL -->            
	<div class="col-md-5 front-carousel">
	  <div class="carousel slide" id="myCarousel">
		<!-- Carousel items -->
		<div class="carousel-inner">
		  <div class="item active">
			<sc:image field="image" w="450" as="1"/>
<!--			<div class="carousel-caption">
			  <p>Excepturi sint occaecati cupiditate non provident</p>
			</div>
-->		  </div>
		</div>
	  </div>                
	</div>
	<!-- END CAROUSEL -->                             

	<!-- BEGIN PORTFOLIO DESCRIPTION -->            
	<div class="col-md-7">
	  <h1><sc:text field="title"/></h1>
	  <sc:text field="text"/>
	  <br/>
<!--	  <div class="row front-lists-v2 margin-bottom-15">
		<div class="col-md-6">
		  <ul class="list-unstyled">
			<li><i class="fa fa-html5"></i> HTML5/CSS3</li>
			<li><i class="fa fa-bell"></i> Web Deisgn</li>
			<li><i class="fa fa-globe"></i> Web Development</li>
			<li><i class="fa fa-shopping-cart"></i> Shoping Cart</li>
		  </ul>
		</div>
		<div class="col-md-6">
		  <ul class="list-unstyled">
			<li><i class="fa fa-dropbox"></i> Free Storage</li>
			<li><i class="fa fa-cloud"></i> Cloud Hosting</li>
			<li><i class="fa fa-comments"></i> Free Support</li>
			<li><i class="fa fa-star"></i> Awesome UI</li>
		  </ul>
		</div>
	  </div>
	  <a class="btn btn-primary" href="#"> VISIT THE PROJECT</a>-->
	</div> 
	<!-- END PORTFOLIO DESCRIPTION -->            
  </div>
	
  </xsl:template>

</xsl:stylesheet>
