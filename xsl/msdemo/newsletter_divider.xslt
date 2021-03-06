﻿<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:sc="http://www.sitecore.net/sc"
  xmlns:dot="http://www.sitecore.net/dot"
  xmlns:sql="http://www.sitecore.net/sql"
  exclude-result-prefixes="dot sc sql">

  <!-- output directives -->
  <xsl:output method="xml" indent="no" encoding="UTF-8"  />

  <!-- sitecore parameters -->
  <xsl:param name="lang" select="'en'"/>
  <xsl:param name="id" select="''"/>
  <xsl:param name="sc_item"/>
  <xsl:param name="sc_currentitem"/>

  <xsl:variable name="fontFamily" select="'arial,helvetica,sans-serif'" />
  <xsl:variable name="fontSize" select="'11px'" />
  <xsl:variable name="linkStyle" select="'color: black; font-wight: bold; text-decoration: none;'" />

  <xsl:variable name="linkTid" select="'{4DF80BE6-AE83-40E4-81B4-480F7B60AE15}'"/>

  <xsl:variable name="bg" select="'~/media/Images/Newsletter/Common/bg_white.ashx'" />
  
  <!-- entry point -->
  <xsl:template match="*">
    <xsl:call-template name="showMainSection"/>
  </xsl:template>

  <xsl:template name="showMainSection">
    <hr style="margin-bottom: 20px;"/>
  </xsl:template>

  <xsl:template name="showLinks">
    <xsl:param name="bgSrc" select="''"/>

    <table cellspacing="2" cellpadding="0" border="0" style="font-family: {$fontFamily}; font-size: {$fontSize};">
      <xsl:for-each select="./item[@tid = $linkTid]">
        <tr valign="top">
          <td>
            <xsl:choose>
              <xsl:when test="sc:pageMode()/pageEditor/edit=false()">
                <sc:link field="Destination" style="{$linkStyle}" >
                  <b style="color: #CC0000; font-size: 12px;">></b>
                </sc:link>
              </xsl:when>
              <xsl:otherwise>
                <b style="color: #CC0000; font-size: 12px;">></b>
              </xsl:otherwise>
            </xsl:choose>
          </td>
          <td>
            <sc:link field="Destination" style="{$linkStyle}" >
              <span style="text-decoration:underline;">
                <b>
                  <sc:text field="Text"/>
                </b>
              </span>
            </sc:link>
          </td>
        </tr>
      </xsl:for-each>
    </table>
  </xsl:template>

</xsl:stylesheet>