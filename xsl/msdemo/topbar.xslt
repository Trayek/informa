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
  
  <xsl:variable name="footer" select="sc:item('7FBC4CFA-EAE4-45A9-B7B5-C2799D2B01F6',.)"/>
  
  <!-- entry point -->
  <xsl:template match="*">  
  
    <!-- BEGIN TOP BAR -->
    <div class="pre-header">
        <div class="container">
            <div class="row">
                <!-- BEGIN TOP BAR LEFT PART -->
                <div class="col-md-6 col-sm-6 additional-shop-info">
                    <ul class="list-unstyled list-inline">
                        <li><i class="fa fa-phone"></i><span><xsl:value-of select="sc:fld('phone',$footer)"/></span></li>
                        <li><i class="fa fa-envelope-o"></i><span><sc:link select="$footer" field="email" disable-web-editing="true"/></span></li>
                    </ul>
                </div>
                <!-- END TOP BAR LEFT PART -->
                <!-- BEGIN TOP BAR MENU -->
                <div class="col-md-6 col-sm-6 additional-nav">
                    <ul class="list-unstyled list-inline pull-right">
						<xsl:choose>				
							<xsl:when test="sc:IsLoggedIn()">
								<li><a href="/my-account">My Account</a></li>
								<li><a href="/logout">Log out</a></li>	
								<xsl:if test="sc:pageMode()/pageEditor/edit">
									<li><a href="/login">Log In</a></li>
									<li><a href="/register">Registration</a></li>	
								</xsl:if>
							</xsl:when>
							<xsl:otherwise>
								<li><a href="/login">Log In</a></li>
								<li><a href="/register">Registration</a></li>							
							</xsl:otherwise>
						</xsl:choose>
                    </ul>
                </div>
                <!-- END TOP BAR MENU -->
            </div>
        </div>        
    </div>
    <!-- END TOP BAR -->
	
  </xsl:template>

</xsl:stylesheet>
