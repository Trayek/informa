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
  
  <xsl:variable name="home" select="sc:item('110D559F-DEA5-42EA-9C1C-8A5DF7E70EF9',.)"/>
  
  <!-- entry point -->
  <xsl:template match="*">



    <div style="padding-top: 10px;">
      <!-- BEGIN FORM-->
      <form2 action="#" class="reviews-form" role="form">
        <h2>Write a review</h2>
        <div class="form-group">
          <label for="name">
            Name <span class="require">*</span>
          </label>
          <input type="text" class="form-control" id="name"/>
                          </div>
        <div class="form-group">
          <label for="email">Email</label>
          <input type="text" class="form-control" id="email"/>
                          </div>
        <div class="form-group">
          <label for="review">
            Review <span class="require">*</span>
          </label>
          <textarea class="form-control" rows="8" id="review"></textarea>
        </div>
        <div class="form-group">
          <label for="email" style="padding-right:10px;">Rating</label>
          <input type="range" value="4" step="1" id="backing5"/>
            <div class="rateit" data-rateit-backingfld="#backing5" data-rateit-resetable="false"  data-rateit-ispreset="true" data-rateit-min="0" data-rateit-max="5">
            </div>
          </div>
        <div class="padding-top-20">
          <button type="submit" class="btn btn-primary">Send</button>
        </div>
      </form2>
      <!-- END FORM-->
    </div>

  </xsl:template>

</xsl:stylesheet>
