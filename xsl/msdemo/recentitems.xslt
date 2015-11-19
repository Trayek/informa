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
  
  <!-- entry point -->
  <xsl:template match="*">    

	<!-- BEGIN RECENT WORKS -->
	<div class="row recent-work margin-bottom-40">
	  <div class="col-md-3">
		<h2><sc:link>Recent <sc:text field="title" disable-web-editing="true"/></sc:link></h2>
		<sc:text field="text"/>
	  </div>
	  <div class="col-md-9">
		<div class="owl-carousel owl-carousel3">
			<xsl:for-each select="./item">
				<xsl:sort select="sc:fld('date',.)" data-type="text" order="descending"/>
				<xsl:variable name="clienttag" select="sc:fld('tags',.)"/>
				<xsl:variable name="clienttagid" select="sc:item($clienttag,.)" />
				
				<xsl:choose>
					<xsl:when test="$clienttagid/@name=$vertical">
					  <div class="recent-work-item">
						<em>
						<sc:link>
						  <sc:image select="." mw="273" mh="152" as="1"  field="teaser image" class="img-responsive" />
						</sc:link>
						</em>
						<sc:link class="recent-work-description">
						  <strong><sc:text field="title"/></strong>
						  <b><sc:date field="date" format="MMMM dd, yyyy"/></b>
						</sc:link>
					  </div>
					</xsl:when>
					<xsl:when test="$vertical=''">
					  <div class="recent-work-item">
						<em>
						<sc:link>
						  <sc:image select="." w="273" h="152" as="1" field="teaser image" class="img-responsive" />
						</sc:link>
						</em>
						<sc:link class="recent-work-description">
						  <strong><sc:text field="title"/></strong>
						  <b><sc:date field="date" format="MMMM dd, yyyy"/></b>
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
	<!-- END RECENT WORKS -->	
	
  </xsl:template>

</xsl:stylesheet>
