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
  
  <xsl:variable name="social" select="sc:item('7839B152-B098-43E8-9AA0-A6808D195404',.)"/>
  
  <!-- entry point -->
  <xsl:template match="*">    
	<div class="content-top">
		 <div class="top-box">
			<h2>Company News</h2>
			<hr/>
			<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. </p>
		 </div>
		<div class="section group">
			<div class="col_1_of_4 span_1_of_4">
				<div class="hover_img">
					<img src="/enginery/images/pic4.jpg" alt=""/>
				</div>
				<div class="caption1">
					 <time datetime="#">November 17, 2013</time> <br/>
					 <a href="#" class="lnk">Vestibulum</a>
					 <p>Quisque nulla. Vestibulum libero nisl, porta vel, scelerisque eget, malesuada at, neque. Vivamus eget nibh...</p>
					 <a href="#" class="btn btn-primary btn1">read more</a>
				</div>
			</div>
			<div class="col_1_of_4 span_1_of_4">
				<div class="hover_img">
					<img src="/enginery/images/pic5.jpg" alt=""/>
				</div>
				<div class="caption1">
					 <time datetime="#">November 17, 2013</time> <br/>
					 <a href="#" class="lnk">Vestibulum</a>
					 <p>Quisque nulla. Vestibulum libero nisl, porta vel, scelerisque eget, malesuada at, neque. Vivamus eget nibh...</p>
					 <a href="#" class="btn btn-primary btn1">read more</a>
				</div>
			</div>
			<div class="col_1_of_4 span_1_of_4">
				<div class="hover_img">
					<img src="/enginery/images/pic6.jpg" alt=""/>
				</div>
				<div class="caption1">
					 <time datetime="#">November 17, 2013</time> <br/>
					 <a href="#" class="lnk">Vestibulum</a>
					 <p>Quisque nulla. Vestibulum libero nisl, porta vel, scelerisque eget, malesuada at, neque. Vivamus eget nibh...</p>
					 <a href="#" class="btn btn-primary btn1">read more</a>
				</div>
			</div>
			<div class="col_1_of_4 span_1_of_4">
				<div class="hover_img">
					<img src="/enginery/images/pic7.jpg" alt=""/>
				</div>
				<div class="caption1">
					 <time datetime="#">November 17, 2013</time> <br/>
					 <a href="#" class="lnk">Vestibulum</a>
					 <p>Quisque nulla. Vestibulum libero nisl, porta vel, scelerisque eget, malesuada at, neque. Vivamus eget nibh...</p>
					 <a href="#" class="btn btn-primary btn1">read more</a>
				</div>
			</div>
			<div class="clear"></div>
		</div>
	</div>
  </xsl:template>

</xsl:stylesheet>
