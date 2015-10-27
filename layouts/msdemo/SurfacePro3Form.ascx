<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SimpleForm.cs" Inherits="Sitecore.Form.Core.Ascx.Controls.SimpleForm" %>
<%@ Register TagPrefix="asp" Namespace="System.Web.UI.WebControls" Assembly="System.Web, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" %>
<%@ Register TagPrefix="cc0" Namespace="Sitecore.Form.Web.UI.Controls" Assembly="Sitecore.Forms.Core" %>
<%@ Register TagPrefix="cc1" Namespace="System.Web.UI" Assembly="System.Web, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" %>
<%@ Register TagPrefix="cc2" Namespace="Sitecore.Form.Core.Controls.Html" Assembly="Sitecore.Forms.Core" %>
<%@ Register TagPrefix="cc4" Namespace="Sitecore.Form.Core.Validators" Assembly="Sitecore.Forms.Core" %>
<%@ Register TagPrefix="cc3" Namespace="Sitecore.Form.Web.UI.Controls" Assembly="Sitecore.Forms.Custom" %>
<link type="text/css" rel="stylesheet" href="/sitecore%20modules/shell/Web%20Forms%20for%20Marketers/themes/Default.css?v=17072012"/>
<link type="text/css" rel="stylesheet" href="/sitecore%20modules/shell/Web%20Forms%20for%20Marketers/themes/colors//jquery-ui.custom.Default.css"/>
<link type="text/css" rel="stylesheet" href="/sitecore%20modules/shell/Web%20Forms%20for%20Marketers/themes/colors/Default.css"/>
<link type="text/css" rel="stylesheet" href="/sitecore%20modules/shell/Web%20Forms%20for%20Marketers/themes/Custom.css"/>
<asp:hiddenfield runat="server" value="form_85BDCAB5FB664751B6F39BD547FFA50D" id="formreference">
</asp:hiddenfield>
<h2 runat="server" class="scfTitleBorder" id="title">
  <asp:literal runat="server" text="Want&#160;to know more?">BUM
  </asp:literal>
</h2>
<div runat="server" class="scfIntroBorder" id="intro">
</div>
<asp:validationsummary runat="server" id="_summary" forecolor="" validationgroup="form_85BDCAB5FB664751B6F39BD547FFA50D_submit" cssclass="scfValidationSummary">
</asp:validationsummary>
<cc0:submitsummary runat="server" id="form_85BDCAB5FB664751B6F39BD547FFA50D_submitSummary" cssclass="scfSubmitSummary" >
</cc0:submitsummary>
<asp:panel runat="server" id="fieldContainer">
  <div runat="server" disablewebediting="False" renderingparameters="FormID={85BDCAB5-FB66-4751-B6F3-9BD547FFA50D}">
    <div runat="server" class="scfSectionBorder">
      <div runat="server" class="scfSectionContent">
        <cc3:singlelinetext runat="server" title="Name" predefinedvalidatortextmessage="" id="field_70F5A75D553549908962511034BFBCCE" result="Sitecore.Form.Core.Controls.Data.ControlResult" controlname="Name" fieldid="{70F5A75D-5535-4990-8962-511034BFBCCE}" >
          <validators>
            <cc4:countcharsvalidator runat="server" maxlength="256" minlength="0" validationexpression="(.|\n){0,256}$" forecolor="" controltovalidate="field_70F5A75D553549908962511034BFBCCE" errormessage="Name must have at least 0 and no more than 256 characters." display="Dynamic" validationgroup="form_85BDCAB5FB664751B6F39BD547FFA50D_submit" cssclass="scfValidator trackevent.{F3D7B20C-675C-4707-84CC-5E5B4481B0EE} fieldid.{70F5A75D-5535-4990-8962-511034BFBCCE} inner.1" id="field_70F5A75D553549908962511034BFBCCE6ADFFAE3DADB451AB530D89A2FD0307B_validator" >Name must have at least 0 and no more than 256 characters.</cc4:countcharsvalidator>
            <cc4:customregularexpressionvalidator runat="server" predefinedvalidatortextmessage="The value of the Name field is not valid." validationexpression="^(.|\n)*$" forecolor="" controltovalidate="field_70F5A75D553549908962511034BFBCCE" errormessage="The value of the Name field is not valid." display="Dynamic" validationgroup="form_85BDCAB5FB664751B6F39BD547FFA50D_submit" cssclass="scfValidator trackevent.{844BBD40-91F6-42CE-8823-5EA4D089ECA2} fieldid.{70F5A75D-5535-4990-8962-511034BFBCCE} inner.1" id="field_70F5A75D553549908962511034BFBCCE070FCA141E9A45D78611EA650F20FE77_validator" >The value of the Name field is not valid.</cc4:customregularexpressionvalidator>
          </validators>
          <requred>
          </requred>
        </cc3:singlelinetext>
        <cc3:singlelinetext runat="server" title="Company" cssclass="form-control fieldid.{F2C186B9-8FD1-4FE8-827C-9D6075BAC35F} name.Company" predefinedvalidatortextmessage="" id="field_F2C186B98FD14FE8827C9D6075BAC35F" result="Sitecore.Form.Core.Controls.Data.ControlResult" controlname="Company" fieldid="{F2C186B9-8FD1-4FE8-827C-9D6075BAC35F}" >
          <validators>
            <cc4:countcharsvalidator runat="server" maxlength="256" minlength="0" cssclass="scfValidator trackevent.{F3D7B20C-675C-4707-84CC-5E5B4481B0EE} fieldid.{F2C186B9-8FD1-4FE8-827C-9D6075BAC35F} inner.1" display="Dynamic" errormessage="Company must have at least 0 and no more than 256 characters." validationexpression="(.|\n){0,256}$" forecolor="" controltovalidate="field_F2C186B98FD14FE8827C9D6075BAC35F" validationgroup="form_85BDCAB5FB664751B6F39BD547FFA50D_submit" id="field_F2C186B98FD14FE8827C9D6075BAC35F6ADFFAE3DADB451AB530D89A2FD0307B_validator" >Company must have at least 0 and no more than 256 characters.</cc4:countcharsvalidator>
            <cc4:customregularexpressionvalidator runat="server" cssclass="scfValidator trackevent.{844BBD40-91F6-42CE-8823-5EA4D089ECA2} fieldid.{F2C186B9-8FD1-4FE8-827C-9D6075BAC35F} inner.1" display="Dynamic" errormessage="The value of the Company field is not valid." predefinedvalidatortextmessage="The value of the Company field is not valid." validationexpression="^(.|\n)*$" forecolor="" controltovalidate="field_F2C186B98FD14FE8827C9D6075BAC35F" validationgroup="form_85BDCAB5FB664751B6F39BD547FFA50D_submit" id="field_F2C186B98FD14FE8827C9D6075BAC35F070FCA141E9A45D78611EA650F20FE77_validator" >The value of the Company field is not valid.</cc4:customregularexpressionvalidator>
          </validators>
          <requred>
          </requred>
        </cc3:singlelinetext>
        <cc3:email runat="server" title="Email" cssclass="form-control fieldid.{09FFE297-15A0-4586-AA54-7CAE02974CE0} name.Email" id="field_09FFE29715A04586AA547CAE02974CE0" result="Sitecore.Form.Core.Controls.Data.ControlResult" controlname="Email" fieldid="{09FFE297-15A0-4586-AA54-7CAE02974CE0}" >
          <validators>
            <asp:regularexpressionvalidator runat="server" errormessage="Email contains an invalid address." cssclass="scfValidator trackevent.{844BBD40-91F6-42CE-8823-5EA4D089ECA2} fieldid.{09FFE297-15A0-4586-AA54-7CAE02974CE0} inner.1" display="Dynamic" validationexpression="^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$" forecolor="" controltovalidate="field_09FFE29715A04586AA547CAE02974CE0" validationgroup="form_85BDCAB5FB664751B6F39BD547FFA50D_submit" id="field_09FFE29715A04586AA547CAE02974CE05D10AF7533054C39908EB25E8CB4ABDC_validator">Enter a valid e-mail address.</asp:regularexpressionvalidator>
          </validators>
          <requred>
          </requred>
        </cc3:email>
        <cc3:telephone runat="server" title="Phone" cssclass="form-control fieldid.{811E9CFC-F4CF-4501-8DB5-26E30D4E024B} name.Phone" result="Sitecore.Form.Core.Controls.Data.ControlResult" id="field_811E9CFCF4CF45018DB526E30D4E024B" controlname="Phone" fieldid="{811E9CFC-F4CF-4501-8DB5-26E30D4E024B}" >
          <validators>
            <asp:regularexpressionvalidator runat="server" errormessage="Phone contains an invalid telephone number." cssclass="scfValidator trackevent.{844BBD40-91F6-42CE-8823-5EA4D089ECA2} fieldid.{811E9CFC-F4CF-4501-8DB5-26E30D4E024B} inner.1" display="Dynamic" validationexpression="^\+?\s{0,}\d{0,}\s{0,}(\(\s{0,}\d{1,}\s{0,}\)\s{0,}|\d{0,}\s{0,}-?\s{0,})\d{2,}\s{0,}-?\s{0,}\d{2,}\s{0,}(-?\s{0,}\d{2,}|\s{0,})\s{0,}$" forecolor="" controltovalidate="field_811E9CFCF4CF45018DB526E30D4E024B" validationgroup="form_85BDCAB5FB664751B6F39BD547FFA50D_submit" id="field_811E9CFCF4CF45018DB526E30D4E024BC3CC8A327EF14D138163826E11482E4D_validator">Enter a valid telephone number.</asp:regularexpressionvalidator>
          </validators>
          <requred>
          </requred>
        </cc3:telephone>
      </div>
    </div>
  </div>
</asp:panel>
<div runat="server" class="scfFooterBorder" id="footer">
</div>
<div runat="server" class="scfSubmitButtonBorder">
  <cc0:submitbutton runat="server" onclientclick="$scw.webform.lastSubmit = this.id;" text="Submit" validationgroup="form_85BDCAB5FB664751B6F39BD547FFA50D_submit" cssclass="scfSubmitButton" id="form_85BDCAB5FB664751B6F39BD547FFA50D_submit" onclick="OnClick" >
  </cc0:submitbutton>
</div>
<asp:hiddenfield runat="server" value="1" id="form_85BDCAB5FB664751B6F39BD547FFA50D_eventcount">
</asp:hiddenfield>
<asp:hiddenfield runat="server" value="Thank you for filling in the form." id="form_85BDCAB5FB664751B6F39BD547FFA50D_successmessage">
</asp:hiddenfield>
