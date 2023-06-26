<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:map="java.util.Map"
	xmlns:dyn="com.sap.aii.mapping.api.DynamicConfiguration"
	xmlns:xsltc="http://xml.apache.org/xalan/xsltc"
	xmlns:key="com.sap.aii.mapping.api.DynamicConfigurationKey"
	extension-element-prefixes="key dyn map xsltc">
	<xsl:param name="inputparam" />
	<xsl:template name="set-dynamic-config-AS2">
		<xsl:param name="nameMessageType" />
		<xsl:param name="numberBusinessDocument" />
		<xsl:param name="nameSenderSystem" />
		<xsl:param name="idMessage" />
		<!-- change dynamic configuration -->
		<xsl:variable name="dynamic-conf"
			select="map:get(xsltc:cast('java.util.Map',$inputparam), 'DynamicConfiguration')" />
		<!--xsl:variable name="keyAS2FileName" select="key:create('urn:itelligence.de:pi:as2/AS2', 
			'AS2Filename')"/> <xsl:variable name="keyAS2Subject" select="key:create('urn:itelligence.de:pi:as2/AS2', 
			'AS2Subject')"/ -->
		<xsl:variable name="keyAS2FileName"
			select="key:create('http://sap.com/xi/XI/AS2/AS2', 'AS2Filename')" />
		<xsl:variable name="keyAS2Subject"
			select="key:create('http://sap.com/xi/XI/AS2/AS2', 'AS2Subject')" />
		<xsl:variable name="subject"
			select="concat($nameMessageType,': Docnum[',$numberBusinessDocument,'] FreseniusSenderSystem[',$nameSenderSystem,']')" />
		<xsl:variable name="fileName"
			select="concat($nameMessageType,'.',$idMessage)" />
		<!--xsl:message terminate="no"> <xsl:value-of select="concat('keyAS2Subject 
			=&gt; ',$keyAS2Subject)"/> <xsl:value-of select="concat('keyAS2FileName =&gt; 
			',$keyAS2FileName)"/> <xsl:value-of select="concat('subject =&gt; ',$subject)"/> 
			<xsl:value-of select="concat('fileName =&gt; ',$fileName)"/> </xsl:message -->
		<xsl:variable name="dummy1"
			select="dyn:put(xsltc:cast('com.sap.aii.mapping.api.DynamicConfiguration',$dynamic-conf), $keyAS2FileName, $fileName)" />
		<xsl:variable name="dummy2"
			select="dyn:put(xsltc:cast('com.sap.aii.mapping.api.DynamicConfiguration',$dynamic-conf), $keyAS2Subject, $subject)" />
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2009. Progress 
	Software Corporation. All rights reserved. <metaInformation> <scenarios/> 
	<MapperMetaTag> <MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" 
	destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/> 
	<MapperBlockPosition></MapperBlockPosition> <TemplateContext></TemplateContext> 
	<MapperFilter side="source"></MapperFilter> </MapperMetaTag> </metaInformation> -->