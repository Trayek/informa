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
  <xsl:param name="tagsource" select="sc:item('460630BC-83B5-4F7C-B8BF-9D962AA5AE07',.)" />
  

  <!-- entry point -->
  <xsl:template match="*">	
	
	
	<h2>Some of our clients...</h2>
<div class="filter-v1">


  <ul class="mix-filter">
	<li data-filter="all" class="filter active">All</li>
	<xsl:for-each select="$tagsource/item[sc:IsItemOfType('tag',.)]">
		<li data-filter="" class="filter">
			<xsl:attribute name="data-filter">
				<xsl:value-of select="sc:fld('tag',.)"/>
			</xsl:attribute>
			<sc:text field="tag" disable-web-editing="true"/>
		</li>
	</xsl:for-each>
	
  </ul>
  	<div class="row mix-grid thumbnails">
		<xsl:for-each select="./item">
			 <xsl:variable name="tags" select="sc:item(sc:fld('tags',.),.)"/> 
			<!--<xsl:value-of select="$tags"/>-->

			
			<div class="col-md-3 col-sm-3 mix action mix_all" style="display: block; opacity: 1;">
			  <xsl:attribute name="class">
				col-md-2 col-sm-3 mix <sc:text select="$tags" field="tag" disable-web-editing="true"/> mix_all
			  </xsl:attribute>
				<div class="mix-inner">
				   <sc:link field="website"><sc:image field="logo on" class="img-responsive" /></sc:link>
				</div>                       
			</div>
		</xsl:for-each>
	</div>
</div>
	
  </xsl:template>

</xsl:stylesheet>
