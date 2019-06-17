<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:ak2="http://www.akomantoso.org/2.0"
    xmlns:ak3="http://docs.oasis-open.org/legaldocml/ns/akn/3.0"
    exclude-result-prefixes="xs ak2 ak3"
    version="2.0">
    
    <xsl:output method="xml" indent="yes"/>
    
    <xsl:template match="/*" >
        <akomaNtoso xmlns="http://docs.oasis-open.org/legaldocml/ns/akn/3.0">
            <xsl:apply-templates />
        </akomaNtoso>
    </xsl:template>
    
    <!-- Convert id to eId in all cases. -->
    <xsl:template match="@id" >
        <xsl:attribute name="eId" select="." />
    </xsl:template>
    
    <xsl:template match="ak2:act | ak2:bill | ak2:amendment | ak2:debate | ak2:documentCollection | ak2:officialGazette | ak2:judgment | ak2:debateReport | ak2:portion"  >
        <xsl:element name="{local-name()}"  namespace="http://docs.oasis-open.org/legaldocml/ns/akn/3.0">
            <xsl:attribute name="name" select="generate-id()"/>
            <xsl:apply-templates select="@*"/>
            <xsl:apply-templates select="node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="ak2:formula | ak2:amendmentList | ak2:FRBRalias" >
        <xsl:element name="{local-name()}" namespace="http://docs.oasis-open.org/legaldocml/ns/akn/3.0">
            <xsl:attribute name="name" select="generate-id()"/>
            <xsl:apply-templates select="@*"/>
            <xsl:apply-templates select="node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="ak2:componentRef[parent::ak2:attachments]" >
        <attachment xmlns="http://docs.oasis-open.org/legaldocml/ns/akn/3.0"  >
            <documentRef>
                <xsl:attribute name="showAs" select="@showAs"/>
                <xsl:attribute name="href" select="@src"/>
                <xsl:attribute name="eId" select="@id"/>
            </documentRef>
        </attachment>
    </xsl:template>
    
    <xsl:template match="ak2:omissis[@status='omissis']"  >
        <omissis status="removed" xmlns="http://docs.oasis-open.org/legaldocml/ns/akn/3.0" />
    </xsl:template>
    
    <xsl:template match="@actor[parent::ak2:step]" >
        <xsl:attribute name="by" select="."/>
    </xsl:template>
    
    <xsl:template match="ak2:*" >
        <xsl:element name="{local-name()}" namespace="http://docs.oasis-open.org/legaldocml/ns/akn/3.0">
            <xsl:apply-templates select="@*"/>
            <xsl:apply-templates select="* | text()"/>
        </xsl:element>
    </xsl:template>
            
    <xsl:template match="ak2:componentRef[parent::ak2:collectionBody]"  >
        <component xmlns="http://docs.oasis-open.org/legaldocml/ns/akn/3.0">
            <documentRef  >
                <xsl:attribute name="showAs" select="@showAs"/>
                <xsl:attribute name="href" select="@src"/>
                <xsl:attribute name="eId" select="@id"/>
            </documentRef>
        </component>
    </xsl:template>
    
    <!-- Dropped -->
    <xsl:template match="ak2:interstitial[parent::ak2:collectionBody]"  />
   
    <!-- Identity Core -->
    
    <!-- Should process anything not in AKN 2.0 then you copy namespace stuff.  -->    
    <xsl:template match="element()"  >
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <xsl:apply-templates select="* | text()"/>
        </xsl:copy>        
    </xsl:template>
    
    <xsl:template match="@*" >
        <xsl:copy />
    </xsl:template>
    
    <xsl:template match="text()" >
        <xsl:copy />
    </xsl:template>
    
    <xsl:template match="comment()"  >
        <xsl:copy />
    </xsl:template>
    
</xsl:stylesheet>