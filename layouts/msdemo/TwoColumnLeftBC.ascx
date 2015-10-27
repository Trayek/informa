<%@ Control Language="c#" AutoEventWireup="true" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>


<sc:XslFile runat="server" RenderingID="{F15C0229-ACE5-4EFA-8172-8C1F57118E8F}" Path="/xsl/msdemo/breadcrumb.xslt" ID="breadcrumb" ></sc:XslFile>
<div class="row margin-bottom-40">
  <!-- BEGIN CONTENT -->
  <div class="col-md-12 col-sm-12">

	<div class="content-page">
	  <div class="row">
		<!-- BEGIN LEFT SIDEBAR -->            
		<div class="col-md-3 col-sm-3">
			<sc:placeholder key="leftcontent" runat="server" />              
		</div>
		<!-- END LEFT SIDEBAR -->

		<!-- BEGIN CENTRE -->
		<div class="col-md-9 col-sm-9">
			<sc:placeholder key="content" runat="server" /> 
		</div>
		<!-- END CENTRE -->
		         
	  </div>
	</div>
  </div>
  <!-- END CONTENT -->
</div>