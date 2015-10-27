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

	<!-- BEGIN CONTACT -->
	<h2>Our Contacts</h2>
	<address>
	  <strong><sc:text select="$footer" field="company" /></strong><br/>
	  <sc:text select="$footer" field="address" /><br/>
	  <sc:text select="$footer" field="address 2" /><br/>
	  <sc:text select="$footer" field="address 3" /><br/>
	  <abbr title="Phone">P:</abbr>&#160;<sc:text select="$footer" field="phone" /><br/>
	  <abbr title="Fax">F:</abbr>&#160;<sc:text select="$footer" field="fax" />
	</address>
	<address>
	  <strong>Email</strong><br/>
	  <sc:link select="$footer" field="email" />
	</address>
	<!-- END CONTACT -->	
	
  </xsl:template>

</xsl:stylesheet>
