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

	<table border="0" cellpadding="0" cellspacing="0" width="100%" style="background-color:#4aabf9;">
		<tr>
			<td>
				<center>
					<table border="0" cellpadding="0" cellspacing="0" width="600px" style="height:100%;">
						<tr>
							<td colspan="2" height="20px"></td>
						</tr>
						<tr>
							<td align="left" valign="bottom" style="padding-left:20px; padding-bottom:20px">
								<h1 class="fontwhite">Amazing Offer!</h1>
								<br />
								<div class="textwhite">Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis.</div>
								<br />
								<button type="button" class="btn red">Purchase!</button>
							</td>
							<td align="right" valign="bottom" width="220px" style="padding-right:20px;">
								<img src="http://keenthemes.com/assets/img/emailtemplate/iphone.png"  width="174px" height="294px" alt="iphone"/>
							</td>
						</tr>
					</table>
				</center>
			</td>
		</tr>
	</table>



  </xsl:template>

</xsl:stylesheet>
