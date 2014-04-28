<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
    <html><body>
    <div>entête</div>
    <xsl:apply-templates />
    <div>pied</div>
    </body></html>
</xsl:template>
<xsl:template match="employe">
    <div>employé:<xsl:apply-templates /></div>
</xsl:template>
</xsl:stylesheet>