XSLT that transforms the XML-TEI file encoded with the Bookkeeping Ontology into a stable PDF, highlighting BK tags and some information from the header



<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xmlns:fo="http://www.w3.org/1999/XSL/Format">
    <!--
    xmlns:tei="http://www.tei-c.org/ns/1.0"-->


    <!-- Template for the root element -->
    <xsl:template match="/TEI">
        <fo:root>
            <fo:layout-master-set>
                <fo:simple-page-master master-name="simple" page-height="29.7cm" page-width="21cm"
                    margin-left="1.5cm" margin-right="1.5cm" margin-bottom="2cm" margin-top="1.5cm">
                    <fo:region-body  margin-left="1.5cm" margin-right="1.5cm"/>
                </fo:simple-page-master>
            </fo:layout-master-set>

            <fo:page-sequence master-reference="simple">
                <fo:flow flow-name="xsl-region-body" font-family="Garamond">
                    <!-- Apply templates to the body of the TEI document -->
                    <fo:block text-align="center" font-weight="bold">
                        <xsl:value-of select="teiHeader/fileDesc/titleStmt/title"/>
                    </fo:block>
                    <fo:block margin-top="8pt" font-size="10pt">
                        <fo:inline font-style="italic">Editor</fo:inline>
                        <fo:inline>:&#160;</fo:inline>
                        <xsl:value-of select="teiHeader/fileDesc/titleStmt/editor/forename"/>
                        <fo:inline>&#160;</fo:inline>
                        <xsl:value-of select="teiHeader/fileDesc/titleStmt/editor/surname"/>
                    </fo:block>
                    <fo:block font-size="10pt">
                        <fo:inline font-style="italic">Sponsor</fo:inline>
                        <fo:inline>:&#160;</fo:inline>
                        <xsl:value-of select="teiHeader/fileDesc/titleStmt/sponsor"/>
                    </fo:block>
                    <fo:block font-size="10pt">
                        <fo:inline font-style="italic">
                            <xsl:value-of select="teiHeader/fileDesc/titleStmt/respStmt/resp"/>
                        </fo:inline>
                        <fo:inline>&#160;</fo:inline>
                        <xsl:value-of select="teiHeader/fileDesc/titleStmt/respStmt/persName"/>
                    </fo:block>
                    <fo:block margin-top="40pt" font-size="12pt">Source</fo:block>
                    <fo:block font-size="10pt">
                        <fo:table>
                            <fo:table-body>
                                <fo:table-row>
                                    <fo:table-cell>
                                        <fo:block font-weight="bold">Manuscript
                                            Information:</fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell padding-bottom="15pt">
                                        <fo:block>
                                            <xsl:for-each
                                                select="teiHeader/fileDesc/sourceDesc/msDesc/msIdentifier/*">
                                                <xsl:value-of select="./text()"/>
                                                <xsl:if test="position() != last()">
                                                  <fo:block/>
                                                </xsl:if>
                                            </xsl:for-each>
                                        </fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                                
                                <fo:table-row>
                                    <fo:table-cell>
                                        <fo:block font-weight="bold">Minimum bibliography required:</fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell padding-bottom="20pt">
                                        <fo:list-block provisional-label-separation="8pt" space-before="20pt" space-after="20pt">
                                            <!-- Loop through the bibl elements inside listBibl -->
                                            <xsl:for-each select="teiHeader/fileDesc/sourceDesc/listBibl/bibl">
                                                <fo:list-item>
                                                    <fo:list-item-label end-indent="label-end()">
                                                        <!-- Bullet point -->
                                                        <fo:block>•</fo:block>
                                                    </fo:list-item-label>
                                                    <fo:list-item-body start-indent="body-start()">
                                                        <fo:block>
                                                            <xsl:value-of select="."/>
                                                        </fo:block>
                                                    </fo:list-item-body>
                                                </fo:list-item>
                                            </xsl:for-each>
                                        </fo:list-block>
                                    </fo:table-cell>
                                </fo:table-row>
                                
                                
                                <fo:table-row>
                                    <fo:table-cell>
                                        <fo:block font-weight="bold">Manuscript Content:</fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell padding-top="10pt">
                                        <fo:block margin-bottom="8pt" space-before="15pt">
                                            <xsl:value-of
                                                select="teiHeader/fileDesc/sourceDesc/msDesc/msContents/msItem/docDate"/>
                                        </fo:block>
                                        <fo:block>
                                            <xsl:apply-templates
                                                select="teiHeader/fileDesc/sourceDesc/msDesc/physDesc/objectDesc/supportDesc/extent"/>
                                        </fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                                <fo:table-row>
                                    <fo:table-cell>
                                        <fo:block margin-top="8pt" font-weight="bold">Criteri di edizione:</fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell>
                                        <fo:block margin-top="8pt" font-size="9pt" space-before="5pt" space-after="10pt">
                                            <xsl:apply-templates select="teiHeader/encodingDesc/editorialDecl/normalization/p"/>
                                        </fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                            </fo:table-body>
                        </fo:table>
                    </fo:block>
                    <fo:block break-before="page">
                        <xsl:apply-templates select="//body"/>
                    </fo:block>
                </fo:flow>
            </fo:page-sequence>
        </fo:root>
    </xsl:template>
<xsl:template match="dimensions">
    <fo:block>
        <xsl:value-of select="@unit"/>
        <fo:inline>&#160;</fo:inline>
        <xsl:value-of select="height"/>
        <fo:inline>&#160;x&#160;</fo:inline>
        <xsl:value-of select="width"/>
    </fo:block>
</xsl:template>



    <!-- Template to handle the <text> element -->
    <xsl:template match="text">
        <fo:block>
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>

    <!-- Template to handle the <div> elements -->
    <xsl:template match="div">
        <fo:block space-before="10pt" space-after="10pt">
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>

    <!-- Template to handle the <head> elements (in bold) -->
    <xsl:template match="head">
        <fo:block text-align="center" font-weight="bold" space-after="5pt">
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>

    <!-- Template to handle <p ana="bk:entry"> (in italic) -->
    <xsl:template match="p[@ana = 'bk:entry']">
        <fo:block font-style="italic">
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>

    <!-- Color mapping for elements with ana attributes -->
    <xsl:template match="*[@ana = 'bk:by']">
        <fo:inline color="red">
            <xsl:apply-templates/>
        </fo:inline>
    </xsl:template>

    <xsl:template match="*[@ana = 'bk:to']">
        <fo:inline color="blue">
            <xsl:apply-templates/>
        </fo:inline>
    </xsl:template>

    <xsl:template match="*[@ana = 'bk:from']">
        <fo:inline color="purple">
            <xsl:apply-templates/>
        </fo:inline>
    </xsl:template>

    <xsl:template match="*[@ana = 'bk:when']">
        <fo:inline color="brown">
            <xsl:apply-templates/>
        </fo:inline>
    </xsl:template>

    <xsl:template match="*[@ana = 'bk:money']">
        <fo:inline color="green">
            <xsl:apply-templates/>
        </fo:inline>
    </xsl:template>

    <xsl:template match="*[@ana = 'bk:commodity']">
        <fo:inline color="orange">
            <xsl:apply-templates/>
        </fo:inline>
    </xsl:template>
    
    <!-- Template to handle <note type="editorial"> -->
    <xsl:template match="note[@type = 'editorial']">
        <fo:block font-size="10pt" space-before="6pt" space-after="6pt">
            <fo:inline font-style="italic">Editorial's note: </fo:inline>
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>
    
    <!-- template to show tag del -->
    <xsl:template match="del">
        <fo:inline text-decoration="line-through">
            <xsl:apply-templates/>
        </fo:inline>
    </xsl:template>
    
    

</xsl:stylesheet>
