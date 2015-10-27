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
<xsl:variable name="hcc" select="sc:item('6E3C3A25-FAB8-4A41-AF3C-CF87E4E34552',.)" />

<xsl:variable name="title" select="sc:fld('title',$sc_item)" />
<xsl:variable name="icon" select="sc:fld('icon',$sc_item)" />
<xsl:variable name="vertical" select="sc:fld('vertical',$sc_item)" />

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
				<i class="fa fa-list-alt" style="color:#fff;"></i>Form Submissions
			  </div>
			</div>
			<div class="portlet-body">
				<i class="fa {$icon}" style="margin-bottom:0px !important;"></i>&#160;&#160;<xsl:value-of select="$title" /> <hr style="margin:2px 0 10px 0 !important;"/>
				<div class="row" style="font-weight: 600">
					<div class="col-md-2">
						Date submitted:
					</div>
					<div class="col-md-5">
						Application ID:
					</div>
					<div class="col-md-2">
						Applicant name:
					</div>
					<div class="col-md-2">
						Status:
					</div>
					<div class="col-md-1">
						View:
					</div>
				</div>
				<div class="row">
					<!-- <xsl:for-each select="$hcc/item[@template='hcc blue badge']"> -->
					<xsl:for-each select="./item">
						<xsl:variable name="itemid" select="./@id" />
						<xsl:variable name="wfstateid" select="sc:fld('__Workflow state',.)" />
						<xsl:variable name="wfstateitem" select="sc:item($wfstateid,.)" />
						<div class="col-md-2">
							<sc:date field="__Created" format="dd.MM.yy"/>
						</div>
						<div class="col-md-5">
							<xsl:value-of select="./@id" />
						</div>
						<div class="col-md-2">
							<xsl:value-of select="sc:fld('Surname',.)" />
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
						<div class="col-md-1">
							<a href="/en/My-Account/Submissions?id={$itemid}"><i class="fa fa-eye"></i></a>
						</div>
					</xsl:for-each>
				</div>
			</div>
			<xsl:if test="sc:fld('vertical',.)='public sector'" >
				<div class="portlet-body">
					<i class="fa fa-road" style="margin-bottom:0px !important;"></i> Report a pothole <hr style="margin:2px 0 10px 0 !important;"/>
					<div class="row" style="font-weight: 600">
						<div class="col-md-2">
							Date submitted:
						</div>
						<div class="col-md-3">
							Location:
						</div>
						<div class="col-md-2">
							Issue ID:
						</div>
						<div class="col-md-2">
							Date modified:
						</div>
						<div class="col-md-3">
							Status:
						</div>
					</div>
					<div class="row">
						<div class="col-md-2">
							19.04.15
						</div>
						<div class="col-md-3">
							Outside 4 Potter St.
						</div>
						<div class="col-md-2">
							{A43468A1-5A15}
						</div>
						<div class="col-md-2">
							19.04.15
						</div>
						<div class="col-md-3 text-success">
							Resolved
						</div>
					</div>
					<div class="row">
						<div class="col-md-2">
							03.02.15
						</div>
						<div class="col-md-3">
							Corner of B1072 and Michael St.
						</div>
						<div class="col-md-2">
							{FD056149-E0F6}
						</div>
						<div class="col-md-2">
							01.03.15
						</div>
						<div class="col-md-3 text-warning">
							In progess
						</div>
					</div>
				</div>
				<div class="portlet-body">
					<i class="fa fa-bug" style="margin-bottom:0px !important;"></i> Report website issues <hr style="margin:2px 0 10px 0 !important;"/>
					<div class="row" style="font-weight: 600">
						<div class="col-md-2">
							Date submitted:
						</div>
						<div class="col-md-3">
							Issue title:
						</div>
						<div class="col-md-2">
							Issue ID:
						</div>
						<div class="col-md-2">
							Date modified:
						</div>
						<div class="col-md-3">
							Status:
						</div>
					</div>
					<div class="row">
						<div class="col-md-2">
							19.04.15
						</div>
						<div class="col-md-3">
							Lorem ipsum dolor sit amet 
						</div>
						<div class="col-md-2">
							{36A06643-B886}
						</div>
						<div class="col-md-2">
							19.04.15
						</div>
						<div class="col-md-3 text-danger">
							New
						</div>
					</div>
					<div class="row">
						<div class="col-md-2">
							03.02.15
						</div>
						<div class="col-md-3">
							Lorem ipsum dolor sit amet 
						</div>
						<div class="col-md-2">
							{FB560C8F-D452}
						</div>
						<div class="col-md-2">
							01.03.15
						</div>
						<div class="col-md-3 text-warning">
							In progess
						</div>
					</div>
					<div class="row">
						<div class="col-md-2">
							29.01.15
						</div>
						<div class="col-md-3">
							Lorem ipsum dolor sit amet
						</div>
						<div class="col-md-2">
							{743EA3A7-5E87}
						</div>
						<div class="col-md-2">
							04.02.15
						</div>
						<div class="col-md-3 text-success">
							Resolved
						</div>
					</div>
				</div>
			</xsl:if>
		</div>
	</div>
</div>


 
</xsl:template>
</xsl:stylesheet>