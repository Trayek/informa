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

	<table border="0" cellpadding="0" cellspacing="0" width="100%" style="border-bottom:1px solid #e7e7e7;">
		<tr>
			<td>
				<center>
					<table border="0" cellpadding="0" cellspacing="0" width="600px" style="height:100%;">
						<tr>
							<td colspan="2" height="20px"></td>
						</tr>
						<tr>
							<td align="left" valign="bottom" style="padding-left:20px; padding-bottom:20px">
								<h1><sc:text select="." field="title" /></h1>
								<br />
								<div class="textdark"><sc:text select="." field="text" /></div>
								<br />
								<button type="button" class="btn blue">More Details</button>
							</td>
							<td align="right" valign="bottom" width="220px" style="padding-right:20px;">
								<sc:image select="." field="image" mh="294" mw="174" bc="white" as="1"/>
							</td>
						</tr>
					</table>
				</center>
			</td>
		</tr>
	</table>


  </xsl:template>

</xsl:stylesheet>
