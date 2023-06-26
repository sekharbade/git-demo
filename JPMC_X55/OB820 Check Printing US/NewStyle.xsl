<?xml version="1.0" encoding="utf-8"?>
<!-- ===================================================================== -->
<!-- COMPANY : Fresenius KABI Inc : Pharma -->
<!-- AUTHOR : Chandra Bade -->
<!-- DATE : 10/25/2022 -->
<!-- ===================================================================== -->
<!-- Mapping for PAYEXT/PEXR2002 to ASC_820004010_IA -->
<!-- Check Printing Via EDI with bank to send to customers -->
<!-- Initial Development -->
<!-- ===================================================================== -->
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:a="http://fresenius.de/XI/ANSIX12"
	xmlns:exslt="http://exslt.org/common" xmlns:sys="java.lang.System"
	xmlns:sdf="java.text.SimpleDateFormat" xmlns:dat="java.util.Date"
	xmlns:paramapper="de.fresenius.xi.global.paramapper.ParameterMapper"
	xmlns:map="java.util.Map"
	xmlns:ti="com.sap.aii.mapping.api.TransformationInput"
	xmlns:dyn="com.sap.aii.mapping.api.DynamicConfiguration"
	xmlns:key="com.sap.aii.mapping.api.DynamicConfigurationKey"
	xmlns:xsltc="http://xml.apache.org/xalan/xsltc"
	xmlns:util="http://fresenius.de/XI/Global" exclude-result-prefixes="a"
	extension-element-prefixes="exslt sys sdf dat paramapper map ti dyn key xsltc util">
	<xsl:output method="xml" indent="no"
		omit-xml-declaration="no" encoding="UTF-8" />
	<!-- <xsl:import href="set-dynamic-config-AS2.xsl" /> -->
	<xsl:param name="inputparam" />
	<xsl:param name="MessageId" />
	<xsl:template match="/">
		<xsl:variable name="ISARECEIVERID">
			<text>006981815TST 01</text>
			<!-- <xsl:call-template name="PARAM1" /> -->
		</xsl:variable>
		<xsl:variable name="GSRECEIVERID">
			<text>006981815TST</text>
			<!-- <xsl:call-template name="PARAM2" /> -->
		</xsl:variable>
		<xsl:variable name="I14_I155_SegDelim">
			<text>T\~*</text>
			<!-- <xsl:call-template name="PARAM3" /> -->
		</xsl:variable>
		<xsl:variable name="ISASENDERID">
			<text>FRESENIUSPHARMTZZ</text>
			<!-- <xsl:call-template name="PARAM4" /> -->
		</xsl:variable>
		<xsl:variable name="GSSENDERID">
			<text>FRESENIUSPHARMT</text>
			<!-- <xsl:call-template name="PARAM5" /> -->
		</xsl:variable>
		<!-- TODO: Auto-generated template -->
		<a:ASC820_004010>

			<DIsplay>Test</DIsplay>
		</a:ASC820_004010>
	</xsl:template>
	<!-- &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& -->
	<!-- ========================================================================================================== -->
	<!-- Set dynamic parameters dynamically to set file name as desired by Bank -->
<!-- 	<xsl:template name="setDynamicConfigAS2"> -->
<!-- 		<xsl:param name="MessageId" /> -->
<!-- 		<xsl:call-template name="set-dynamic-config-AS2"> -->
<!-- 			<xsl:with-param name="nameMessageType" -->
<!-- 				select="' FKNAPHARMA.PSOURCE.820B'" /> -->
<!-- 			<xsl:with-param name="numberBusinessDocument" -->
<!-- 				select="820" /> -->
<!-- 			<xsl:with-param name="nameSenderSystem" -->
<!-- 				select="'FKNA'" /> -->
<!-- 			<xsl:with-param name="idMessage" select="$MessageId" /> -->
<!-- 		</xsl:call-template> -->
<!-- 	</xsl:template> -->
	<!-- ========================================================================================================== -->
	<xsl:template name="PARAM1">
		<PARAM1>
			<xsl:value-of
				select="paramapper:getValue(xsltc:cast('java.util.Map',$inputparam),'PARAM1')" />
		</PARAM1>
	</xsl:template>
	<!-- ========================================================================================================== -->
	<xsl:template name="PARAM2">
		<PARAM2>
			<xsl:value-of
				select="paramapper:getValue(xsltc:cast('java.util.Map',$inputparam),'PARAM2')" />
		</PARAM2>
	</xsl:template>
	<!-- ========================================================================================================== -->
	<xsl:template name="PARAM3">
		<PARAM3>
			<xsl:value-of
				select="paramapper:getValue(xsltc:cast('java.util.Map',$inputparam),'PARAM3')" />
		</PARAM3>
	</xsl:template>
	<!-- ========================================================================================================== -->
	<xsl:template name="PARAM4">
		<PARAM4>
			<xsl:value-of
				select="paramapper:getValue(xsltc:cast('java.util.Map',$inputparam),'PARAM4')" />
		</PARAM4>
	</xsl:template>
	<!-- ========================================================================================================== -->
	<xsl:template name="PARAM5">
		<PARAM5>
			<xsl:value-of
				select="paramapper:getValue(xsltc:cast('java.util.Map',$inputparam),'PARAM5')" />
		</PARAM5>
	</xsl:template>
	<!-- &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& -->
</xsl:stylesheet>