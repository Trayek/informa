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
  
  <xsl:variable name="home" select="sc:item('110D559F-DEA5-42EA-9C1C-8A5DF7E70EF9',.)"/>
  <xsl:variable name="vertical" select="sc:fld('vertical',$home)"/>
  <xsl:variable name="about" select="sc:item('E6EE5E01-D3B1-4225-AC07-D8368398947E',.)"/>
  <xsl:variable name="clients" select="sc:item('7E3CFDC4-6FF3-48ED-A474-D8F6B2E7ABE4',.)"/>
  
  
  <!-- entry point -->
  <xsl:template match="*">    

	<!-- BEGIN CLIENTS -->
	<div class="row margin-bottom-40 our-clients">
	  <div class="col-md-3">
		
		<xsl:choose>
			<xsl:when test="$vertical=''" >
				<h2>Our Clients</h2>
			</xsl:when>
			<xsl:otherwise>
				<h2><xsl:value-of select="$vertical"/> Clients</h2>
			</xsl:otherwise>
		</xsl:choose>
		<br />
		<p>Interested to see more of our customers? Click <sc:link select="$about">here</sc:link>.</p>
	  </div>
	  <div class="col-md-9">
		<div class="owl-carousel owl-carousel6-brands">
		  <xsl:for-each select="$clients/item">
			<xsl:sort select="sc:random(count($clients/item))"/>
			<xsl:variable name="clienttag" select="sc:fld('tags',.)"/>
			<xsl:variable name="clienttagid" select="sc:item($clienttag,.)" />
			<xsl:choose>
				<xsl:when test="$clienttagid/@name=$vertical">
				  <div class="client-item">
					<sc:link>
					  <sc:image select="." field="logo off" class="img-responsive" alt=""/>
					  <sc:image select="." field="logo on" class="color-img img-responsive" alt=""/>
					</sc:link>
				  </div>
				</xsl:when>
				<xsl:when test="$vertical=''">
				  <div class="client-item">
					<sc:link>
					  <sc:image select="." field="logo off" class="img-responsive" alt=""/>
					  <sc:image select="." field="logo on" class="color-img img-responsive" alt=""/>
					</sc:link>
				  </div>
				</xsl:when>
				<xsl:otherwise>

				</xsl:otherwise>
			</xsl:choose>
		  </xsl:for-each>
		</div>
	  </div>          
	</div>
	<!-- END CLIENTS -->
		
	
  </xsl:template>

</xsl:stylesheet>
