<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
    avant
    <xsl:apply-templates />
    apres
</xsl:template>
<xsl:template match="nom">
    <xsl:value-of select="prenom" />
</xsl:template>
</xsl:stylesheet>
