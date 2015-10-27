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

	<!-- BEGIN SERVICE BOX -->   
	<div class="row service-box margin-bottom-40">
	  <div class="col-md-4 col-sm-4">
		<div class="service-box-heading">
		  <em>
			<i class="">
			  <xsl:attribute name="class">
				<xsl:value-of select="sc:fld('icon 1',.)"/>
			  </xsl:attribute>
			</i>
		  </em>
		  <span><sc:text field="title 1"/></span>
		</div>
		<p><sc:text field="text 1"/></p>
	  </div>
	  <div class="col-md-4 col-sm-4">
		<div class="service-box-heading">
		  <em>
			<i class="">
			  <xsl:attribute name="class">
				<xsl:value-of select="sc:fld('icon 2',.)"/>
			  </xsl:attribute>
			</i>
		  </em>
		  <span><sc:text field="title 2"/></span>
		</div>
		<p><sc:text field="text 2"/></p>
	  </div>
	  <div class="col-md-4 col-sm-4">
		<div class="service-box-heading">
		  <em>
			<i class="">
			  <xsl:attribute name="class">
				<xsl:value-of select="sc:fld('icon 3',.)"/>
			  </xsl:attribute>
			</i>
		  </em>
		  <span><sc:text field="title 3"/></span>
		</div>
		<p><sc:text field="text 3"/></p>
	  </div>
	</div>
	<!-- END SERVICE BOX -->	
	
  </xsl:template>

</xsl:stylesheet>
