<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:valueMapper="com.sap.aii.mapping.value.api.XIVMService"
	xmlns:util="http://fresenius.de/XI/Global"
	extension-element-prefixes="util">
	<xsl:param name="inputparam" />
	<xsl:template name="util:valueMapping">
		<xsl:param name="sourceContext"
			select="'http://sap.com/xi/XI'" />
		<xsl:param name="sourceAgency" />
		<xsl:param name="sourceScheme" />
		<xsl:param name="sourceValue" />
		<xsl:param name="targetContext"
			select="'http://sap.com/xi/XI'" />
		<xsl:param name="targetAgency" />
		<xsl:param name="targetScheme" />
		<!--xsl:choose -->
		<!--xsl:when test="function-available('valueMapper:executeMapping')" -->
		<xsl:value-of
			select="valueMapper:executeMapping($sourceContext, $sourceAgency,$sourceScheme,$sourceValue, $targetContext, $targetAgency,$targetScheme)" />
		<!--/xsl:when -->
		<!--xsl:otherwise -->
		<!--xsl:message terminate="yes">ValueMapping not available!</xsl:message -->
		<!--/xsl:otherwise -->
		<!--/xsl:choose -->
	</xsl:template>
</xsl:stylesheet>
<!-- Stylus Studio meta-information - (c) 2004-2009. Progress Software Corporation. 
	All rights reserved. <metaInformation> <scenarios/> <MapperMetaTag> <MapperInfo 
	srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" 
	destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/> 
	<MapperBlockPosition></MapperBlockPosition> <TemplateContext></TemplateContext> 
	<MapperFilter side="source"></MapperFilter> </MapperMetaTag> </metaInformation> -->