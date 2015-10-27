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

	<xsl:for-each select="./item">
    
		<div class="row">
			<div class="col-md-4 col-sm-4">
			  <!-- BEGIN CAROUSEL -->            
			  <div class="front-carousel">
				<div class="carousel slide" id="myCarousel">
				  <!-- Carousel items -->
				  <div class="carousel-inner">
					<div class="item active">
					  <sc:image field="image" mw="260" mh="177" />
					</div>
				  </div>

				</div>                
			  </div>
			  <!-- END CAROUSEL -->             
			</div>
			<div class="col-md-8 col-sm-8">
			  <h2><sc:link><sc:text field="title"/></sc:link></h2>
			  <p><sc:text field="summary" /></p>
			  <sc:link class="more">Read more <i class="icon-angle-right"></i></sc:link>
			</div>
		</div>
		<hr class="blog-post-sep"/>
	  
	</xsl:for-each>
	  
	  <!--
	<div class="row">
		<div class="col-md-4 col-sm-4">
		  <img class="img-responsive" alt="" src="../../assets/frontend/pages/img/works/img4.jpg"/>
		</div>
		<div class="col-md-8 col-sm-8">
		  <h2><a href="blog-item.html">Corrupti quos dolores etquas</a></h2>
		  <ul class="blog-info">
			<li><i class="fa fa-calendar"></i> 25/07/2013</li>
			<li><i class="fa fa-comments"></i> 17</li>
			<li><i class="fa fa-tags"></i> Metronic, Keenthemes, UI Design</li>
		  </ul>
		  <p>At vero eos et accusamus et iusto odio dignissimos ducimus qui sint blanditiis prae sentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non eleifend enim a feugiat. Pellentesque viverra vehicula sem ut volutpat. Lorem ipsum dolor sit amet, consectetur adipiscing condimentum eleifend enim a feugiat.</p>
		  <a href="blog-item.html" class="more">Read more <i class="icon-angle-right"></i></a>
		</div>
	</div>
	<hr class="blog-post-sep"/>
	  
	  
	<div class="row">
		<div class="col-md-4 col-sm-4">
		  
		  <iframe height="205" allowfullscreen="" style="width:100%; border:0" src="http://player.vimeo.com/video/56974716?portrait=0"></iframe>
		  
		</div>
		<div class="col-md-8 col-sm-8">
		  <h2><a href="blog-item.html">Corrupti quos dolores etquas</a></h2>
		  <ul class="blog-info">
			<li><i class="fa fa-calendar"></i> 25/07/2013</li>
			<li><i class="fa fa-comments"></i> 17</li>
			<li><i class="fa fa-tags"></i> Metronic, Keenthemes, UI Design</li>
		  </ul>
		  <p>At vero eos et accusamus et iusto odio dignissimos ducimus qui sint blanditiis prae sentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non eleifend enim a feugiat. Pellentesque viverra vehicula sem ut volutpat. Lorem ipsum dolor sit amet, consectetur adipiscing condimentum eleifend enim a feugiat.</p>
		  <a href="blog-item.html" class="more">Read more <i class="fa fa-angle-right"></i></a>
		</div>
	</div>
	<hr class="blog-post-sep"/>
	  
	  
	<div class="row">
		<div class="col-md-4 col-sm-4">
		  <img class="img-responsive" alt="" src="../../assets/frontend/pages/img/works/img2.jpg"/>
		</div>
		<div class="col-md-8 col-sm-8">
		  <h2><a href="#">Corrupti quos dolores etquas</a></h2>
		  <ul class="blog-info">
			<li><i class="fa fa-calendar"></i> 25/07/2013</li>
			<li><i class="fa fa-comments"></i> 17</li>
			<li><i class="fa fa-tags"></i> Metronic, Keenthemes, UI Design</li>
		  </ul>
		  <p>At vero eos et accusamus et iusto odio dignissimos ducimus qui sint blanditiis prae sentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non eleifend enim a feugiat. Pellentesque viverra vehicula sem ut volutpat. Lorem ipsum dolor sit amet, consectetur adipiscing condimentum eleifend enim a feugiat.</p>
		  <a href="blog-item.html" class="more">Read more <i class="fa fa-angle-right"></i></a>
		</div>
	</div>
	<hr class="blog-post-sep"/>
	  
	  
	  <ul class="pagination">
		<li><a href="#">Prev</a></li>
		<li><a href="#">1</a></li>
		<li><a href="#">2</a></li>
		<li class="active"><a href="#">3</a></li>
		<li><a href="#">4</a></li>
		<li><a href="#">5</a></li>
		<li><a href="#">Next</a></li>
	  </ul>               

	-->
	
  </xsl:template>

</xsl:stylesheet>
