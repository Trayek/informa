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
			<td style="padding:20px;">
				<center>
					<table border="0" cellpadding="0" cellspacing="0" width="600px" style="padding:20px; height:100%;">
						<tr>
							<td valign="top" colspan="4">
								<h2>The New Stunning Items are arrived!</h2>
								<br />
								<div class="textdark">
									<strong>Getting started:</strong> 
									Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis.
								</div>
								<br />
							</td>
						</tr>
						<tr>
							<td valign="top" width="135">
								<table border="0" cellpadding="10" cellspacing="0" width="100%">
									<tr>
										<td valign="top">
											<img src="http://keenthemes.com/assets/img/emailtemplate/photo3.jpg"  width="120px" height="100px" alt="photo"/>
											<br />
											<h4 class="h4">Item 1</h4>
											<div class="textdark">
												Lorem ipsum dolor sit amet, ut laoreet elit, sed diam sed ut dolore.
											</div>
											<br />
											<button type="button" class="btn blue">Buy Now!</button>
										</td>
									</tr>
								</table>
							</td>
							<td valign="top" width="135">
								<table border="0" cellpadding="10" cellspacing="0" width="100%">
									<tr>
										<td valign="top">
											<img src="http://keenthemes.com/assets/img/emailtemplate/photo4.jpg"  width="120px" height="100px" alt="photo"/>
											<br />
											<h4 class="h4">Item 2</h4>
											<div class="textdark">
												Lorem ipsum dolor sit amet, ut laoreet elit, sed diam sed ut dolore.
											</div>
											<br />
											<button type="button" class="btn blue">Buy Now!</button>
										</td>
									</tr>
								</table>
							</td>
							<td valign="top" width="135">
								<table border="0" cellpadding="10" cellspacing="0" width="100%">
									<tr>
										<td valign="top">
											<img src="http://keenthemes.com/assets/img/emailtemplate/photo5.jpg"  width="120px" height="100px" alt="photo"/>
											<br />
											<h4 class="h4">Item 3</h4>
											<div class="textdark">
												Lorem ipsum dolor sit amet, ut laoreet elit, sed diam sed ut dolore.
											</div>
											<br />
											<button type="button" class="btn blue">Buy Now!</button>
										</td>
									</tr>
								</table>
							</td>
							<td valign="top" width="135">
								<table border="0" cellpadding="10" cellspacing="0" width="100%">
									<tr>
										<td valign="top">
											<img src="http://keenthemes.com/assets/img/emailtemplate/photo6.jpg"  width="120px" height="100px" alt="photo"/>
											<br />
											<h4 class="h4">Item 4</h4>
											<div class="textdark">
												Lorem ipsum dolor sit amet, ut laoreet elit, sed diam sed ut dolore.
											</div>
											<br />
											<button type="button" class="btn blue">Buy Now!</button>
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
