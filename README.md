# idafop
An attempt to export org-file to xsl fo.

# What is working

- 4 levels of headings (not configurable in org file)
- Paragraphs
- list (one level) Havn't tried nested lists.
- tables, fills whole size of the page.
- bold
- italic (emphasis)
- underline
- strike through
- code (monospaced text)
- subscipt and superscipt

# Usage

copy content of repo the location of the org-file. load ida.el into emacs.

# Files

idodok.fo - an file matching the layout that I wanted

templates/ - the graphics used in the document

ida.el - the exporter

org.org - the dokument used to test exporter
