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

	<!-- BEGIN BLOG PHOTOS STREAM -->
	<div class="blog-photo-stream margin-bottom-20">
		<h2>Photos Stream</h2>
		<ul class="list-unstyled">
			<li><a href="#"><img alt="" src="/metronic/frontend/pages/img/people/img5-small.jpg"/></a></li>
			<li><a href="#"><img alt="" src="/metronic/frontend/pages/img/works/img1.jpg"/></a></li>
			<li><a href="#"><img alt="" src="/metronic/frontend/pages/img/people/img4-large.jpg"/></a></li>
			<li><a href="#"><img alt="" src="/metronic/frontend/pages/img/works/img6.jpg"/></a></li>
			<li><a href="#"><img alt="" src="/metronic/frontend/pages/img/works/img3.jpg"/></a></li>
			<li><a href="#"><img alt="" src="/metronic/frontend/pages/img/people/img2-large.jpg"/></a></li>
			<li><a href="#"><img alt="" src="/metronic/frontend/pages/img/works/img2.jpg"/></a></li>
			<li><a href="#"><img alt="" src="/metronic/frontend/pages/img/works/img5.jpg"/></a></li>
			<li><a href="#"><img alt="" src="/metronic/frontend/pages/img/people/img5-small.jpg"/></a></li>
			<li><a href="#"><img alt="" src="/metronic/frontend/pages/img/works/img1.jpg"/></a></li>
			<li><a href="#"><img alt="" src="/metronic/frontend/pages/img/people/img4-large.jpg"/></a></li>
			<li><a href="#"><img alt="" src="/metronic/frontend/pages/img/works/img6.jpg"/></a></li>
		</ul>                    
	</div>
	<!-- END BLOG PHOTOS STREAM -->	
	
  </xsl:template>

</xsl:stylesheet>
