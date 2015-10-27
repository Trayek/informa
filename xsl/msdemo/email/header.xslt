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
  <xsl:variable name="colourid" select="sc:fld('theme',$home)"/>
  <xsl:variable name="colouritem" select="sc:item($colourid,.)"/>
  
  <!-- entry point -->
  <xsl:template match="*">    

	<table border="0" cellpadding="0" cellspacing="0" width="100%" style="background-color:{sc:fld('hex',$colouritem)}; height:76px;">
		<tr>
			<td align="center">
				<center>
					<table border="0" cellpadding="0" cellspacing="0" width="600px" style="height:100%;">
						<tr>
							<td align="left" valign="middle" style="padding-left:20px;">
								<sc:link select="$home" class="site-logo"><sc:image select="$home" field="logo white" mh="50"/></sc:link>
							</td>
							<td align="right" valign="middle" style="padding-right:20px;">
							<!--	<table border="0" cellpadding="0" cellspacing="0" width="200px" style="height:100%;">
									<tr>
										<td width="30px">&#160;</td>
										<td>
											<a href="#">
											<img src="http://keenthemes.com/assets/img/emailtemplate/social_facebook.png"  width="30px" height="30px" alt="social icon"/>
											</a>
										</td>
										<td style="padding-left:5px">
											<a href="#">
											<img src="http://keenthemes.com/assets/img/emailtemplate/social_twitter.png"  width="30px" height="30px" alt="social icon"/>
											</a>
										</td>
										<td style="padding-left:5px">
											<a href="#">
											<img src="http://keenthemes.com/assets/img/emailtemplate/social_googleplus.png"  width="30px" height="30px" alt="social icon"/>
											</a>
										</td>
										<td style="padding-left:5px">
											<a href="#">
											<img src="http://keenthemes.com/assets/img/emailtemplate/social_linkedin.png"  width="30px" height="30px" alt="social icon"/>
											</a>
										</td>
										<td style="padding-left:5px">
											<a href="#">
											<img src="http://keenthemes.com/assets/img/emailtemplate/social_rss.png"  width="30px" height="30px" alt="social icon"/>
											</a>
										</td>
									</tr>
								</table>
							-->
							</td>
						</tr>
					</table>
				</center>
			</td>
		</tr>
	</table>



  </xsl:template>

</xsl:stylesheet>
