<%@ Control Language="c#" AutoEventWireup="true" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>


<sc:XslFile runat="server" RenderingID="{F15C0229-ACE5-4EFA-8172-8C1F57118E8F}" Path="/xsl/msdemo/breadcrumb.xslt" ID="breadcrumb" ></sc:XslFile>
<div class="row margin-bottom-40">
  <!-- BEGIN CONTENT -->
  <div class="col-md-12 col-sm-12">
	<!-- <h1><sc:XslFile runat="server" RenderingID="{102AA11E-AD68-4870-AB48-5CF03C822C20}" Path="/xsl/msdemo/pagetitle.xslt" ID="title" ></sc:XslFile></h1> -->
	<div class="content-page">
	  <div class="row">
		<!-- BEGIN LEFT SIDEBAR -->            
		<div class="col-md-3 col-sm-3">
			<sc:placeholder key="leftcontent" runat="server" />              
		</div>
		<!-- END LEFT SIDEBAR -->

		<!-- BEGIN CENTRE -->
		<div class="col-md-6 col-sm-6">
			<sc:placeholder key="content" runat="server" /> 
		</div>
		<!-- END CENTRE -->
		
		<!-- BEGIN RIGHT SIDEBAR -->            
		<div class="col-md-3 col-sm-3">
			<sc:placeholder key="rightcontent" runat="server" /> 
		</div>
		<!-- END RIGHT SIDEBAR -->            
	  </div>
	</div>
  </div>
  <!-- END CONTENT -->
</div>