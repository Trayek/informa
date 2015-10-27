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
  xmlns:xdb="http://www.sitecore.net/xDB" 

  exclude-result-prefixes="dot sc">

<!-- output directives -->
<xsl:output method="html" indent="no" encoding="UTF-8" />

<!-- parameters -->
<xsl:param name="lang" select="'en'"/>
<xsl:param name="id" select="''"/>
<xsl:param name="sc_item"/>
<xsl:param name="sc_currentitem"/>

<!-- variables -->
<!-- To avoid unnecessary processing comment out this variable if you do not need to use it 
<xsl:variable name="login" select="sc:item('A8EE9F97-14D9-4C36-9C05-FC9A7F196A59',.)" />  -->

<!-- entry point -->
<xsl:template match="*">
  <xsl:apply-templates select="$sc_item" mode="main"/>
</xsl:template>

<!--==============================================================-->
<!-- main                                                         -->
<!--==============================================================-->
<xsl:template match="*" mode="main">


<div class="col-md-12">
	<div class="row">
		<div class="col-md-6">
		  <div class="portlet box scbrandorange">
			<div class="portlet-title">
			  <div class="caption">
				<i class="fa fa-save" style="color:#fff;"></i>Explicit Data
			  </div>
			</div>
			<div class="portlet-body">
				<div class="row margin-bottom-10">
					<div class="col-md-3">
						Firstname:
					</div>
					<div class="col-md-9">
						<strong><xsl:value-of select="sc:UserInfo('Firstname')"/></strong>
					</div>
				</div>
				<div class="row margin-bottom-10">
					<div class="col-md-3">
						Surname:
					</div>
					<div class="col-md-9">
						<strong><xsl:value-of select="sc:UserInfo('Surname')"/></strong>
					</div>
				</div>
				<div class="row margin-bottom-10">
					<div class="col-md-3">
						Company:
					</div>
					<div class="col-md-9">
						<strong><xsl:value-of select="sc:UserInfo('Company')"/></strong>
					</div>
				</div>
				<div class="row margin-bottom-10">
					<div class="col-md-3">
						Job title:
					</div>
					<div class="col-md-9">
						<strong><xsl:value-of select="sc:UserInfo('JobTitle')"/></strong>
					</div>
				</div>
				<div class="row margin-bottom-10">
					<div class="col-md-3">
						E-mail:
					</div>
					<div class="col-md-9">
						<strong><xsl:value-of select="sc:UserInfo('Email')"/><!-- <xsl:value-of select="sa:UserEmail()"/> --></strong>
					</div>
				</div>
				<div class="row margin-bottom-10">
					<div class="col-md-3">
						Phone:
					</div>
					<div class="col-md-9">
						<strong><xsl:value-of select="sc:UserInfo('Phone')"/></strong>
					</div>
				</div>
				<div class="row margin-bottom-10">
					<div class="col-md-3">
						Address:
					</div>
					<div class="col-md-9">
						<strong><xsl:value-of select="sc:UserInfo('Address1')"/></strong><br/>
						<strong><xsl:value-of select="sc:UserInfo('Address2')"/></strong><br/>
						<strong><xsl:value-of select="sc:UserInfo('Address3')"/></strong><br/>
						<strong><xsl:value-of select="sc:UserInfo('City')"/></strong><br/>
						<strong><xsl:value-of select="sc:UserInfo('Postcode')"/></strong><br/>
						<strong><xsl:value-of select="sc:UserInfo('Country')"/></strong><br/>
					</div>
				</div>
				<div class="row margin-bottom-10">
					<div class="col-md-3">
						Call-back received?
					</div>
					<div class="col-md-9">
						<strong><xsl:value-of select="sc:UserInfo('Callback')"/></strong>
					</div>
				</div>
				<a href="http://ms8.demo/layouts/cache/Clear.aspx?cache=CRM[Users]::" class="btn scbrandorange btn-block">Sync with CRM</a>
			</div>
		  </div>
		</div>
		<div class="col-md-6">
		  <div class="portlet box scbrandpurple">
			<div class="portlet-title">
			  <div class="caption">
				<i class="fa fa-bar-chart-o" style="color:#fff;"></i>xDB Data
			  </div>
			</div>
			<div class="portlet-body">

				<i class="fa fa-trophy" style="margin-bottom: 10px; margin-right:2px;"></i> Goals
				    <dl>
					  <xsl:for-each select="xdb:Goals()[@isgoal='1']">
						<dd>
						  <xsl:value-of select="."/> (<xsl:value-of select="@url"/>) - <xsl:value-of select="sc:formatdate(@datetime)"/>
						</dd>
					  </xsl:for-each>
					</dl>
				<hr/>
				<i class="fa fa-flag-checkered"></i> Campaigns
<!--
      <xsl:choose>
        <xsl:when test="xdb:Campaign()">
          <xsl:value-of select="sc:item(xdb:Campaign(),.)/@name"/>
        </xsl:when>
        <xsl:otherwise>
          No campaign
        </xsl:otherwise>
      </xsl:choose>
-->
				
				<hr/>
				<i class="fa fa-users" style="margin-bottom: 10px; margin-right:2px;"></i> Profiles
					<xsl:for-each select="xdb:Profiles()">
					  <h4><xsl:value-of select="@name"/></h4>
					  <xsl:for-each select="./key">
						<xsl:value-of select="@name"/>: <xsl:value-of select="."/><br/>
					  </xsl:for-each>
					</xsl:for-each>
				<hr/>
				
				<i class="fa fa-users" style="margin-bottom: 10px; margin-right:2px;"></i> Contact
					<xsl:variable name="contact" select="xdb:Contact()"/> 
					<ul>
					  <li>
						Visit Count: <xsl:value-of select="$contact/@visitcount"/>
					  </li>
					  <li>
						Tags:
						<dl>
						  <xsl:for-each select="$contact/tags/tag">
							<dd>
							  <xsl:value-of select="@key"/>: <xsl:value-of select="."/> (<xsl:value-of select="sc:formatdate(@datetime)"/>)
							</dd>
						  </xsl:for-each>
						</dl>
					  </li>
					</ul>
					
				<a href="About" class="btn scbrandpurple btn-block">Update Profile</a>
			</div>
		  </div>
		</div>
	</div>
</div>


 
</xsl:template>
</xsl:stylesheet>