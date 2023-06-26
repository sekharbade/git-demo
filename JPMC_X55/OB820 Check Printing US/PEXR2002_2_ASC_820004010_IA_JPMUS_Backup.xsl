<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:a="http://fresenius.de/XI/ANSIX12" xmlns:exslt="http://exslt.org/common" xmlns:sys="java.lang.System" xmlns:sdf="java.text.SimpleDateFormat" xmlns:dat="java.util.Date"
                xmlns:paramapper="de.fresenius.xi.global.paramapper.ParameterMapper" xmlns:map="java.util.Map" xmlns:ti="com.sap.aii.mapping.api.TransformationInput" xmlns:dyn="com.sap.aii.mapping.api.DynamicConfiguration"
                xmlns:key="com.sap.aii.mapping.api.DynamicConfigurationKey" xmlns:xsltc="http://xml.apache.org/xalan/xsltc" xmlns:util="http://fresenius.de/XI/Global" exclude-result-prefixes="a"
                extension-element-prefixes="exslt sys sdf dat map ti dyn key xsltc paramapper util">
	<xsl:import href="set-dynamic-config-AS2.xsl"/>
	<xsl:import href="valueMappingTemplate.xsl"/>
	<xsl:param name="inputparam"/>
	<xsl:param name="MessageId"/>
	<xsl:output method="xml" indent="yes" encoding="UTF-8"/>
	<xsl:template match="/">
		<xsl:variable name="ISARECEIVERID">
			<xsl:call-template name="PARAM1"/>
		</xsl:variable>
		<xsl:variable name="GSRECEIVERID">
			<xsl:call-template name="PARAM2"/>
		</xsl:variable>
		<xsl:variable name="I14_I155_SegDelim">
			<xsl:call-template name="PARAM3"/>
		</xsl:variable>
		<xsl:variable name="ISASENDERID">
			<xsl:call-template name="PARAM4"/>
		</xsl:variable>
		<xsl:variable name="GSSENDERID">
			<xsl:call-template name="PARAM5"/>
		</xsl:variable>
		<xsl:call-template name="setDynamicConfigAS2">
			<xsl:with-param name="MessageId" select="$MessageId"/>
		</xsl:call-template>
		<a:ASC820_004010>
			<S_ISA>
				<D_DATAELEMENTSEPARATOR>
					<xsl:value-of select="substring($I14_I155_SegDelim,4,1)"/>
				</D_DATAELEMENTSEPARATOR>
				<D_I01>00</D_I01>
				<D_I02 xml:space="preserve">          </D_I02>
				<D_I03>00</D_I03>
				<D_I04 xml:space="preserve">          </D_I04>
				<D_I05>ZZ</D_I05>
				<D_I06>
					<xsl:value-of select="substring($ISASENDERID,1,15)"/>
				</D_I06>
				<D_I05_2>
					<xsl:value-of select="substring($ISARECEIVERID,16)"/>
				</D_I05_2>
				<D_I07>
					<xsl:value-of select="substring($ISARECEIVERID,1,15)"/>
				</D_I07>
				<xsl:variable name="DATE" select="sdf:format(sdf:new('yyMMdd'), dat:new())"/>
				<D_I08>
					<xsl:value-of select="$DATE"/>
				</D_I08>
				<xsl:variable name="TIME" select="sdf:format(sdf:new('HHmm'), dat:new())"/>
				<D_I09>
					<xsl:value-of select="$TIME"/>
				</D_I09>
				<D_I10>U</D_I10>
				<D_I11>00401</D_I11>
				<D_I12>
					<xsl:value-of select="concat('$B2B_UEBNRControlNumber_',PEXR2002/IDOC/EDI_DC40/RCVPRN,'_ISA$B2B_END_UEBNR')"/>
				</D_I12>
				<D_I13>0</D_I13>
				<D_I14>
					<xsl:value-of select="substring($I14_I155_SegDelim,1,1)"/>
				</D_I14>
				<D_I15>
					<xsl:value-of select="substring($I14_I155_SegDelim,2,1)"/>
				</D_I15>
				<D_SEGMENTTERMINATOR>
					<xsl:value-of select="substring($I14_I155_SegDelim,3,1)"/>
				</D_SEGMENTTERMINATOR>
				<S_GS>
					<D_479>RA</D_479>
					<D_142>
						<xsl:value-of select="$GSSENDERID"/>
					</D_142>
					<D_124>
						<xsl:value-of select="$GSRECEIVERID"/>
					</D_124>
					<xsl:variable name="GS_DATE" select="sdf:format(sdf:new('yyyyMMdd'), dat:new())"/>
					<D_373>
						<xsl:value-of select="$GS_DATE"/>
					</D_373>
					<D_337>
						<xsl:value-of select="$TIME"/>
					</D_337>
					<D_28>
						<xsl:value-of select="concat('$B2B_UEBNRControlNumber_',PEXR2002/IDOC/EDI_DC40/RCVPRN,'_ISA$B2B_END_UEBNR')"/>
					</D_28>
					<D_455>X</D_455>
					<D_480>004010</D_480>
					<xsl:for-each select="PEXR2002/IDOC">
						<S_ST>
							<D_143>820</D_143>
							<D_329>
								<xsl:value-of select='format-number(position(),"0000")'/>
							</D_329>
							<S_BPR>
								<D_305>D</D_305>
								<D_782>
									<xsl:value-of select="E1IDKU5[MOAQUAL=002]/MOABETR"/>
								</D_782>
								<D_478>C</D_478>
								<D_591>ACH</D_591>
								<D_812>CTX</D_812>
								<D_506>01</D_506>
								<D_507>
									<xsl:value-of select="E1IDB02[FIIQUALI = 'BA']/FIIBKUKN"/>
								</D_507>
								<D_569>DA</D_569>
								<D_508>
									<xsl:value-of select="E1IDB02[FIIQUALI = 'BA']/FIIKONTO"/>
								</D_508>
								<!--Update the number given by JPMC-->
								<!--RFC 920034518/920035608 - Dynamically populate JPMC Company ID-->
								<xsl:variable name="FKCompanyCode">
									<xsl:value-of select="E1IDKU3/PAYRUNCC"/>
								</xsl:variable>
								<D_509>
									<xsl:call-template name="mapFKCompanyCode_to_JPMCCompanyID">
										<xsl:with-param name="FKCompanyCode" select="string($FKCompanyCode)"/>
									</xsl:call-template>
								</D_509>
								<D_506_2>01</D_506_2>
								<D_507_2>
									<xsl:value-of select="E1IDB02[FIIQUALI = 'BB']/FIIBKUKN"/>
								</D_507_2>
								<xsl:choose>
									<xsl:when test="E1IDB02[FIIQUALI = 'BB']/FIIBKONT = '02'">
										<D_569_2>SG</D_569_2>
									</xsl:when>
									<xsl:otherwise>
										<D_569_2>DA</D_569_2>
									</xsl:otherwise>
								</xsl:choose>
								<D_508_2>
									<xsl:value-of select="E1IDB02[FIIQUALI = 'BB']/FIIKONTO"/>
								</D_508_2>
								<D_373>
									<xsl:value-of select="E1EDK03[IDDAT=017]/DATUM"/>
								</D_373>
								<D_1048>VEN</D_1048>
							</S_BPR>
							<S_TRN>
								<D_481>1</D_481>
								<D_127>
									<xsl:value-of select="E1EDK02[QUALF=022]/BELNR"/>
								</D_127>
							</S_TRN>
							<xsl:for-each select="E1EDKA1">
								<xsl:if test="PARVW = 'AG'">
									<L_N1>
										<S_N1>
											<D_98>PR</D_98>
											<D_93>
												<xsl:value-of select="NAME1"/>
											</D_93>
										</S_N1>
										<S_N3>
											<xsl:choose>
												<xsl:when test="STRAS">
													<D_166>
														<xsl:value-of select="STRAS"/>
													</D_166>
												</xsl:when>
												<xsl:otherwise>
													<D_166>NA</D_166>
												</xsl:otherwise>
											</xsl:choose>
										</S_N3>
										<S_N4>
											<D_19>
												<xsl:value-of select="ORT01"/>
											</D_19>
											<D_156>
												<xsl:value-of select="REGIO"/>
											</D_156>
											<D_116>
												<xsl:value-of select="PSTLZ"/>
											</D_116>
											<D_26>
												<xsl:value-of select="LAND1"/>
											</D_26>
										</S_N4>
									</L_N1>
								</xsl:if>
							</xsl:for-each>
							<xsl:for-each select="E1EDKA1">
								<xsl:if test="PARVW = 'BE'">
									<L_N1>
										<S_N1>
											<D_98>PE</D_98>
											<D_93>
												<xsl:value-of select="NAME1"/>
											</D_93>
										</S_N1>
										<S_N3>
											<xsl:choose>
												<xsl:when test="STRAS">
													<D_166>
														<xsl:value-of select="STRAS"/>
													</D_166>
												</xsl:when>
												<xsl:when test="PFACH">
													<D_166>
														<xsl:value-of select="PFACH"/>
													</D_166>
												</xsl:when>
												<xsl:otherwise>
													<D_166>NA</D_166>
												</xsl:otherwise>
											</xsl:choose>
										</S_N3>
										<S_N4>
											<D_19>
												<xsl:value-of select="ORT01"/>
											</D_19>
											<D_156>
												<xsl:value-of select="REGIO"/>
											</D_156>
											<D_116>
												<xsl:value-of select="PSTLZ"/>
											</D_116>
											<D_26>
												<xsl:value-of select="LAND1"/>
											</D_26>
										</S_N4>
									</L_N1>
								</xsl:if>
							</xsl:for-each>
							<L_ENT>
								<S_ENT>
									<D_554>1</D_554>
								</S_ENT>
								<xsl:for-each select="E1IDPU1">
									<L_RMR>
										<S_RMR>
											<xsl:choose>
												<xsl:when test="DOCNAME = 'INV'">
													<D_128>IV</D_128>
												</xsl:when>
												<xsl:otherwise>
													<D_128>CL</D_128>
												</xsl:otherwise>
											</xsl:choose>
											<D_127>
												<xsl:value-of select="E1EDP02[QUALF=010]/BELNR"/>
											</D_127>
											<D_782>
												<xsl:choose>
													<xsl:when test="contains(E1IDPU5[MOAQUAL=006]/MOABETR,'-')">
														<xsl:value-of select="concat('-',translate(E1IDPU5[MOAQUAL=006]/MOABETR,'-',''))"/>
													</xsl:when>
													<xsl:otherwise>
														<xsl:value-of select="E1IDPU5[MOAQUAL=006]/MOABETR"/>
													</xsl:otherwise>
												</xsl:choose>
											</D_782>
										</S_RMR>
										<xsl:for-each select="E1EDP02">
											<xsl:if test="QUALF = 009">
												<S_REF>
													<D_128>PO</D_128>
													<D_127>
														<xsl:value-of select="BELNR"/>
													</D_127>
												</S_REF>
											</xsl:if>
										</xsl:for-each>
										<xsl:for-each select="E1EDP03">
											<xsl:if test="IDDAT = 016">
												<S_DTM>
													<D_374>004</D_374>
													<D_373>
														<xsl:value-of select="DATUM"/>
													</D_373>
												</S_DTM>
											</xsl:if>
											<xsl:if test="IDDAT = 015">
												<S_DTM>
													<D_374>003</D_374>
													<D_373>
														<xsl:value-of select="DATUM"/>
													</D_373>
												</S_DTM>
											</xsl:if>
										</xsl:for-each>
									</L_RMR>
								</xsl:for-each>
							</L_ENT>
							<S_SE>
								<D_96/>
								<D_329>
									<xsl:value-of select='format-number(position(),"0000")'/>
								</D_329>
							</S_SE>
						</S_ST>
					</xsl:for-each>
					<S_GE>
						<D_97>
							<xsl:value-of select="count(PEXR2002/IDOC)"/>
						</D_97>
						<D_28>
							<xsl:value-of select="concat('$B2B_UEBNRControlNumber_',PEXR2002/IDOC/EDI_DC40/RCVPRN,'_ISA$B2B_END_UEBNR')"/>
						</D_28>
					</S_GE>
				</S_GS>
				<S_IEA>
					<D_I16>1</D_I16>
					<D_I12>
						<xsl:value-of select="concat('$B2B_UEBNRControlNumber_',PEXR2002/IDOC/EDI_DC40/RCVPRN,'_ISA$B2B_END_UEBNR')"/>
					</D_I12>
				</S_IEA>
			</S_ISA>
		</a:ASC820_004010>
	</xsl:template>
	<xsl:template name="PARAM1">
		<PARAM1>
			<xsl:value-of select="paramapper:getValue(xsltc:cast('java.util.Map',$inputparam),'PARAM1')"/>
		</PARAM1>
	</xsl:template>
	<xsl:template name="PARAM2">
		<PARAM2>
			<xsl:value-of select="paramapper:getValue(xsltc:cast('java.util.Map',$inputparam),'PARAM2')"/>
		</PARAM2>
	</xsl:template>
	<xsl:template name="PARAM3">
		<PARAM3>
			<xsl:value-of select="paramapper:getValue(xsltc:cast('java.util.Map',$inputparam),'PARAM3')"/>
		</PARAM3>
	</xsl:template>
	<xsl:template name="PARAM4">
		<PARAM4>
			<xsl:value-of select="paramapper:getValue(xsltc:cast('java.util.Map',$inputparam),'PARAM4')"/>
		</PARAM4>
	</xsl:template>
	<xsl:template name="PARAM5">
		<PARAM5>
			<xsl:value-of select="paramapper:getValue(xsltc:cast('java.util.Map',$inputparam),'PARAM5')"/>
		</PARAM5>
	</xsl:template>
	<xsl:template name="setDynamicConfigAS2">
		<xsl:param name="MessageId"/>
		<xsl:call-template name="set-dynamic-config-AS2">
			<xsl:with-param name="nameMessageType" select="' FKNAPHARMA.PSOURCE.820B'"/>
			<xsl:with-param name="numberBusinessDocument" select="820"/>
			<xsl:with-param name="nameSenderSystem" select="'FKNA'"/>
			<xsl:with-param name="idMessage" select="$MessageId"/>
		</xsl:call-template>
	</xsl:template>
	<xsl:template name="mapFKCompanyCode_to_JPMCCompanyID">
		<xsl:param name="FKCompanyCode"/>
		<xsl:variable name="JPMCCompanyCode">
			<xsl:call-template name="util:valueMapping">
				<xsl:with-param name="sourceAgency" select="'Fresenius Company Group'"/>
				<xsl:with-param name="sourceScheme" select="'Fresenius Company Code'"/>
				<xsl:with-param name="sourceValue" select="$FKCompanyCode"/>
				<xsl:with-param name="targetAgency" select="'JPMC Company Group'"/>
				<xsl:with-param name="targetScheme" select="'JPMC Company ID'"/>
			</xsl:call-template>
		</xsl:variable>
		<xsl:choose>
			<xsl:when test="string-length($JPMCCompanyCode) &gt; 0">
				<xsl:value-of select="$JPMCCompanyCode"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:message terminate="yes">
					<xsl:value-of select="concat('JPMC Company code not maintained for', $FKCompanyCode)"/>
				</xsl:message>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2009. Progress Software Corporation. All rights reserved.

<metaInformation>
	<scenarios>
		<scenario default="yes" name="PEXR2002_2_ASC_820004010_IA_JPMUS" userelativepaths="yes" externalpreview="no" url="PAYEXT.PEXR2002.xsd" htmlbaseurl="" outputurl="" processortype="saxon8" useresolver="yes" profilemode="0" profiledepth=""
		          profilelength="" urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" validateoutput="no" validator="internal"
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
		<MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="ASC_820004010.xsd" destSchemaRoot="ASC820_004010" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no">
			<SourceSchema srcSchemaPath="PAYEXT.PEXR2002.xsd" srcSchemaRoot="PEXR2002" AssociatedInstance="" loaderFunction="document" loaderFunctionUsesURI="no"/>
		</MapperInfo>
		<MapperBlockPosition>
			<template match="/">
				<block path="xsl:call-template" x="363" y="0"/>
				<block path="a:ASC820_004010/S_ISA/D_DATAELEMENTSEPARATOR/xsl:value-of" x="363" y="54"/>
				<block path="a:ASC820_004010/S_ISA/D_I06/xsl:value-of" x="363" y="198"/>
				<block path="a:ASC820_004010/S_ISA/D_I05_2/xsl:value-of" x="403" y="216"/>
				<block path="a:ASC820_004010/S_ISA/D_I07/xsl:value-of" x="323" y="234"/>
				<block path="a:ASC820_004010/S_ISA/D_I08/xsl:value-of" x="363" y="252"/>
				<block path="a:ASC820_004010/S_ISA/D_I09/xsl:value-of" x="403" y="270"/>
				<block path="a:ASC820_004010/S_ISA/D_I12/xsl:value-of" x="363" y="324"/>
				<block path="a:ASC820_004010/S_ISA/D_I14/xsl:value-of" x="403" y="360"/>
				<block path="a:ASC820_004010/S_ISA/D_I15/xsl:value-of" x="363" y="378"/>
				<block path="a:ASC820_004010/S_ISA/D_SEGMENTTERMINATOR/xsl:value-of" x="323" y="396"/>
				<block path="a:ASC820_004010/S_ISA/S_GS/D_142/xsl:value-of" x="283" y="222"/>
				<block path="a:ASC820_004010/S_ISA/S_GS/D_124/xsl:value-of" x="243" y="222"/>
				<block path="a:ASC820_004010/S_ISA/S_GS/D_373/xsl:value-of" x="203" y="222"/>
				<block path="a:ASC820_004010/S_ISA/S_GS/D_337/xsl:value-of" x="163" y="222"/>
				<block path="a:ASC820_004010/S_ISA/S_GS/D_28/xsl:value-of" x="123" y="222"/>
				<block path="a:ASC820_004010/S_ISA/S_GS/xsl:for-each" x="83" y="222"/>
				<block path="a:ASC820_004010/S_ISA/S_GS/xsl:for-each/S_ST/D_329/xsl:value-of" x="403" y="182"/>
				<block path="a:ASC820_004010/S_ISA/S_GS/xsl:for-each/S_ST/xsl:for-each" x="253" y="152"/>
				<block path="a:ASC820_004010/S_ISA/S_GS/xsl:for-each/S_ST/xsl:for-each/xsl:if/=[0]" x="277" y="180"/>
				<block path="a:ASC820_004010/S_ISA/S_GS/xsl:for-each/S_ST/xsl:for-each/xsl:if" x="323" y="182"/>
				<block path="a:ASC820_004010/S_ISA/S_GS/xsl:for-each/S_ST/xsl:for-each[1]" x="133" y="152"/>
				<block path="a:ASC820_004010/S_ISA/S_GS/xsl:for-each/S_ST/xsl:for-each[1]/xsl:if/=[0]" x="157" y="180"/>
				<block path="a:ASC820_004010/S_ISA/S_GS/xsl:for-each/S_ST/xsl:for-each[1]/xsl:if" x="203" y="182"/>
				<block path="a:ASC820_004010/S_ISA/S_GS/xsl:for-each/S_ST/L_ENT/xsl:for-each" x="363" y="142"/>
				<block path="a:ASC820_004010/S_ISA/S_GS/xsl:for-each/S_ST/L_ENT/xsl:for-each/L_RMR/S_RMR/xsl:choose" x="203" y="142"/>
				<block path="a:ASC820_004010/S_ISA/S_GS/xsl:for-each/S_ST/L_ENT/xsl:for-each/L_RMR/S_RMR/xsl:choose/=[0]" x="157" y="136"/>
				<block path="a:ASC820_004010/S_ISA/S_GS/xsl:for-each/S_ST/L_ENT/xsl:for-each/L_RMR/S_RMR/D_782/xsl:choose" x="133" y="112"/>
				<block path="a:ASC820_004010/S_ISA/S_GS/xsl:for-each/S_ST/L_ENT/xsl:for-each/L_RMR/S_RMR/D_782/xsl:choose/contains[0]" x="87" y="106"/>
				<block path="a:ASC820_004010/S_ISA/S_GS/xsl:for-each/S_ST/L_ENT/xsl:for-each/L_RMR/S_RMR/D_782/xsl:choose/xsl:when/xsl:value-of" x="83" y="142"/>
				<block path="a:ASC820_004010/S_ISA/S_GS/xsl:for-each/S_ST/L_ENT/xsl:for-each/L_RMR/S_RMR/D_782/xsl:choose/xsl:when/xsl:value-of/translate[1]" x="37" y="164"/>
				<block path="a:ASC820_004010/S_ISA/S_GS/xsl:for-each/S_ST/L_ENT/xsl:for-each/L_RMR/xsl:for-each[1]" x="253" y="112"/>
				<block path="a:ASC820_004010/S_ISA/S_GS/xsl:for-each/S_ST/L_ENT/xsl:for-each/L_RMR/xsl:for-each[1]/xsl:if/=[0]" x="277" y="140"/>
				<block path="a:ASC820_004010/S_ISA/S_GS/xsl:for-each/S_ST/L_ENT/xsl:for-each/L_RMR/xsl:for-each[1]/xsl:if" x="323" y="142"/>
				<block path="a:ASC820_004010/S_ISA/S_GS/xsl:for-each/S_ST/S_SE/D_329/xsl:value-of" x="403" y="142"/>
				<block path="a:ASC820_004010/S_ISA/S_GS/S_GE/D_97/xsl:value-of" x="83" y="182"/>
				<block path="a:ASC820_004010/S_ISA/S_GS/S_GE/D_28/xsl:value-of" x="43" y="182"/>
				<block path="a:ASC820_004010/S_ISA/S_IEA/D_I12/xsl:value-of" x="43" y="222"/>
			</template>
		</MapperBlockPosition>
		<TemplateContext></TemplateContext>
		<MapperFilter side="source"></MapperFilter>
	</MapperMetaTag>
</metaInformation>
-->