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

	<li class="span4">
		<figure class="featured-thumbnail thumbnail">
			<a href="/images/img-3.jpg" title="featured" rel="prettyPhoto-1030168181">
				<sc:image field="image" mw="370" mh="235" alt="featured"/>
				<span class="zoom-icon"></span>
			</a>
		</figure>
		<div class="clear"></div>
		<h5>
			<a href="" title="featured">featured</a>
		</h5>
		<p class="excerpt">
			<a href="" title="featured"><sc:text field="summary"/></a>
		</p>
		<a href="" class="btn btn-primary" title="featured">See all</a>
	</li>
	
  </xsl:template>

</xsl:stylesheet>
