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

	<!-- BEGIN STEPS -->
	<div class="row margin-bottom-40 front-steps-wrapper front-steps-count-3">
	  <div class="col-md-4 col-sm-4 front-step-col">
		<div class="front-step front-step1">
		  <h2><sc:text select="." field="one title"/></h2>
		  <p><sc:text select="." field="one text"/></p>
		</div>
	  </div>
	  <div class="col-md-4 col-sm-4 front-step-col">
		<div class="front-step front-step2">
		  <h2><sc:text select="." field="two title"/></h2>
		  <p><sc:text select="." field="two text"/></p>
		</div>
	  </div>
	  <div class="col-md-4 col-sm-4 front-step-col">
		<div class="front-step front-step3">
		  <h2><sc:text select="." field="three title"/></h2>
		  <p><sc:text select="." field="three text"/></p>
		</div>
	  </div>
	</div>
	<!-- END STEPS -->		
	
  </xsl:template>

</xsl:stylesheet>
