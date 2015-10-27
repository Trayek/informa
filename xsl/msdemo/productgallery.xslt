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
  <xsl:param name="tagsource" select="sc:item('B9118115-4D06-49D0-8F52-0C950C4D2899',.)" />
  

  <!-- entry point -->
  <xsl:template match="*">	
	
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

			
			<div class="col-md-6 col-sm-6 mix action mix_all" style="display: block; opacity: 1;">
			  <xsl:attribute name="class">
				col-md-6 col-sm-6 mix <sc:text select="$tags" field="tag" disable-web-editing="true"/> mix_all
			  </xsl:attribute>
				<div class="mix-inner">
				   <sc:image field="image" w="555" as="1" class="img-responsive" />
				   <div class="mix-details">
				   <xsl:variable name="imgsrc" select="sc:item((sc:fld('image',., 'mediaid')), $sc_currentitem)" />
				   
					  <h4><sc:text field="title"/></h4>
					  <p><sc:text field="summary" /></p>
					  <sc:link class="mix-link"><i class="fa fa-link"></i></sc:link>
					  <sc:link data-rel="fancybox-button" title="Project Name" href="{sc:GetMediaUrl($imgsrc)}" class="mix-preview fancybox-button"><i class="fa fa-search"></i></sc:link>
					  
						
						
					  
				   </div>           
				</div>                       
			</div>
		</xsl:for-each>
	</div>
</div>
	
  </xsl:template>

</xsl:stylesheet>
