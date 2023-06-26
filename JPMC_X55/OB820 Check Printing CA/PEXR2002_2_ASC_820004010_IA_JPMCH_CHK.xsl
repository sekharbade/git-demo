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
<xsl:stylesheet
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
        xmlns:a="http://fresenius.de/XI/ANSIX12"
        xmlns:exslt="http://exslt.org/common"
        xmlns:sys="java.lang.System"
        xmlns:sdf="java.text.SimpleDateFormat"
        xmlns:dat="java.util.Date"
        xmlns:paramapper="de.fresenius.xi.global.paramapper.ParameterMapper"
        xmlns:map="java.util.Map"
        xmlns:ti="com.sap.aii.mapping.api.TransformationInput"
        xmlns:dyn="com.sap.aii.mapping.api.DynamicConfiguration"
        xmlns:key="com.sap.aii.mapping.api.DynamicConfigurationKey"
        xmlns:xsltc="http://xml.apache.org/xalan/xsltc"
        xmlns:util="http://fresenius.de/XI/Global"
        version="1.0"
        exclude-result-prefixes="a"
        extension-element-prefixes="exslt sys sdf dat paramapper map ti dyn key xsltc util">
    <xsl:import href="set-dynamic-config-AS2.xsl"/>
    <!-- <xsl:import href="valueMappingTemplate.xsl"/> -->
    <xsl:output
            method="xml"
            indent="yes"
            omit-xml-declaration="no"
            encoding="UTF-8"/>
    <xsl:param name="inputparam"/>
    <xsl:param name="MessageId"/>
    <xsl:template match="/">
        <xsl:variable name="ISARECEIVERID">
            <!-- <text>006981815TST 01</text> -->
            <!-- <xsl:call-template name="PARAM1"/> -->
        </xsl:variable>
        <xsl:variable name="GSRECEIVERID">
            <!-- <text>006981815TST</text> -->
            <!-- <xsl:call-template name="PARAM2"/> -->
        </xsl:variable>
        <xsl:variable name="I14_I155_SegDelim">
            <!-- <text>T\~*</text> -->
            <!-- <xsl:call-template name="PARAM3"/> -->
        </xsl:variable>
        <xsl:variable name="ISASENDERID">
            <!-- <text>FRESENIUSPHARMTZZ</text> -->
            <!-- <xsl:call-template name="PARAM4"/> -->
        </xsl:variable>
        <xsl:variable name="GSSENDERID">
            <!-- <text>FRESENIUSPHARMT</text> -->
            <!-- <xsl:call-template name="PARAM5"/> -->
        </xsl:variable>
        <xsl:call-template name="setDynamicConfigAS2">
            <xsl:with-param
                    name="MessageId"
                    select="$MessageId"/>
        </xsl:call-template>
        <a:ASC820_004010>
            <S_ISA>
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
                <xsl:variable
                        name="DATE"
                        select="sdf:format(sdf:new('yyMMdd'), dat:new())"/>
                <D_I08>
                    <xsl:value-of select="$DATE"/>
                </D_I08>
                <xsl:variable
                        name="TIME"
                        select="sdf:format(sdf:new('HHmm'), dat:new())"/>
                <D_I09>
                    <xsl:value-of select="$TIME"/>
                </D_I09>
                <D_I10>U</D_I10>
                <D_I11>00401</D_I11>
                <D_I12>
                    <xsl:value-of
                            select="concat('$B2B_UEBNRControlNumber_',PEXR2002/IDOC/EDI_DC40/RCVPRN,'_ISA$B2B_END_UEBNR')"/>
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
                <D_DATAELEMENTSEPARATOR>
                    <xsl:value-of select="substring($I14_I155_SegDelim,4,1)"/>
                </D_DATAELEMENTSEPARATOR>
                <S_GS>
                    <D_479>RA</D_479>
                    <D_142>
                        <xsl:value-of select="$GSSENDERID"/>
                    </D_142>
                    <D_124>
                        <xsl:value-of select="$GSRECEIVERID"/>
                    </D_124>
                    <xsl:variable
                            name="GS_DATE"
                            select="sdf:format(sdf:new('yyyyMMdd'), dat:new())"/>
                    <D_373>
                        <xsl:value-of select="$GS_DATE"/>
                    </D_373>
                    <D_337>
                        <xsl:value-of select="$TIME"/>
                    </D_337>
                    <D_28>
                        <xsl:value-of
                                select="concat('$B2B_UEBNRControlNumber_',PEXR2002/IDOC/EDI_DC40/RCVPRN,'_ISA$B2B_END_UEBNR')"/>
                    </D_28>
                    <D_455>X</D_455>
                    <D_480>004010</D_480>
                    <!-- Process for Each IDOC -->
                    <xsl:for-each select="PEXR2002/IDOC">
                        <S_ST>
                            <D_143>820</D_143>
                            <D_329>
                                <xsl:value-of select='format-number(position(),"0000")'/>
                            </D_329>
                            <S_BPR>
                                <D_305>C</D_305>
                                <D_782>
                                    <xsl:value-of select="E1IDKU5[MOAQUAL=002]/MOABETR"/>
                                </D_782>
                                <D_478>C</D_478>
                                <D_591>CHK</D_591>
                                <D_506>01</D_506>
                                <D_507>
                                    <xsl:value-of select="E1IDB02[FIIQUALI = 'BA']/FIIBKENN"/>
                                </D_507>
                                <D_569>DA</D_569>
                                <D_508>
                                    <xsl:value-of select="E1IDB02[FIIQUALI = 'BA']/FIIKONTO"/>
                                </D_508>
                                <D_373>
                                    <xsl:value-of select="E1EDK03[IDDAT=017]/DATUM"/>
                                </D_373>
                            </S_BPR>
                            <S_TRN>
                                <D_481>1</D_481>
                                <D_127>
                                    <xsl:value-of select="E1EDK02[QUALF=022]/BELNR"/>
                                </D_127>
                            </S_TRN>
                            <S_CUR>
                                <D_98>PE</D_98>
                                <D_100>
                                    <xsl:value-of select="E1IDKU5[MOAQUAL=002]/CUXWAERZ"/>
                                </D_100>
                            </S_CUR>
                            <S_REF>
                                <D_128>CK</D_128>
                                <D_127>
                                    <xsl:value-of select="E1EDK12[QUALF='026']/BELNR"/>
                                </D_127>
                                <xsl:choose>
                                    <xsl:when test="E1IDKU3[PAIRZAWE = 'C']/PAYRUNCC = '3000'">
                                        <D_352>C1</D_352>
                                    </xsl:when>
                                    <xsl:when test="E1IDKU3[PAIRZAWE = 'C']/PAYRUNCC = '3700'">
                                        <D_352>C2</D_352>
                                    </xsl:when>
                                    <xsl:otherwise></xsl:otherwise>
                                </xsl:choose>
                            </S_REF>
                            <S_REF>
                                <D_128>RU</D_128>
                                <xsl:choose>
                                    <xsl:when test="boolean(E1EDKA1[PARVW = 'BE']/KNREF = 'C')">
                                        <!-- If customer Should default HQ1 -->
                                        <D_127>00HQ1</D_127>
                                    </xsl:when>
                                    <xsl:when test="boolean(E1IDPU1/E1EDP02[QUALF = '071']/BELNR)">
                                        <D_127>
                                            <xsl:call-template name="prepend-pad">
                                                <xsl:with-param
                                                        name="padChar"
                                                        select="0"/>
                                                <xsl:with-param
                                                        name="padVar"
                                                        select="E1IDPU1/E1EDP02[QUALF = '071']/BELNR"/>
                                                <xsl:with-param
                                                        name="length"
                                                        select="5"/>
                                            </xsl:call-template>
                                            <!-- <xsl:value-of -->
                                            <!-- select="E1IDPU1/E1EDP02[QUALF = '071']/BELNR" /> -->
                                        </D_127>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <D_127>00000</D_127>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </S_REF>
                            <xsl:for-each select="E1EDKA1[PARVW = 'AG']">
                                <!-- <xsl:if test="PARVW = 'AG'"> -->
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
                                <!-- </xsl:if> -->
                            </xsl:for-each>
                            <!--Handle Alternate Payee BE - Payee & ZE is Alternate Payee-->
                            <xsl:if test="E1EDKA1[PARVW = 'ZE']">
                                <xsl:for-each select="E1EDKA1[PARVW = 'ZE']">
                                    <xsl:sort select="PARVW" order="descending"/>
                                    <xsl:call-template name="Partner">
                                        <xsl:with-param
                                                name="LV_Parvw"
                                                select="'PE'"/>
                                        <xsl:with-param
                                                name="LV_Code"
                                                select="'91'"/>
                                        <xsl:with-param
                                                name="LV_IdenCode"
                                                select="format-number(PARTN, '#')"/>
                                    </xsl:call-template>
                                </xsl:for-each>
                            </xsl:if>
                            <xsl:if test="not(E1EDKA1[PARVW = 'ZE'])">
                                <!-- Consider Partner Function 'BE' as Payee-->
                                <xsl:for-each select="E1EDKA1[PARVW = 'BE']">
                                    <xsl:sort select="PARVW" order="ascending"/>
                                    <xsl:call-template name="Partner">
                                        <xsl:with-param
                                                name="LV_Parvw"
                                                select="'PE'"/>
                                        <xsl:with-param
                                                name="LV_Code"
                                                select="'91'"/>
                                        <xsl:with-param
                                                name="LV_IdenCode"
                                                select="format-number(PARTN, '#')"/>
                                    </xsl:call-template>
                                </xsl:for-each>
                            </xsl:if>
                            <!--                            <xsl:for-each select="E1EDKA1[PARVW = 'BE']">-->
                            <!--                                &lt;!&ndash; <xsl:if test="PARVW = 'BE'"> &ndash;&gt;-->
                            <!--                                <L_N1>-->
                            <!--                                    <S_N1>-->
                            <!--                                        <D_98>PE</D_98>-->
                            <!--                                        <D_93>-->
                            <!--                                            <xsl:choose>-->
                            <!--                                                <xsl:when test="NAME3 != ''">-->
                            <!--                                                    <xsl:value-of select="NAME3"/>-->
                            <!--                                                </xsl:when>-->
                            <!--                                                <xsl:otherwise>-->
                            <!--                                                    <xsl:value-of select="NAME1"/>-->
                            <!--                                                </xsl:otherwise>-->
                            <!--                                            </xsl:choose>-->
                            <!--                                        </D_93>-->
                            <!--                                        <D_66>91</D_66>-->
                            <!--                                        <D_67>-->
                            <!--                                            <xsl:value-of select="format-number(PARTN, '#')"/>-->
                            <!--                                        </D_67>-->
                            <!--                                    </S_N1>-->
                            <!--                                    <S_N3>-->
                            <!--                                        <xsl:choose>-->
                            <!--                                            <xsl:when test="STRAS">-->
                            <!--                                                <D_166>-->
                            <!--                                                    <xsl:value-of select="STRAS"/>-->
                            <!--                                                </D_166>-->
                            <!--                                            </xsl:when>-->
                            <!--                                            <xsl:when test="PFACH">-->
                            <!--                                                <D_166>-->
                            <!--                                                    <xsl:value-of select="PFACH"/>-->
                            <!--                                                </D_166>-->
                            <!--                                            </xsl:when>-->
                            <!--                                            <xsl:otherwise>-->
                            <!--                                                <D_166>NA</D_166>-->
                            <!--                                            </xsl:otherwise>-->
                            <!--                                        </xsl:choose>-->
                            <!--                                        <xsl:if test="STRS2">-->
                            <!--                                            <D_166_2>-->
                            <!--                                                <xsl:value-of select="STRS2"/>-->
                            <!--                                            </D_166_2>-->
                            <!--                                        </xsl:if>-->
                            <!--                                    </S_N3>-->
                            <!--                                    <S_N4>-->
                            <!--                                        <D_19>-->
                            <!--                                            <xsl:value-of select="ORT01"/>-->
                            <!--                                        </D_19>-->
                            <!--                                        <D_156>-->
                            <!--                                            <xsl:value-of select="REGIO"/>-->
                            <!--                                        </D_156>-->
                            <!--                                        <D_116>-->
                            <!--                                            <xsl:value-of select="PSTLZ"/>-->
                            <!--                                        </D_116>-->
                            <!--                                        <D_26>-->
                            <!--                                            <xsl:value-of select="LAND1"/>-->
                            <!--                                        </D_26>-->
                            <!--                                    </S_N4>-->
                            <!--                                </L_N1>-->
                            <!--                                &lt;!&ndash; </xsl:if> &ndash;&gt;-->
                            <!--                            </xsl:for-each>-->
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
                                                <xsl:choose>
                                                    <xsl:when test="boolean(DOCNUMMR)">
                                                        <xsl:value-of select="DOCNUMMR"/>
                                                    </xsl:when>
                                                    <xsl:otherwise>
                                                        <xsl:value-of select="E1EDP02[QUALF=010]/BELNR"/>
                                                    </xsl:otherwise>
                                                </xsl:choose>
                                            </D_127>
                                            <D_782>
                                                <xsl:choose>
                                                    <xsl:when test="contains(E1IDPU5[MOAQUAL=006]/MOABETR,'-')">
                                                        <xsl:value-of
                                                                select="concat('-',translate(E1IDPU5[MOAQUAL=006]/MOABETR,'-',''))"/>
                                                    
                                                    </xsl:when>
                                                    <xsl:otherwise>
                                                        <xsl:value-of select="E1IDPU5[MOAQUAL=006]/MOABETR"/>
                                                    </xsl:otherwise>
                                                </xsl:choose>
                                            </D_782>
                                            <D_782_2>
                                                <xsl:choose>
                                                    <xsl:when test="contains(E1IDPU5[MOAQUAL=004]/MOABETR,'-')">
                                                        <xsl:value-of
                                                                select="concat('-',translate(E1IDPU5[MOAQUAL=004]/MOABETR,'-',''))"/>
                                                    
                                                    </xsl:when>
                                                    <xsl:otherwise>
                                                        <xsl:value-of select="E1IDPU5[MOAQUAL=004]/MOABETR"/>
                                                    </xsl:otherwise>
                                                </xsl:choose>
                                            </D_782_2>
                                            <D_782_3>
                                                <xsl:choose>
                                                    <xsl:when test="contains(E1IDPU5[MOAQUAL=003]/MOABETR,'-')">
                                                        <xsl:value-of
                                                                select="concat('-',translate(E1IDPU5[MOAQUAL=003]/MOABETR,'-',''))"/>
                                                    
                                                    </xsl:when>
                                                    <xsl:otherwise>
                                                        <xsl:value-of select="E1IDPU5[MOAQUAL=003]/MOABETR"/>
                                                    </xsl:otherwise>
                                                </xsl:choose>
                                            </D_782_3>
                                        </S_RMR>
                                        <xsl:if test="boolean(E1EDP02[QUALF=070])">
                                            <S_NTE>
                                                <D_363>OTH</D_363>
                                                <D_352>
                                                    <xsl:for-each select="E1EDP02[QUALF=070]">
                                                        <xsl:if test="position() &lt; 4">
                                                            <xsl:value-of select="BELNR"/>
                                                        </xsl:if>
                                                    </xsl:for-each>
                                                </D_352>
                                            </S_NTE>
                                        </xsl:if>
                                        <!-- <xsl:for-each select="E1EDP02"> -->
                                        <!-- <xsl:if test="QUALF = 009"> -->
                                        <!-- <S_REF> -->
                                        <!-- <D_128>PO</D_128> -->
                                        <!-- <D_127> -->
                                        <!-- <xsl:value-of select="BELNR" /> -->
                                        <!-- </D_127> -->
                                        <!-- </S_REF> -->
                                        <!-- </xsl:if> -->
                                        <!-- </xsl:for-each> -->
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
                            <xsl:value-of
                                    select="concat('$B2B_UEBNRControlNumber_',PEXR2002/IDOC/EDI_DC40/RCVPRN,'_ISA$B2B_END_UEBNR')"/>
                        </D_28>
                    </S_GE>
                </S_GS>
                <S_IEA>
                    <D_I16>1</D_I16>
                    <D_I12>
                        <xsl:value-of
                                select="concat('$B2B_UEBNRControlNumber_',PEXR2002/IDOC/EDI_DC40/RCVPRN,'_ISA$B2B_END_UEBNR')"/>
                    </D_I12>
                </S_IEA>
            </S_ISA>
        </a:ASC820_004010>
    </xsl:template>
    <!-- &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& -->
    <!-- <<<<<<<<<<< ============== Templates ============== >>>>>>>>>>>> -->
    <!-- <<<<<<<<<<< ============== Template for populating address ============== >>>>>>>>>>>> -->
    <xsl:template
            name="Partner"
            match="/*">
        <xsl:param name="LV_Parvw"/>
        <xsl:param name="LV_Code"/>
        <xsl:param name="LV_IdenCode"/>
        <L_N1>
            <S_N1>
                <D_98>
                    <xsl:value-of select="$LV_Parvw"/>
                </D_98>
                <D_93>
                    <xsl:choose>
                        <xsl:when test="NAME3 != ''">
                            <xsl:value-of select="NAME3"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="NAME1"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </D_93>
                <D_66>
                    <xsl:value-of select="$LV_Code"/>
                </D_66>
                <D_67>
                    <xsl:value-of select="$LV_IdenCode"/>
                </D_67>
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
                <xsl:if test="boolean(STRS2)">
                    <D_166_2>
                        <xsl:value-of select="STRS2"/>
                    </D_166_2>
                </xsl:if>
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
    </xsl:template>
    <!-- ========================================================================================================== -->
    <!-- Set dynamic parameters dynamically to set file name as desired by Bank -->
    <xsl:template name="setDynamicConfigAS2">
        <xsl:param name="MessageId"/>
        <xsl:call-template name="set-dynamic-config-AS2">
            <xsl:with-param
                    name="nameMessageType"
                    select="' FKNAPHARMA.PSOURCE.820B'"/>
            <xsl:with-param
                    name="numberBusinessDocument"
                    select="820"/>
            <xsl:with-param
                    name="nameSenderSystem"
                    select="'FKNA'"/>
            <xsl:with-param
                    name="idMessage"
                    select="$MessageId"/>
        </xsl:call-template>
    </xsl:template>
    <!-- ========================================================================================================== -->
    <xsl:template name="prepend-pad">
        <!-- recursive template to right justify and prepend the value with whatever padChar is passed -->
        <xsl:param name="padChar"/>
        <xsl:param name="padVar"/>
        <xsl:param name="length"/>
        <xsl:choose>
            <xsl:when test="string-length($padVar) &lt; $length">
                <xsl:call-template name="prepend-pad">
                    <xsl:with-param
                            name="padChar"
                            select="$padChar"/>
                    <xsl:with-param
                            name="padVar"
                            select="concat($padChar,$padVar)"/>
                    <xsl:with-param
                            name="length"
                            select="$length"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="substring($padVar,string-length($padVar)-$length+1)"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <!-- ========================================================================================================== -->
    <!-- Value Mapping Template to get company Code -->
    <!-- <xsl:template name="mapFKCompanyCode_to_JPMCCompanyID"> -->
    <!-- <xsl:param name="FKCompanyCode" /> -->
    <!-- <xsl:variable name="JPMCCompanyCode"> -->
    <!-- <xsl:call-template name="util:valueMapping"> -->
    <!-- <xsl:with-param name="sourceAgency" select="'Fresenius Company Group'" /> -->
    <!-- <xsl:with-param name="sourceScheme" select="'Fresenius Company Code'" /> -->
    <!-- <xsl:with-param name="sourceValue" select="$FKCompanyCode" /> -->
    <!-- <xsl:with-param name="targetAgency" select="'JPMC Company Group'" /> -->
    <!-- <xsl:with-param name="targetScheme" select="'JPMC Company ID'" /> -->
    <!-- </xsl:call-template> -->
    <!-- </xsl:variable> -->
    <!-- <xsl:choose> -->
    <!-- <xsl:when test="string-length($JPMCCompanyCode) &gt; 0"> -->
    <!-- <xsl:value-of select="$JPMCCompanyCode" /> -->
    <!-- </xsl:when> -->
    <!-- <xsl:otherwise> -->
    <!-- <xsl:message terminate="yes"> -->
    <!-- <xsl:value-of -->
    <!-- select="concat('JPMC Company code not maintained for', $FKCompanyCode)" /> -->
    <!-- </xsl:message> -->
    <!-- </xsl:otherwise> -->
    <!-- </xsl:choose> -->
    <!-- </xsl:template> -->
    <!-- ========================================================================================================== -->
    <xsl:template name="PARAM1">
        <PARAM1>
            <xsl:value-of select="paramapper:getValue(xsltc:cast('java.util.Map',$inputparam),'PARAM1')"/>
        </PARAM1>
    </xsl:template>
    <!-- ========================================================================================================== -->
    <xsl:template name="PARAM2">
        <PARAM2>
            <xsl:value-of select="paramapper:getValue(xsltc:cast('java.util.Map',$inputparam),'PARAM2')"/>
        </PARAM2>
    </xsl:template>
    <!-- ========================================================================================================== -->
    <xsl:template name="PARAM3">
        <PARAM3>
            <xsl:value-of select="paramapper:getValue(xsltc:cast('java.util.Map',$inputparam),'PARAM3')"/>
        </PARAM3>
    </xsl:template>
    <!-- ========================================================================================================== -->
    <xsl:template name="PARAM4">
        <PARAM4>
            <xsl:value-of select="paramapper:getValue(xsltc:cast('java.util.Map',$inputparam),'PARAM4')"/>
        </PARAM4>
    </xsl:template>
    <!-- ========================================================================================================== -->
    <xsl:template name="PARAM5">
        <PARAM5>
            <xsl:value-of select="paramapper:getValue(xsltc:cast('java.util.Map',$inputparam),'PARAM5')"/>
        </PARAM5>
    </xsl:template>
    <!-- &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& -->
</xsl:stylesheet>	