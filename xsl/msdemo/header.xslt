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
  
<!--  <xsl:variable name="home" select="sc:item('110D559F-DEA5-42EA-9C1C-8A5DF7E70EF9',.)"/> -->
  <xsl:variable name="home" select="$sc_item/ancestor-or-self::item[@template='home']" />
  <xsl:variable name="this_section" select="$home/child::item[@template='section']" />
  <xsl:variable name="section" select="$sc_item/ancestor-or-self::item[@template='section']" />

  
  
  <!-- entry point -->
  <xsl:template match="*">    

    <!-- BEGIN HEADER -->
    <div class="header">
      <div class="container">
        <sc:link select="$home" class="site-logo"><sc:image select="$home" field="logo" h="55"/></sc:link>

        <a href="javascript:void(0);" class="mobi-toggler"><i class="fa fa-bars"></i></a>

        <!-- BEGIN NAVIGATION -->
        <div class="header-navigation pull-right font-transform-inherit">
          <ul>
			<li>
				<xsl:if test="./@id=$home/@id">
				  <xsl:attribute name="class">
					<xsl:value-of select="'active'"/>
				  </xsl:attribute>
				</xsl:if>
				<sc:link select="$home">
					<span><sc:text field="menu title" select="$home"  disable-web-editing="true"/></span>
				</sc:link>
			</li>
		  
        <xsl:for-each select="$home/item[sc:IsItemOfType('section',.)]">
		<xsl:variable name="thisitem" select="." />
			
			<xsl:choose>
				<xsl:when test="sc:pageMode()/pageEditor/edit">
					<xsl:choose>
						<xsl:when test="sc:fld('dropdown',.)='1'">
							<li>
								<xsl:choose>
									<xsl:when test="./@id=$section/@id">
										<xsl:attribute name="class">
											<xsl:value-of select="'active'"/>
										</xsl:attribute>
										<sc:link><span><sc:text field="menu title" disable-web-editing="true"/></span></sc:link>
									</xsl:when>
									<xsl:otherwise>
										<sc:link><span><sc:text field="menu title" disable-web-editing="true"/></span></sc:link>
									</xsl:otherwise>
								</xsl:choose>

								<ul class="dropdown-menu">
									<li>
										<div class="header-navigation-content">
											<div class="row">
												<xsl:for-each select="item">
													<xsl:if test="sc:fld('show in menu',.)='1'">
														<div class="col-md-4 header-navigation-col">
															<sc:link target="_self"><h4 style="color: #3e4d5c;!important"><sc:text field="menu title" disable-web-editing="true"/></h4></sc:link>
															<ul>
																<xsl:for-each select="./item">
																  <xsl:choose>
																	<xsl:when test="./@template='products redirect'">
																	  <li><sc:link field="link" disable-web-editing="true" target="_self"><sc:text field="menu title" disable-web-editing="true"/></sc:link></li>
																	</xsl:when>
																	<xsl:otherwise>
																	  <li><sc:link target="_self"><sc:text field="menu title" disable-web-editing="true"/></sc:link></li>  
																	</xsl:otherwise>
																  </xsl:choose>
																</xsl:for-each>
															</ul>
														</div>
													</xsl:if>
												</xsl:for-each>
											</div>
										</div>
									</li>
								</ul>
								
							</li>
						</xsl:when>
						<xsl:otherwise>
							<li>
								<xsl:choose>
									<xsl:when test="./@id=$section/@id">
										<xsl:attribute name="class">
											<xsl:value-of select="'active'"/>
										</xsl:attribute>
										<sc:link target="_self"><span><sc:text field="menu title" disable-web-editing="true"/></span></sc:link>
									</xsl:when>
									<xsl:otherwise>
										<sc:link target="_self"><span><sc:text field="menu title" disable-web-editing="true"/></span></sc:link>
									</xsl:otherwise>
								</xsl:choose>
							</li>
						</xsl:otherwise>
					</xsl:choose>
				  
				</xsl:when>
				<xsl:otherwise>
					<xsl:choose>
						<xsl:when test="sc:fld('dropdown',.)='1'">
							<li>
								<xsl:choose>
									<xsl:when test="./@id=$section/@id">
										<xsl:attribute name="class">
											<xsl:value-of select="'active'"/>
										</xsl:attribute>
										<sc:link><span><sc:text field="menu title"/></span></sc:link>
									</xsl:when>
									<xsl:otherwise>
										<sc:link><span><sc:text field="menu title"/></span></sc:link>
									</xsl:otherwise>
								</xsl:choose>

								<ul class="dropdown-menu">
									<li>
										<div class="header-navigation-content">
											<div class="row">
												<xsl:for-each select="item">
													<xsl:if test="sc:fld('show in menu',.)='1'">
														<div class="col-md-4 header-navigation-col">
															<h4><sc:link style="color: #3e4d5c;!important"><sc:text field="menu title"/></sc:link></h4>
															<ul>
																<xsl:for-each select="./item">
																	  <xsl:choose>
																		<xsl:when test="./@template='products redirect'">
																		  <li>
																			<sc:link field="link">
																			  <sc:text field="menu title" disable-web-editing="true"/>
																			</sc:link>
																		  </li>
																		</xsl:when>
																		<xsl:otherwise>
																		  <li>
																			<sc:link>
																			  <sc:text field="menu title" disable-web-editing="true"/>
																			</sc:link>
																		  </li>
																		</xsl:otherwise>
																	  </xsl:choose>
																</xsl:for-each>
															</ul>
														</div>
													</xsl:if>
												</xsl:for-each>
											</div>
										</div>
									</li>
								</ul>
							</li>
						</xsl:when>
						<xsl:otherwise>
							<li>
								<xsl:choose>
									<xsl:when test="./@id=$section/@id">
										<xsl:attribute name="class">
											<xsl:value-of select="'active'"/>
										</xsl:attribute>
										<sc:link>
											<span>
												<sc:text field="menu title"/>
											</span>
										</sc:link>
									</xsl:when>
									<xsl:otherwise>
										<sc:link>
											<span>
												<sc:text field="menu title"/>
											</span>
										</sc:link>
									</xsl:otherwise>
								</xsl:choose>
							</li>
						</xsl:otherwise>
					</xsl:choose>

				</xsl:otherwise>
			</xsl:choose>

		</xsl:for-each>

            <!-- BEGIN TOP SEARCH -->
            <li class="menu-search">
              <span class="sep"></span>
              <i class="fa fa-search search-btn"></i>
              <div class="search-box">
                
                  <script type="text/javascript">
                    $(document).ready(function() {
                      $('#header-search-button').click(function(e) {
                        e.preventDefault();
                        var url = "http://"+window.location.hostname + "/en/journals?search="+$('#header-search-box').val();
                        console.log("Redirecting to " + url);
                        window.location.href = url;
                      });
                    });
                  
                  </script>
                  <div class="input-group">
                    <input type="text" id="header-search-box" placeholder="Search" class="form-control"/>
                    <span class="input-group-btn">
                      <button class="btn btn-primary" id="header-search-button" type="submit">Search</button>
                    </span>
                  </div>
                
              </div> 
            </li>
            <!-- END TOP SEARCH -->
          </ul>
        </div>
        <!-- END NAVIGATION -->
      </div>
    </div>
    <!-- Header END -->
  
  </xsl:template>

</xsl:stylesheet>
