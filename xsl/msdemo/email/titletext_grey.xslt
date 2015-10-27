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

	<table border="0" cellpadding="0" cellspacing="0" width="100%" style="background-color:#f8f8f8;border-bottom:1px solid #e7e7e7;">
		<tr>
			<td>
				<center>
					<table border="0" cellpadding="0" cellspacing="0" width="600px" style="height:100%;">
						<tr>
							<td valign="top" style="padding:20px;">
								<h2>70% Discount!</h2>
								<br />
								<div class="textdark">
									<strong>Getting started:</strong> 
									Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis.
								</div>
								<br />
							</td>
						</tr>
					</table>
				</center>
			</td>
		</tr>
	</table>


  </xsl:template>

</xsl:stylesheet>
