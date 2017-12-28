(eval-when-compile (require 'cl))
(require 'ox)
(require 'ox-publish)

(org-export-define-backend 'idafop
  '((bold . org-idafop-bold)
    (center-block . org-idafop-center-block)
    (clock . org-idafop-clock)
    (code . org-idafop-code)
    (comment . (lambda (&rest args) ""))
    (comment-block . (lambda (&rest args) ""))
    (drawer . org-idafop-drawer)
    (dynamic-block . org-idafop-dynamic-block)
    (entity . org-idafop-entity)
    (example-block . org-idafop-example-block)
    (export-block . org-idafop-export-block)
    (export-snippet . org-idafop-export-snippet)
    (fixed-width . org-idafop-fixed-width)
    (footnote-definition . org-idafop-footnote-definition)
    (footnote-reference . org-idafop-footnote-reference)
    (headline . org-idafop-headline)
    (horizontal-rule . org-idafop-horizontal-rule)
    (inline-src-block . org-idafop-inline-src-block)
    (inlinetask . org-idafop-inlinetask)
    (italic . org-idafop-italic)
    (item . org-idafop-item)
    (keyword . org-idafop-keyword)
    (idafop-environment . org-idafop-idafop-environment)
    (idafop-fragment . org-idafop-idafop-fragment)
    (line-break . org-idafop-line-break)
    (link . org-idafop-link)
    (paragraph . org-idafop-paragraph)
    (plain-list . org-idafop-plain-list)
    (plain-text . org-idafop-plain-text)
    (planning . org-idafop-planning)
    (property-drawer . (lambda (&rest args) ""))
    (quote-block . org-idafop-quote-block)
    (quote-section . org-idafop-quote-section)
    (radio-target . org-idafop-radio-target)
    (section . org-idafop-section)
    (special-block . org-idafop-special-block)
    (src-block . org-idafop-src-block)
    (statistics-cookie . org-idafop-statistics-cookie)
    (strike-through . org-idafop-strike-through)
    (subscript . org-idafop-subscript)
    (superscript . org-idafop-superscript)
    (table . org-idafop-table)
    (table-cell . org-idafop-table-cell)
    (table-row . org-idafop-table-row)
    (target . org-idafop-target)
    (template . org-idafop-template)
    (timestamp . org-idafop-timestamp)
    (underline . org-idafop-underline)
    (verbatim . org-idafop-verbatim)
    (verse-block . org-idafop-verse-block))
  :export-block '("FOP IDA")
  :menu-entry
  '(?i "Export to ida fop"
       ((?i "As ida file" org-idafop-export-to-idafop)))
  )

(defun org-idafop-bold (bold contents info)
  (message "bold")
  contents)
(defun org-idafop-center-block (center-block contents info)
  (message "center-block")
  contents)
(defun org-idafop-clock (clock contents info)
  (message "clock")
  contents)
(defun org-idafop-code (code contents info)
  (message "code")
  (org-element-property :value code))
(defun org-idafop-drawer (bold contents info)
  (message "drawer")
  contents)
(defun org-idafop-dynamic-block (dynamic-block contents info)
  (message "dynamic-block")
  contents)
(defun org-idafop-entity (entity contents info)
  (message "entity")
  contents)
(defun org-idafop-example-block (example-block contents info)
  (message "example-block")
  contents)
(defun org-idafop-export-block (export-block contents info)
  (message "export-block")
  contents)
(defun org-idafop-export-snippet (export-snippet contents info)
  (message "export-snippet")
  contents)
(defun org-idafop-fixed-width (fixed-width contents info)
  (message "fixed-width")
  contents)
(defun org-idafop-footnote-definition (footnote-definition contents info)
  (message "footnote-definition")
  contents)
(defun org-idafop-footnote-reference (footnote-reference contents info)
  (message "footnote-reference")
  contents)
(defun org-idafop-headline (headline contents info)
  (message (concat "headline: "
                   ;(number-to-string (org-export-get-relative-level headline info))
                   ;(if (org-export-numbered-headline-p headline info) ",true," ",false,")
                                        ;(org-element-property :title headline)))
                   " "))
                   
  (concat (org-element-property :raw-value headline) "\n" contents))

(defun org-idafop-horizontal-rule (horizontal-rule contents info)
  (message "horizontal-rule")
  contents)
(defun org-idafop-inline-src-block (inline-src-block contents info)
  (message "inline-src-block")
  contents)
(defun org-idafop-inlinetask (inlinetask contents info)
  (message "inlinetask")
  contents)
(defun org-idafop-italic (italic contents info)
  (message "italic")
  contents)
(defun org-idafop-item (item contents info)
  (message "item")
  contents)
(defun org-idafop-keyword (keyword contents info)
  (message "keyword")
  contents)
(defun org-idafop-idafop-environment (idafop-environment contents info)
  (message "idafop-environment")
  contents)
(defun org-idafop-idafop-fragment (idafop-fragment contents info)
  (message "idafop-fragment")
  contents)
(defun org-idafop-line-break (line-break contents info)
  (message "line-break")
  contents)
(defun org-idafop-link (link contents info)
  (message "link")
  contents)
(defun org-idafop-paragraph (paragraph contents info)
  (message "paragraph")
  contents)
(defun org-idafop-plain-list (plain-list contents info)
  (message "plain-list")
  contents)
(defun org-idafop-plain-text (contents info)
  (message (concat "plain-text: " contents))
  contents)
(defun org-idafop-planning (planning contents info)
  (message "planning")
  contents)
(defun org-idafop-quote-block (quote-block contents info)
  (message "quote-block")
  contents)
(defun org-idafop-quote-section (quote-section contents info)
  (message "quote-section")
  contents)
(defun org-idafop-radio-target (radio-target contents info)
  (message "radio-target")
  contents)
(defun org-idafop-section (section contents info)
  (message "section")
  contents)
(defun org-idafop-special-block (special-block contents info)
  (message "special-block")
  "block")
(defun org-idafop-src-block (src-block contents info)
  (message "src-block")
  contents)
(defun org-idafop-statistics-cookie (statistics-cookie contents info)
  (message "statistics-cookie")
  contents)
(defun org-idafop-strike-through (strike-through contents info)
  (message "strike-through")
  contents)
(defun org-idafop-subscript (subscript contents info)
  (message "subscript")
  contents)
(defun org-idafop-superscript (superscript contents info)
  (message "superscript")
  contents)
(defun org-idafop-table (table contents info)
  (message "table")
  contents)
(defun org-idafop-table-cell (table-cell contents info)
  (message "table-cell")
  contents)
(defun org-idafop-table-row (table-row contents info)
  (message "table-row")
  contents)
(defun org-idafop-target (target contents info)
  (message "target")
  contents)

;;;;;;;;;;;;;;;;;;;;;;;
; create the document ;
;;;;;;;;;;;;;;;;;;;;;;;
(defun org-idafop-template (contents info)
  (message "template")
  (let ((title (org-export-data (plist-get info :title) info))
        )
    (concat
     "<?xml version=\"1.0\" encoding=\"utf-8\"?>
<fo:root xmlns:fo=\"http://www.w3.org/1999/XSL/Format\">
"
     idafop-layout-master-set
     "<fo:page-sequence master-reference=\"titlePage\">"
     idafop-static-content-title
     "</fo:page-sequence>"
     "</fo:root>"
    )))
(defun org-idafop-timestamp (timestamp contents info)
  (message "timestamp")
  contents)
(defun org-idafop-underline (underline contents info)
  (message "underline")
  contents)
(defun org-idafop-verbatim (verbatim contents info)
  (message "verbatim")
  (org-element-property :value verbatim))
(defun org-idafop-verse-block (verse-block contents info)
  (message "verse-block")
  contents)

(defun org-idafop-export-to-idafop
    (&optional async subtreep visible-only body-only ext-plist)
  (interactive)
  (let ((outfile (org-export-output-file-name ".fo" subtreep)))
    (org-export-to-file 'idafop outfile async subtreep visible-only body-only ext-plist)))


;; String constants and other reusable items
(setq idafop-layout-master-set  "<fo:layout-master-set>
    <fo:simple-page-master master-name=\"titlePage\"
				page-height=\"11.692in\"  page-width=\"8.267in\" margin-top=\".5in\" 
				margin-bottom=\".5in\" margin-left=\"0in\" margin-right=\"0in\">
      <fo:region-body margin-top=\"1in\" margin-bottom=\".5in\" margin-left=\"1in\" margin-right=\"1in\"/>
      <fo:region-before region-name=\"head\" extent=\".7in\"/>
    </fo:simple-page-master>
    <fo:simple-page-master master-name=\"content\"
			   page-height=\"11.692in\"
                           page-width=\"8.267in\"
                           margin-top=\".5in\" 
                           margin-bottom=\".5in\"
                           margin-left=\"0\"
                           margin-right=\"0\">
      <fo:region-body margin-top=\"1in\"
                      margin-bottom=\".5in\"
                      margin-left=\".7in\"
                      margin-right=\".7in\"/>
      <fo:region-before region-name=\"cHead\" extent=\".7in\"/>
      <fo:region-after region-name=\"cFooter\" extent=\".7in\"/>
    </fo:simple-page-master>
  </fo:layout-master-set>")

(setq idafop-static-content-title "<fo:static-content flow-name=\"head\">
  <fo:block space-before=\"200pt\"
            border-bottom=\"thin\"
            border-bottom-style=\"solid\"
            border-bottom-color=\"#44b3d5\"
            >
    <fo:table>
      <fo:table-body>
        <fo:table-row>
          <fo:table-cell>
            <fo:block>
              <fo:external-graphic padding-left=\".7in\" padding-right=\"1.3in\" padding-bottom=\".16in\" src=\"template/idainfront_200.png\"/>
            </fo:block>
          </fo:table-cell>
          <fo:table-cell>
            <fo:block 
                color=\"#44b3d5\"
                font-size=\"10pt\"
                margin-top=\".1in\"
                >
              VI BYGGER FRAMTIDENS INFORMATIONSSAMHÄLLE
            </fo:block>
          </fo:table-cell>
        </fo:table-row>
      </fo:table-body>
    </fo:table>
  </fo:block>
</fo:static-content>")

(setq idafop-static-content-content "<fo:static-content flow-name=\"cHead\">
<fo:block space-before=\"200pt\"
            border-bottom=\".2in\"
            border-bottom-style=\"solid\"
            border-bottom-color=\"#44b3d5\"
            >
    <fo:table>
      <fo:table-body>
        <fo:table-row>
          <fo:table-cell>
            <fo:block>
              <fo:external-graphic padding-left=\".7in\" padding-right=\"1.3in\" padding-bottom=\".16in\" src=\"template/idainfront_200.png\"/>
            </fo:block>
          </fo:table-cell>
          <fo:table-cell>
            <fo:block 
                color=\"#44b3d5\"
                font-size=\"10pt\"
                margin-top=\".1in\"
                >
              VI BYGGER FRAMTIDENS INFORMATIONSSAMHÄLLE
            </fo:block>
          </fo:table-cell>
        </fo:table-row>
      </fo:table-body>
    </fo:table>
  </fo:block>
</fo:static-content>
<fo:static-content flow-name=\"cFooter\">
  <fo:block margin-right=\".5in\"
            margin-left=\".5in\">
    <fo:block border-top=\"thin\"
              border-top-style=\"solid\"
              border-top-color=\"#44b3d5\">
      <fo:block color=\"#9e85ae\"
                text-align=\"center\"
                font-size=\"9pt\"
                margin-top=\"2pt\">
        <fo:block>Ida Infront AB • Box 576 • 581 07 Linköping • Org. nr: 556316-2469 • 013 37 37 00 • info@idainfront.se</fo:block>
        <fo:block>www.idainfront.se</fo:block>
      </fo:block>
      <fo:block text-align=\"center\"
                color=\"#44b3d5\"
                font-weight=\"bold\"
                margin-top=\".1in\"><fo:page-number/>(<fo:page-number-citation ref-id=\"last-page\"/>)</fo:block>
    </fo:block>
  </fo:block>
</fo:static-content>")

(setq idafop-title-flow "<fo:flow flow-name=\"xsl-region-body\">
<fo:block font-size=\"18pt\" text-align=\"center\" font-weight=\"bold\" color=\"#44b3d5\">
    %s
  </fo:block>
</fo:flow>")
