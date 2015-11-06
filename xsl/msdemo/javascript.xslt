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
  
  <!-- entry point -->
  <xsl:template match="*">    

    <!-- Load javascripts at bottom, this will reduce page load time -->
    <!-- BEGIN CORE PLUGINS (REQUIRED FOR ALL PAGES) -->
    <!--[if lt IE 9]>
    <script src="/metronic/global/plugins/respond.min.js"></script>
    <![endif]--> 
	
		<script src="/metronic/global/plugins/jquery.min.js" type="text/javascript"></script>
		<script src="/metronic/global/plugins/jquery-migrate.min.js" type="text/javascript"></script>
		<script>
		 jQuery2=jQuery.noConflict();
		</script>
		<script src="/metronic/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>   	
		<script src="/metronic/frontend/layout/scripts/back-to-top.js" type="text/javascript"></script>	


    <!-- END CORE PLUGINS -->

	    <!-- BEGIN PAGE LEVEL JAVASCRIPTS (REQUIRED ONLY FOR CURRENT PAGE) -->
    <script src="/metronic/global/plugins/fancybox/source/jquery.fancybox.pack.js" type="text/javascript"></script><!-- pop up -->
    <script src="/metronic/global/plugins/carousel-owl-carousel/owl-carousel/owl.carousel.min.js" type="text/javascript"></script><!-- slider for products -->
	<script src="/metronic/global/plugins/jquery-mixitup/jquery.mixitup.min.js" type="text/javascript"></script>
	<script src="/metronic/frontend/pages/scripts/portfolio.js" type="text/javascript"></script>
	
    <!-- BEGIN RevolutionSlider -->
  
    <script src="/metronic/global/plugins/slider-revolution-slider/rs-plugin/js/jquery.themepunch.revolution.min.js" type="text/javascript"></script> 
    <script src="/metronic/global/plugins/slider-revolution-slider/rs-plugin/js/jquery.themepunch.tools.min.js" type="text/javascript"></script> 
	
	<xsl:choose>
		<xsl:when test="sc:pageMode()/pageEditor/edit">	
			<script src="/metronic/frontend/pages/scripts/revo-slider-init-pe.js" type="text/javascript"></script>
		</xsl:when>
		<xsl:otherwise>
			<script src="/metronic/frontend/pages/scripts/revo-slider-init.js" type="text/javascript"></script>
		</xsl:otherwise>
	</xsl:choose>
    
    <!-- END RevolutionSlider -->

    <script src="/metronic/frontend/layout/scripts/layout.js" type="text/javascript"></script>
    <script src="/metronic/global/plugins/rateit/src/jquery.rateit.js" type="text/javascript"></script>
    
	
	<script type="text/javascript">
		jQuery(document).ready(function() {
			Layout.init();    
			Layout.initOWL();
			RevosliderInit.initRevoSlider();
			Layout.initTwitter();
			//Layout.initFixHeaderWithPreHeader(); /* Switch On Header Fixing (only if you have pre-header) */
			//Layout.initNavScrolling(); 
			Portfolio.init();

		});
	</script>	
    <!-- END PAGE LEVEL JAVASCRIPTS -->
				
  </xsl:template>

</xsl:stylesheet>
