<%@ Control Language="c#" AutoEventWireup="true" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>

<div class="row margin-bottom-40">
  <!-- BEGIN CONTENT -->
  <div class="col-md-12 col-sm-12">
	<sc:XslFile runat="server" RenderingID="{CFEABF87-198B-497E-97B9-B5DEF5847952}" Path="/xsl/msdemo/personalisedwelcome.xslt" ID="breadcrumb" ></sc:XslFile>
	<div class="content-page">
	  <div class="row">
		<!-- BEGIN LEFT SIDEBAR -->            
		<div class="col-md-4 col-sm-4">
			<sc:placeholder key="vwtopleft" runat="server" />              
		</div>
		<!-- END LEFT SIDEBAR -->

		<!-- BEGIN CENTRE -->
		<div class="col-md-4 col-sm-4">
			<sc:placeholder key="vwtopcentre" runat="server" /> 
		</div>
		<!-- END CENTRE -->
		
		<!-- BEGIN RIGHT SIDEBAR -->            
		<div class="col-md-4 col-sm-4">
			<sc:placeholder key="vwtopright" runat="server" /> 
		</div>
		<!-- END RIGHT SIDEBAR -->            
	  </div>
	</div>
  </div>
  <!-- END CONTENT -->
</div>
<div class="row margin-bottom-40">
  <!-- BEGIN CONTENT -->
  <div class="col-md-12">
	<div class="content-page">
		<sc:placeholder key="vwbottom" runat="server" />              
	</div>     
  </div>
  <!-- END CONTENT -->
</div>