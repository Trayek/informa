<%@ Control Language="c#" AutoEventWireup="true" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" %>


<sc:XslFile runat="server" RenderingID="{F15C0229-ACE5-4EFA-8172-8C1F57118E8F}" Path="/xsl/msdemo/breadcrumb.xslt" ID="breadcrumb" ></sc:XslFile>
<div class="row margin-bottom-40">
  <!-- BEGIN CONTENT -->
  <div class="col-md-12 col-sm-12">
	<div class="content-page">
	  <div class="row">
		<!-- BEGIN LEFT SIDEBAR -->            
		<div class="col-md-2 col-sm-2">
			<sc:placeholder key="leftcontent" runat="server" />              
		</div>
		<!-- END LEFT SIDEBAR -->

		<!-- BEGIN CENTRE -->
		<div class="col-md-8 col-sm-8">
			<sc:placeholder key="content" runat="server" /> 
		</div>
		<!-- END CENTRE -->
		
		<!-- BEGIN RIGHT SIDEBAR -->            
		<div class="col-md-2 col-sm-2">
			<sc:placeholder key="rightcontent" runat="server" /> 
		</div>
		<!-- END RIGHT SIDEBAR -->            
	  </div>
	</div>
  </div>
  <!-- END CONTENT -->
</div>