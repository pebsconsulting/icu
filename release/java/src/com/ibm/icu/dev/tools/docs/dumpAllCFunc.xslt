<!--
/*
*******************************************************************************
* Copyright (C) 2006, International Business Machines Corporation and    *
* others. All Rights Reserved.                                                *
*******************************************************************************
* This is the ant build file for ICU tools. 
*/
-->
<!--
  List all c functions generated from the 'index.xml'
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:param name="docFolder" />

  <xsl:template match="/">
  <list>
      <xsl:variable name="files_node" select="/doxygenindex/compound[@kind='file']/@refid" />
      <xsl:for-each select="$files_node">
        <xsl:variable name="file" select="concat($docFolder, . , '.xml')" />
        <xsl:variable name="funcs_node" select="document($file)/doxygen/compounddef/sectiondef/memberdef[@prot='public'][@kind='function']" />
        <xsl:for-each select="$funcs_node">
          <cppfunc>
             <xsl:copy-of select="@id" />
             <xsl:attribute name="status"><xsl:value-of select="detaileddescription/para/xrefsect/xreftitle/text()"/></xsl:attribute>
             <xsl:attribute name="prototype"><xsl:value-of select="concat(definition/text(), argsstring/text())" /></xsl:attribute>
             <xsl:copy-of select="location/@file" />
          </cppfunc>
        </xsl:for-each>
      </xsl:for-each>
  </list>
  </xsl:template>
</xsl:stylesheet>


