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
  <xsl:variable name="social" select="sc:item('7839B152-B098-43E8-9AA0-A6808D195404',.)"/>
  
  <!-- entry point -->
  <xsl:template match="*">	
	
    <!-- BEGIN PRE-FOOTER -->
    <div class="pre-footer">
      <div class="container">
        <div class="row">
          <!-- BEGIN BOTTOM ABOUT BLOCK -->
          <div class="col-md-4 col-sm-6 pre-footer-col">
            <h2>About us</h2>
            <p><sc:text select="$footer" field="about us" /></p>

            <div class="photo-stream">
              <h2>Photos Stream</h2>
              <ul class="list-unstyled">
                <li><a href="#"><img alt="" src="/metronic/frontend/pages/img/people/img5-small.jpg"/></a></li>
                <li><a href="#"><img alt="" src="/metronic/frontend/pages/img/works/img1.jpg"/></a></li>
                <li><a href="#"><img alt="" src="/metronic/frontend/pages/img/people/img4-large.jpg"/></a></li>
                <li><a href="#"><img alt="" src="/metronic/frontend/pages/img/works/img6.jpg"/></a></li>
                <li><a href="#"><img alt="" src="/metronic/frontend/pages/img/works/img3.jpg"/></a></li>
                <li><a href="#"><img alt="" src="/metronic/frontend/pages/img/people/img2-large.jpg"/></a></li>
                <li><a href="#"><img alt="" src="/metronic/frontend/pages/img/works/img2.jpg"/></a></li>
                <li><a href="#"><img alt="" src="/metronic/frontend/pages/img/works/img5.jpg"/></a></li>
                <li><a href="#"><img alt="" src="/metronic/frontend/pages/img/people/img5-small.jpg"/></a></li>
                <li><a href="#"><img alt="" src="/metronic/frontend/pages/img/works/img1.jpg"/></a></li>
                <li><a href="#"><img alt="" src="/metronic/frontend/pages/img/people/img4-large.jpg"/></a></li>
                <li><a href="#"><img alt="" src="/metronic/frontend/pages/img/works/img6.jpg"/></a></li>
                <li><a href="#"><img alt="" src="/metronic/frontend/pages/img/works/img3.jpg"/></a></li>
                <li><a href="#"><img alt="" src="/metronic/frontend/pages/img/people/img2-large.jpg"/></a></li>
                <li><a href="#"><img alt="" src="/metronic/frontend/pages/img/works/img2.jpg"/></a></li>
              </ul>                    
            </div>
          </div>
          <!-- END BOTTOM ABOUT BLOCK -->

          <!-- BEGIN BOTTOM CONTACTS -->
          <div class="col-md-4 col-sm-6 pre-footer-col">
            <h2>Our Contacts</h2>
            <address class="margin-bottom-40">
				<sc:text select="$footer" field="company" />, <sc:text select="$footer" field="address" /><br />
				<sc:text select="$footer" field="address 2" />, <sc:text select="$footer" field="address 3" /><br />
				Phone: <sc:text select="$footer" field="phone" /><br />
				Fax: <sc:text select="$footer" field="fax" /><br />
				Email: <sc:link select="$footer" field="email" /><br />
				Skype: <sc:text select="$footer" field="skype" />
            </address>

            <div class="pre-footer-subscribe-box pre-footer-subscribe-box-vertical">
              <h2>Newsletter</h2>
              <p>Subscribe to our newsletter and stay up to date with the latest news and deals!</p>
              <form2 action="#">
                <div class="input-group">
                  <input type="text" placeholder="youremail@mail.com" class="form-control"/>
                  <span class="input-group-btn">
                    <button class="btn btn-primary" type="submit">Subscribe</button>
                  </span>
                </div>
              </form2>
            </div>
          </div>
          <!-- END BOTTOM CONTACTS -->

          <!-- BEGIN TWITTER BLOCK --> 
          <div class="col-md-4 col-sm-6 pre-footer-col">
            <h2 class="margin-bottom-0">Latest Tweets</h2>
			    <xsl:choose>
					<xsl:when test="sc:pageMode()/pageEditor/edit">
						<a>
							Showing tweets by @<xsl:value-of select="sc:fld('twitter feed', $footer)"/>...
						</a>
					</xsl:when>
					<xsl:otherwise>
						<a class="twitter-timeline" href="https://twitter.com/twitterapi" data-screen-name="" data-tweet-limit="2" data-theme="dark" data-link-color="#57C8EB" data-widget-id="455411516829736961" data-chrome="noheader nofooter noscrollbar noborders transparent">
							<xsl:attribute name ="data-screen-name">
									<xsl:value-of select="sc:fld('twitter feed', $footer)"/>
							</xsl:attribute>
							Loading tweets by @<xsl:value-of select="sc:fld('twitter feed', $footer)"/>...
						</a>
					</xsl:otherwise>
				</xsl:choose>
          </div>
          <!-- END TWITTER BLOCK -->
        </div>
      </div>
    </div>
    <!-- END PRE-FOOTER -->

    <!-- BEGIN FOOTER -->
    <div class="footer">
      <div class="container">
        <div class="row">
          <!-- BEGIN COPYRIGHT -->
          <div class="col-md-6 col-sm-6 padding-top-10">
            <sc:text select="$footer" field="copyright" />&#160;&#160;&#160;&#160;&#160;<a href="#">Privacy Policy</a> | <a href="#">Terms of Service</a>
          </div>
          <!-- END COPYRIGHT -->
          <!-- BEGIN PAYMENTS -->
          <div class="col-md-6 col-sm-6">
            <ul class="social-footer list-unstyled list-inline pull-right">
              <li><a href="#"><i class="fa fa-facebook"></i></a></li>
              <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
              <li><a href="#"><i class="fa fa-dribbble"></i></a></li>
              <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
              <li><a href="#"><i class="fa fa-twitter"></i></a></li>
              <li><a href="#"><i class="fa fa-skype"></i></a></li>
              <li><a href="#"><i class="fa fa-github"></i></a></li>
              <li><a href="#"><i class="fa fa-youtube"></i></a></li>
              <li><a href="#"><i class="fa fa-dropbox"></i></a></li>
            </ul>  
          </div>
          <!-- END PAYMENTS -->
        </div>
      </div>
    </div>
    <!-- END FOOTER -->
	
  </xsl:template>

</xsl:stylesheet>
