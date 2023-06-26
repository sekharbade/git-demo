<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:s="http://www.stylusstudio.com/xquery" xmlns:ns="http://fresenius.de/XI/ANSIX12">
    <xsl:output method="html" media-type="text/vnd.wap.wml"/>
	<xsl:template match="/">
        <html>
            <head/>
            <body>
                <div style="text-align: none;">
                    <span style="font-family: Arial;font-size: 18pt;font-weight: bold;">
                        <xsl:text>824 - EDI: ACH Confirmation for JPMC Payments - </xsl:text>
                        <xsl:choose>
                            <xsl:when test="/ns:ASC824_004010/S_ISA/D_I07 = 'FRESENIUSPHARMA'">
                                <div style="font-size: 18pt;font-weight: bold;text-align: none;">
                                    <xsl:text>P55</xsl:text>
                                </div>
                            </xsl:when>
                            <xsl:otherwise>
                                <div style="font-size: 18pt;font-weight: bold;text-align: none;">
                                    <xsl:text>PRF</xsl:text>
                                </div>
                            </xsl:otherwise>
                        </xsl:choose>
                        <br/>
                    </span>
                    <span style="font-family: Arial;">
                        <br/>
                        <table align="none" style="border-style: outset;border-width: 2pt;width: 100%;background-repeat: repeat" cellspacing="1pt">
                            <tbody>
                                <tr>
                                    <td style="border-style: inset;border-width: 2pt;padding: 2pt;vertical-align: middle;background-repeat: repeat">
                                        <div style="text-align: right;">
                                            <xsl:text>Interchange Date: </xsl:text>
                                        </div>
                                    </td>
                                    <td style="border-style: inset;border-width: 2pt;padding: 2pt;vertical-align: middle;background-repeat: repeat">
                                        <div style="text-align: none;">
                                            <xsl:value-of select="/ns:ASC824_004010/S_ISA/S_GS/D_373"/>
                                        </div>
                                    </td>
                                    <td style="border-style: inset;border-width: 2pt;padding: 2pt;vertical-align: middle;background-repeat: repeat">
                                        <div style="text-align: right;">
                                            <xsl:text>Interchange Time:</xsl:text>
                                        </div>
                                    </td>
                                    <td style="border-style: inset;border-width: 2pt;padding: 2pt;vertical-align: middle;background-repeat: repeat">
                                        <div style="text-align: none;">
                                            <xsl:value-of select="/ns:ASC824_004010/S_ISA/D_I09"/>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="border-style: inset;border-width: 2pt;padding: 2pt;vertical-align: middle;background-repeat: repeat">
                                        <div style="text-align: right;">
                                            <xsl:text>Interchange Sender ID:</xsl:text>
                                        </div>
                                    </td>
                                    <td style="border-style: inset;border-width: 2pt;padding: 2pt;vertical-align: middle;background-repeat: repeat">
                                        <div style="text-align: none;">
                                            <xsl:value-of select="/ns:ASC824_004010/S_ISA/D_I06"/>
                                        </div>
                                    </td>
                                    <td style="border-style: inset;border-width: 2pt;padding: 2pt;vertical-align: middle;background-repeat: repeat">
                                        <div style="text-align: right;">
                                            <xsl:text>Interchange Receiver ID: </xsl:text>
                                        </div>
                                    </td>
                                    <td style="border-style: inset;border-width: 2pt;padding: 2pt;vertical-align: middle;background-repeat: repeat">
                                        <div style="text-align: none;">
                                            <xsl:value-of select="/ns:ASC824_004010/S_ISA/D_I07"/>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="border-style: inset;border-width: 2pt;padding: 2pt;vertical-align: middle;background-repeat: repeat">
                                        <div style="text-align: right;">
                                            <xsl:text>Interchange Control Number:</xsl:text>
                                        </div>
                                    </td>
                                    <td style="border-style: inset;border-width: 2pt;padding: 2pt;vertical-align: middle;background-repeat: repeat">
                                        <div style="text-align: none;">
                                            <xsl:value-of select="/ns:ASC824_004010/S_ISA/D_I12"/>
                                        </div>
                                    </td>
                                    <td style="border-style: inset;border-width: 2pt;padding: 2pt;vertical-align: middle;background-repeat: repeat">
                                        <div style="text-align: none;"/>
                                    </td>
                                    <td style="border-style: inset;border-width: 2pt;padding: 2pt;vertical-align: middle;background-repeat: repeat">
                                        <div style="text-align: none;"/>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <br/>
                        <br/>
                        <xsl:text>D</xsl:text>
                    </span>
                    <span style="font-family: Arial;font-weight: normal;">
                        <xsl:text>ETAIL</xsl:text>
                        <br/>
                        <br/>
                        <table align="none" style="border-style: outset;border-width: 2pt;width: 100%;background-repeat: repeat" cellspacing="1pt">
                            <tbody>
                                <xsl:for-each select="/ns:ASC824_004010/S_ISA/S_GS/S_ST/L_OTI">
                                    <xsl:variable name="L_OTI" select="."/>
                                    <tr>
                                        <td style="border-style: inset;border-width: 2pt;padding: 1pt;vertical-align: middle;background-repeat: repeat">
                                            <div style="text-align: none;">
                                                <table align="none" style="border-style: outset;border-width: 2pt;width: 100%;background-repeat: repeat" cellspacing="1pt">
                                                    <tbody>
                                                        <tr>
                                                            <td style="border-style: inset;border-width: 1pt;padding: 2pt;vertical-align: middle;background-repeat: repeat">
                                                                <div style="text-align: none;">
                                                                    <span style="font-weight: bold;">
                                                                        <xsl:text>Acknowledgement Code</xsl:text>
                                                                    </span>
                                                                </div>
                                                            </td>
                                                            <td style="border-style: inset;border-width: 1pt;padding: 2pt;vertical-align: middle;background-repeat: repeat">
                                                                <div style="text-align: none;">
                                                                    <xsl:value-of select="S_OTI/D_110"/>
                                                                    <xsl:text> - </xsl:text>
                                                                    <xsl:choose>
                                                                        <xsl:when test="S_OTI/D_110 = 'TR'">
                                                                            <div style="text-align: none;color: #FF0000;">
                                                                                <xsl:text>Transaction Set Rejected</xsl:text>
                                                                            </div>
                                                                        </xsl:when>
                                                                        <xsl:otherwise>
                                                                            <div style="text-align: none;"/>
                                                                        </xsl:otherwise>
                                                                    </xsl:choose>
                                                                    <xsl:choose>
                                                                        <xsl:when test="S_OTI/D_110 = 'TA'">
                                                                            <div style="text-align: none;">
                                                                                <xsl:text>Transaction Set Accept</xsl:text>
                                                                            </div>
                                                                        </xsl:when>
                                                                        <xsl:otherwise>
                                                                            <div style="text-align: none;"/>
                                                                        </xsl:otherwise>
                                                                    </xsl:choose>
                                                                    <xsl:choose>
                                                                        <xsl:when test="S_OTI/D_110 = 'GP'">
                                                                            <div style="text-align: none;">
                                                                                <xsl:text>Functional Group Partial Accept/Reject</xsl:text>
                                                                            </div>
                                                                        </xsl:when>
                                                                        <xsl:otherwise>
                                                                            <div style="text-align: none;"/>
                                                                        </xsl:otherwise>
                                                                    </xsl:choose>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="border-style: inset;border-width: 1pt;padding: 2pt;vertical-align: middle;background-repeat: repeat">
                                                                <div style="text-align: none;">
                                                                    <span style="font-weight: bold;">
                                                                        <xsl:text>Reference Identification</xsl:text>
                                                                    </span>
                                                                </div>
                                                            </td>
                                                            <td style="border-style: inset;border-width: 1pt;padding: 2pt;vertical-align: middle;background-repeat: repeat">
                                                                <div style="text-align: none;">
                                                                    <xsl:choose>
                                                                        <xsl:when test="(S_OTI/D_110 = 'TR')">
                                                                            <div style="text-align: none;color: #FF0000;">
                                                                                <xsl:value-of select="S_OTI/D_127"/>
                                                                            </div>
                                                                        </xsl:when>
                                                                        <xsl:otherwise>
                                                                            <div style="text-align: none;">
                                                                                <xsl:value-of select="S_OTI/D_127"/>
                                                                            </div>
                                                                        </xsl:otherwise>
                                                                    </xsl:choose>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="border-style: inset;border-width: 1pt;padding: 2pt;vertical-align: middle;background-repeat: repeat">
                                                                <div style="text-align: none;">
                                                                    <span style="font-weight: bold;">
                                                                        <xsl:text>Group Control Number</xsl:text>
                                                                    </span>
                                                                </div>
                                                            </td>
                                                            <td style="border-style: inset;border-width: 1pt;padding: 2pt;vertical-align: middle;background-repeat: repeat">
                                                                <div style="text-align: none;">
                                                                    <xsl:value-of select="S_OTI/D_28"/>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </td>
                                        <td style="border-style: inset;border-width: 2pt;padding: 1pt;vertical-align: top;background-repeat: repeat">
                                            <div style="text-align: none;">
                                                <table align="none" style="border-style: outset;border-width: 2pt;width: 100%;background-repeat: repeat" cellspacing="1pt">
                                                    <tbody>
                                                        <xsl:for-each select="S_AMT">
                                                            <xsl:variable name="S_AMT" select="."/>
                                                            <tr>
                                                                <td style="border-style: inset;border-width: 1pt;padding: 2pt;vertical-align: middle;background-repeat: repeat">
                                                                    <div style="text-align: none;">
                                                                        <xsl:choose>
                                                                            <xsl:when test="D_522 = 'OP'">
                                                                                <div style="text-align: right;">
                                                                                    <span style="font-weight: bold;">
                                                                                        <xsl:text>Original Payment Total</xsl:text>
                                                                                    </span>
                                                                                </div>
                                                                            </xsl:when>
                                                                            <xsl:otherwise>
                                                                                <div style="text-align: none;"/>
                                                                            </xsl:otherwise>
                                                                        </xsl:choose>
                                                                        <xsl:choose>
                                                                            <xsl:when test="D_522 = 'BT'">
                                                                                <div style="text-align: right;color: #FF0000;">
                                                                                    <span style="font-weight: bold;">
                                                                                        <xsl:text>Bank Reject Total</xsl:text>
                                                                                    </span>
                                                                                </div>
                                                                            </xsl:when>
                                                                            <xsl:otherwise>
                                                                                <div style="text-align: none;"/>
                                                                            </xsl:otherwise>
                                                                        </xsl:choose>
                                                                        <xsl:choose>
                                                                            <xsl:when test="D_522 = 'NP'">
                                                                                <div style="text-align: right;">
                                                                                    <span style="font-weight: bold;">
                                                                                        <xsl:text>Net to Pay Total</xsl:text>
                                                                                    </span>
                                                                                </div>
                                                                            </xsl:when>
                                                                            <xsl:otherwise>
                                                                                <div style="text-align: none;"/>
                                                                            </xsl:otherwise>
                                                                        </xsl:choose>
                                                                        <xsl:choose>
                                                                            <xsl:when test="D_522 = '2'">
                                                                                <div style="text-align: right;">
                                                                                    <span style="font-weight: bold;">
                                                                                        <xsl:text>Batch Total</xsl:text>
                                                                                    </span>
                                                                                </div>
                                                                            </xsl:when>
                                                                            <xsl:otherwise>
                                                                                <div style="text-align: right;"/>
                                                                            </xsl:otherwise>
                                                                        </xsl:choose>
                                                                    </div>
                                                                </td>
                                                                <td style="border-style: inset;border-width: 1pt;padding: 2pt;vertical-align: middle;background-repeat: repeat">
                                                                    <div style="text-align: none;">
                                                                        <xsl:choose>
                                                                            <xsl:when test="(D_522 = 'BT' and D_782 > '0') or&#xD;&#xA;(../S_OTI/D_110 = 'TR' and D_782 > '0')">
                                                                                <div style="text-align: none;color: #FF0000;">
                                                                                    <xsl:value-of select="D_782"/>
                                                                                </div>
                                                                            </xsl:when>
                                                                            <xsl:otherwise>
                                                                                <div style="text-align: none;">
                                                                                    <xsl:value-of select="D_782"/>
                                                                                </div>
                                                                            </xsl:otherwise>
                                                                        </xsl:choose>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                        </xsl:for-each>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </td>
                                        <td style="border-style: inset;border-width: 2pt;padding: 1pt;vertical-align: top;background-repeat: repeat">
                                            <div style="text-align: none;">
                                                <table align="none" style="border-style: outset;border-width: 2pt;width: 100%;background-repeat: repeat" cellspacing="1pt">
                                                    <tbody>
                                                        <xsl:for-each select="S_QTY">
                                                            <xsl:variable name="S_QTY" select="."/>
                                                            <tr>
                                                                <td style="border-style: inset;border-width: 1pt;padding: 2pt;vertical-align: top;background-repeat: repeat">
                                                                    <div style="text-align: right;">
                                                                        <xsl:choose>
                                                                            <xsl:when test="D_673 = '46'">
                                                                                <div style="text-align: right;">
                                                                                    <span style="font-weight: bold;">
                                                                                        <xsl:text>Total Transactions</xsl:text>
                                                                                    </span>
                                                                                </div>
                                                                            </xsl:when>
                                                                            <xsl:otherwise>
                                                                                <div style="text-align: none;"/>
                                                                            </xsl:otherwise>
                                                                        </xsl:choose>
                                                                        <xsl:choose>
                                                                            <xsl:when test="D_673 = '53'">
                                                                                <div style="text-align: right;">
                                                                                    <span style="font-weight: bold;">
                                                                                        <xsl:text>Original payment item count</xsl:text>
                                                                                    </span>
                                                                                </div>
                                                                            </xsl:when>
                                                                            <xsl:otherwise>
                                                                                <div style="text-align: none;"/>
                                                                            </xsl:otherwise>
                                                                        </xsl:choose>
                                                                        <xsl:choose>
                                                                            <xsl:when test="D_673 = '54'">
                                                                                <div style="text-align: right;">
                                                                                    <span style="font-weight: bold;">
                                                                                        <xsl:text>Bank reject item count</xsl:text>
                                                                                    </span>
                                                                                </div>
                                                                            </xsl:when>
                                                                            <xsl:otherwise>
                                                                                <div style="text-align: none;"/>
                                                                            </xsl:otherwise>
                                                                        </xsl:choose>
                                                                        <xsl:choose>
                                                                            <xsl:when test="D_673 = '55'">
                                                                                <div style="text-align: right;">
                                                                                    <span style="font-weight: bold;">
                                                                                        <xsl:text>Net to pay item count</xsl:text>
                                                                                    </span>
                                                                                </div>
                                                                            </xsl:when>
                                                                            <xsl:otherwise>
                                                                                <div style="text-align: none;"/>
                                                                            </xsl:otherwise>
                                                                        </xsl:choose>
                                                                    </div>
                                                                </td>
                                                                <td style="border-style: inset;border-width: 1pt;padding: 2pt;vertical-align: top;background-repeat: repeat">
                                                                    <div style="text-align: none;">
                                                                        <xsl:choose>
                                                                            <xsl:when test="(D_673 = '54' and D_380 > '0') or&#xD;&#xA;(../S_OTI/D_110 = 'TR' and D_380 > '0')">
                                                                                <div style="text-align: none;color: #FF0000;">
                                                                                    <xsl:value-of select="D_380"/>
                                                                                </div>
                                                                            </xsl:when>
                                                                            <xsl:otherwise>
                                                                                <div style="text-align: none;">
                                                                                    <xsl:value-of select="D_380"/>
                                                                                </div>
                                                                            </xsl:otherwise>
                                                                        </xsl:choose>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                        </xsl:for-each>
                                                    </tbody>
                                                </table>
                                                <br/>
                                                <xsl:choose>
                                                    <xsl:when test="(L_TED/S_TED/D_3 != '')">
                                                        <div style="text-align: none;color: #FF0000;">
                                                            <span style="font-weight: bold;">
                                                                <xsl:value-of select="L_TED/S_TED/D_3"/>
                                                            </span>
                                                        </div>
                                                    </xsl:when>
                                                    <xsl:otherwise>
                                                        <div style="text-align: none;">
                                                            <xsl:value-of select="L_TED/S_TED/D_3"/>
                                                        </div>
                                                    </xsl:otherwise>
                                                </xsl:choose>
                                            </div>
                                        </td>
                                    </tr>
                                </xsl:for-each>
                                <tr>
                                    <td style="border-style: inset;border-width: 2pt;padding: 1pt;vertical-align: middle;background-repeat: repeat">
                                        <div style="text-align: none;"/>
                                    </td>
                                    <td style="border-style: inset;border-width: 2pt;padding: 1pt;vertical-align: middle;background-repeat: repeat">
                                        <div style="text-align: none;"/>
                                    </td>
                                    <td style="border-style: inset;border-width: 2pt;padding: 1pt;vertical-align: middle;background-repeat: repeat">
                                        <div style="text-align: none;"/>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </span>
                </div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2009. Progress Software Corporation. All rights reserved.

<metaInformation>
	<scenarios>
		<scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" url="file:///c:/temp/JPMC/824-X12-large.xml" htmlbaseurl="" outputurl="" processortype="saxon8" useresolver="no" profilemode="0" profiledepth="" profilelength=""
		          urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal"
		          customvalidator="">
			<advancedProp name="bSchemaAware" value="true"/>
			<advancedProp name="xsltVersion" value="2.0"/>
			<advancedProp name="schemaCache" value="||"/>
			<advancedProp name="iWhitespace" value="0"/>
			<advancedProp name="bWarnings" value="true"/>
			<advancedProp name="bXml11" value="false"/>
			<advancedProp name="bUseDTD" value="false"/>
			<advancedProp name="bXsltOneIsOkay" value="true"/>
			<advancedProp name="bTinyTree" value="true"/>
			<advancedProp name="bGenerateByteCode" value="true"/>
			<advancedProp name="bExtensions" value="true"/>
			<advancedProp name="iValidation" value="0"/>
			<advancedProp name="iErrorHandling" value="fatal"/>
			<advancedProp name="sInitialTemplate" value=""/>
			<advancedProp name="sInitialMode" value=""/>
		</scenario>
	</scenarios>
	<MapperMetaTag>
		<MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/>
		<MapperBlockPosition></MapperBlockPosition>
		<TemplateContext></TemplateContext>
		<MapperFilter side="source"></MapperFilter>
	</MapperMetaTag>
</metaInformation>
-->