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
  
  <!-- entry point -->
  <xsl:template match="*">    

	<!-- BEGIN TABS AND TESTIMONIALS -->
	<div class="row margin-bottom-40">
	  <!-- TABS -->
	  <div class="col-md-5 tab-style-1">
		<ul class="nav nav-tabs">
		  <li class="active"><a href="#tab-1" data-toggle="tab">Multipurpose</a></li>
		  <li><a href="#tab-2" data-toggle="tab">Documented</a></li>
		  <li><a href="#tab-3" data-toggle="tab">Responsive</a></li>
		</ul>
		<div class="tab-content">
		  <div class="tab-pane row fade in active" id="tab-1">
			<div class="col-md-3 col-sm-3">
			  <a href="assets/temp/photos/img7.jpg" class="fancybox-button" title="Image Title" data-rel="fancybox-button">
				<img class="img-responsive" src="/metronic/frontend/pages/img/photos/img7.jpg" alt=""/>
			  </a>
			</div>
			<div class="col-md-9 col-sm-9">
			  <p class="margin-bottom-10">Raw denim you probably haven't heard of them jean shorts Austin. Nesciunt tofu stumptown aliqua, retro synth master cleanse. Mustache cliche tempor, williamsburg carles vegan helvetica. Cosby sweater eu banh mi, qui irure terry richardson ex squid Aliquip placeat salvia cillum iphone.</p>
			  <p><a class="more" href="#">Read more <i class="icon-angle-right"></i></a></p>
			</div>
		  </div>
		  <div class="tab-pane row fade" id="tab-2">
			<div class="col-md-9 col-sm-9">
			  <p>Food truck fixie locavore, accusamus mcsweeney's marfa nulla single-origin coffee squid. Exercitation +1 labore velit, blog sartorial PBR leggings next level wes anderson artisan four loko farm-to-table craft beer twee. Qui photo booth letterpress, commodo enim craft beer mlkshk aliquip jean shorts ullamco ad vinyl cillum PBR. Homo nostrud organic, assumenda labore aesthetic magna delectus mollit. Keytar helvetica VHS salvia..</p>
			</div>
			<div class="col-md-3 col-sm-3">
			  <a href="assets/temp/photos/img10.jpg" class="fancybox-button" title="Image Title" data-rel="fancybox-button">
				<img class="img-responsive" src="/metronic/frontend/pages/img/photos/img10.jpg" alt=""/>
			  </a>
			</div>
		  </div>
		  <div class="tab-pane fade" id="tab-3">
			<p>Etsy mixtape wayfarers, ethical wes anderson tofu before they sold out mcsweeney's organic lomo retro fanny pack lo-fi farm-to-table readymade. Messenger bag gentrify pitchfork tattooed craft beer, iphone skateboard locavore carles etsy salvia banksy hoodie helvetica. DIY synth PBR banksy irony. Leggings gentrify squid 8-bit cred pitchfork. Williamsburg banh mi whatever gluten-free, carles pitchfork biodiesel fixie etsy retro mlkshk vice blog. Scenester cred you probably haven't heard of them, vinyl craft beer blog stumptown. Pitchfork sustainable tofu synth chambray yr.</p>
		  </div>
		</div>
	  </div>
	  <!-- END TABS -->
	
	  <!-- TESTIMONIALS -->
	  <div class="col-md-7 testimonials-v1">
		<div id="myCarousel" class="carousel slide">
		  <!-- Carousel items -->
		  <div class="carousel-inner">
			<div class="active item">
			  <blockquote><p>Denim you probably haven't heard of. Lorem ipsum dolor met consectetur adipisicing sit amet, consectetur adipisicing elit, of them jean shorts sed magna aliqua. Lorem ipsum dolor met.</p></blockquote>
			  <div class="carousel-info">
				<img class="pull-left" src="/metronic/frontend/pages/img/people/img1-small.jpg" alt=""/>
				<div class="pull-left">
				  <span class="testimonials-name">Lina Mars</span>
				  <span class="testimonials-post">Commercial Director</span>
				</div>
			  </div>
			</div>
			<div class="item">
			  <blockquote><p>Raw denim you Mustache cliche tempor, williamsburg carles vegan helvetica probably haven't heard of them jean shorts austin. Nesciunt tofu stumptown aliqua, retro synth master cleanse. Mustache cliche tempor, williamsburg carles vegan helvetica.</p></blockquote>
			  <div class="carousel-info">
				<img class="pull-left" src="/metronic/frontend/pages/img/people/img5-small.jpg" alt=""/>
				<div class="pull-left">
				  <span class="testimonials-name">Kate Ford</span>
				  <span class="testimonials-post">Commercial Director</span>
				</div>
			  </div>
			</div>
			<div class="item">
			  <blockquote><p>Reprehenderit butcher stache cliche tempor, williamsburg carles vegan helvetica.retro keffiyeh dreamcatcher synth. Cosby sweater eu banh mi, qui irure terry richardson ex squid Aliquip placeat salvia cillum iphone.</p></blockquote>
			  <div class="carousel-info">
				<img class="pull-left" src="/metronic/frontend/pages/img/people/img2-small.jpg" alt=""/>
				<div class="pull-left">
				  <span class="testimonials-name">Jake Witson</span>
				  <span class="testimonials-post">Commercial Director</span>
				</div>
			  </div>
			</div>
		  </div>

		  <!-- Carousel nav -->
		  <a class="left-btn" href="#myCarousel" data-slide="prev"></a>
		  <a class="right-btn" href="#myCarousel" data-slide="next"></a>
		</div>
	  </div>
	  <!-- END TESTIMONIALS -->
	</div>                
	<!-- END TABS AND TESTIMONIALS -->	
	
  </xsl:template>

</xsl:stylesheet>
