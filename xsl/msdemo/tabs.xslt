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
  
  <xsl:variable name="tabsitem" select="$sc_item/child::item[@template='tabs']" />
  
  <!-- entry point -->
  <xsl:template match="*">    

	<!-- BEGIN TABS AND TESTIMONIALS -->
	<div class="row margin-bottom-40">
	  <!-- TABS -->
	  <div class="col-md-12 tab-style-2">
		<ul class="nav nav-tabs">
			<xsl:for-each select="$tabsitem/item">
				<xsl:variable name="tabname" select="sc:fld('tab name',.)"/>
				<xsl:choose>
					<xsl:when test="position() = '1'">
						<li class="active"><a href="#{$tabname}" data-toggle="tab"><sc:text select="." field="title"/></a></li>
					</xsl:when>
					<xsl:otherwise>
						<li><a href="#{$tabname}" data-toggle="tab"><sc:text select="." field="title"/></a></li>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:for-each>
		</ul>
		<div class="tab-content">
			<xsl:for-each select="$tabsitem/item">
				<xsl:variable name="tabname1" select="sc:fld('tab name',.)"/>
				<div class="tab-pane row fade in" id="{$tabname1}">
					<xsl:if test="position() = '1'">
						<xsl:attribute name="class">
							<xsl:value-of select="'tab-pane row fade in active'"/>
						</xsl:attribute>
					</xsl:if>
				
					<xsl:choose>
						<xsl:when test="sc:fld('image',.)=''">
							<div class="col-md-12 col-sm-12">
							  <sc:text select="." field="text" />
							  <!-- <p><a class="more" href="#">Read more <i class="icon-angle-right"></i></a></p> -->
							</div>
						</xsl:when>
						<xsl:otherwise>
							<div class="col-md-3 col-sm-3">
								<sc:image select="." field="image" w="200" class="img-responsive" />
							</div>
							<div class="col-md-9 col-sm-9">
							  <sc:text select="." field="text" />
							  <!-- <p><a class="more" href="#">Read more <i class="icon-angle-right"></i></a></p> -->
							</div>
						</xsl:otherwise>
					</xsl:choose>
				</div>
			</xsl:for-each>
		</div>
	  </div>
	  <!-- END TABS -->
	
	</div>                
	
  </xsl:template>

</xsl:stylesheet>
