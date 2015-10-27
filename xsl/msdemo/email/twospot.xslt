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

	<table border="0" cellpadding="0" cellspacing="0" width="100%">
		<tr>
			<td style="padding-top:20px;padding-bottom:20px;">
				<center>
					<table border="0" cellpadding="0" cellspacing="0" width="600px" style="height:100%;">
						<tr>
							<td valign="top" width="280">
								<table border="0" cellpadding="20" cellspacing="0" width="100%">
									<tr>
										<td valign="top">
											<img src="http://keenthemes.com/assets/img/emailtemplate/photo1.jpg"  width="260px" height="200px" alt="photo"/>
											<br />
											<h3>New Xperia</h3>
											<div class="textdark">
												Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat  
												<a href="#" target="_blank">Checkout it here</a>. 
												Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis.
											</div>
										</td>
									</tr>
								</table>
							</td>
							<td valign="top" width="280">
								<table border="0" cellpadding="20" cellspacing="0" width="100%">
									<tr>
										<td valign="top">
											<img src="http://keenthemes.com/assets/img/emailtemplate/photo2.jpg"  width="260px" height="200px" alt="photo"/>
											<br />
											<h3>New Canon</h3>
											<div class="textdark">
												Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat  
												<a href="#" target="_blank">Checkout it here</a>. 
												Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis.
											</div>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</center>
			</td>
		</tr>
	</table>


  </xsl:template>

</xsl:stylesheet>
