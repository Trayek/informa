<?xml version="1.0" encoding="UTF-8"?>

<!--=============================================================
    File: User Profile.xslt                                                   
    Created by: sitecore\admin                                       
    Created: 31/10/2012 13:57:03                                               
    Copyright notice at bottom of file
==============================================================-->

<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
  xmlns:sc="http://www.sitecore.net/sc" 
  xmlns:dot="http://www.sitecore.net/dot"

  exclude-result-prefixes="dot sc">

<!-- output directives -->
<xsl:output method="html" indent="no" encoding="UTF-8" />

<!-- parameters -->
<xsl:param name="lang" select="'en'"/>
<xsl:param name="id" select="''"/>
<xsl:param name="sc_item"/>
<xsl:param name="sc_currentitem"/>

<!-- variables -->
<!-- To avoid unnecessary processing comment out this variable if you do not need to use it -->
<xsl:variable name="urlid" select="sc:qs('id')" />
<xsl:variable name="itemid" select="sc:item($urlid,.)" />
<xsl:variable name="wfstateid" select="sc:fld('__Workflow state',$itemid)" />
<xsl:variable name="wfstateitem" select="sc:item($wfstateid,.)" />

<!-- entry point -->
<xsl:template match="*">
  <xsl:apply-templates select="$sc_item" mode="main"/>
</xsl:template>

<!--==============================================================-->
<!-- main                                                         -->
<!--==============================================================-->
<xsl:template match="*" mode="main">

<div class="col-md-12">
	<div class="row" style="padding-left: 15px;padding-right:15px;">
		<div class="portlet box scbrandred">
			<div class="portlet-title">
			  <div class="caption">
				<i class="fa fa-list-alt" style="color:#fff;"></i>Submission ID: <xsl:value-of select="$urlid"/>
			  </div>
			</div>
			<div class="portlet-body">
				<div class="row" style="font-weight: 600">
					<div class="col-md-2">
						Name:
					</div>
					<div class="col-md-2">
						Company:
					</div>
					<div class="col-md-6">
						Set list:
					</div>
					<div class="col-md-2">
						Status:
					</div>
				</div>
				<hr style="margin:2px 0 10px 0 !important;"/>
				<div class="row">
					<div class="col-md-2">
						<xsl:value-of select="sc:fld('firstname',$itemid)"/>&#160;<xsl:value-of select="sc:fld('surname',$itemid)"/>
					</div>
					<div class="col-md-2">
						<xsl:value-of select="sc:fld('company',$itemid)"/>
					</div>
					<div class="col-md-6">
						<xsl:call-template name="br">
							<xsl:with-param name="text" select="sc:fld('set list',$itemid)"/>
						</xsl:call-template>

					</div>
					<div class="col-md-2">
						<xsl:if test="$wfstateitem/@name = 'Received'">
							<xsl:attribute name="class">
								<xsl:value-of select="'col-md-2 text-danger'"/>
							</xsl:attribute>
						</xsl:if>
						<xsl:if test="$wfstateitem/@name = 'Review'">
							<xsl:attribute name="class">
								<xsl:value-of select="'col-md-2 text-warning'"/>
							</xsl:attribute>
						</xsl:if>
						<xsl:if test="$wfstateitem/@name = 'Approved'">
							<xsl:attribute name="class">
								<xsl:value-of select="'col-md-2 text-success'"/>
							</xsl:attribute>
						</xsl:if>
						<xsl:value-of select="$wfstateitem/@name"/>
					</div>
				</div>
				<hr style="margin:10px 0 10px 0 !important;"/>
			</div>
		</div>
	</div>
</div>
</xsl:template>

<xsl:template name="br">
    <xsl:param name="text"/>
    <xsl:choose>
        <xsl:when test="contains($text,'&#xa;')">
            <xsl:value-of select="substring-before($text,'&#xa;')"/>
            <br/>
            <xsl:call-template name="br">
                <xsl:with-param name="text">
                    <xsl:value-of select="substring-after($text,'&#xa;')"/>
                </xsl:with-param>
            </xsl:call-template>
        </xsl:when>
        <xsl:otherwise>
            <xsl:value-of select="$text"/>
        </xsl:otherwise>
    </xsl:choose>
</xsl:template>
</xsl:stylesheet>