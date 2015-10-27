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
  
  <xsl:variable name="colourid" select="sc:fld('colour',$sc_item)"/>
  <xsl:variable name="colouritem" select="sc:item($colourid,.)"/>
  
  <!-- entry point -->
  <xsl:template match="*">    

	<table border="0" cellpadding="0" cellspacing="0" width="100%" style="background-color:{sc:fld('hex',$colouritem)};">
		<tr>
			<td>
				<center>
					<table border="0" cellpadding="0" cellspacing="0" width="600px" style="height:100%;">
						<tr>
							<td valign="top" style="padding:20px;">
								<h1 class="fontwhite"><sc:text select="." field="title"/></h1>
								<br />
								<div class="textwhite">
									<sc:text select="." field="text"/>
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
