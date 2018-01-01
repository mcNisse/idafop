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
  (concat
   "<fo:inline font-weight=\"bold\">"
   contents
   "</fo:inline>"))
(defun org-idafop-center-block (center-block contents info)
  (message "center-block")
  "")
(defun org-idafop-clock (clock contents info)
  (message "clock")
  "")

(defun org-idafop-code (code contents info)
  (message "code")
  (concat
   "<fo:inline font-family=\"monospace\">"
   (org-element-property :value code)
  "</fo:inline>"))

(defun org-idafop-drawer (bold contents info)
  (message "drawer")
  "")
(defun org-idafop-dynamic-block (dynamic-block contents info)
  (message "dynamic-block")
  "")
(defun org-idafop-entity (entity contents info)
  (message "entity")
  "")
(defun org-idafop-example-block (example-block contents info)
  (message "example-block")
  "")
(defun org-idafop-export-block (export-block contents info)
  (message "export-block")
  "")
(defun org-idafop-export-snippet (export-snippet contents info)
  (message "export-snippet")
  "")
(defun org-idafop-fixed-width (fixed-width contents info)
  (message "fixed-width")
  "")
(defun org-idafop-footnote-definition (footnote-definition contents info)
  (message "footnote-definition")
  "")
(defun org-idafop-footnote-reference (footnote-reference contents info)
  (message "footnote-reference")
  "")
(defun org-idafop-headline (headline contents info)
  (let* ((level (org-export-get-relative-level headline info))
         (numbered (org-export-numbered-headline-p headline info))
         (title (org-element-property :raw-value headline))
         (prefix (if (and numbered (<= level 4))
                     (mapconcat 'number-to-string
                                (org-export-get-headline-number headline info)
                                ".")
                   nil))
         (fontsize (case level
                     (1 24)
                     (2 18)
                     (3 14)
                     (4 12)
                     (otherwise 11)))
         (page-break (if (= level 1) "page" "auto"))
         (margin-top (case level
                       (1 "0in")
                       (otherwise "0.3in"))))
    (message (concat "headline: "
                     (if numbered "true " "false ")
                     (number-to-string level)))
    (concat 
     (format
      "<fo:block font-weight=\"bold\" color=\"#44b3d5\" font-size=\"%dpt\" break-before=\"%s\" margin-top=\"%s\">"
      fontsize
      page-break
      margin-top)
     (if prefix (concat prefix " "))
     title
     "</fo:block>"
     contents)))

(defun org-idafop-horizontal-rule (horizontal-rule contents info)
  (message "horizontal-rule")
  "")
(defun org-idafop-inline-src-block (inline-src-block contents info)
  (message "inline-src-block")
  "")
(defun org-idafop-inlinetask (inlinetask contents info)
  (message "inlinetask")
  "")
(defun org-idafop-italic (italic contents info)
  (message "italic")
  (concat
   "<fo:inline font-style=\"italic\">"
   contents
   "</fo:inline>"))

(defun org-idafop-keyword (keyword contents info)
  (message "keyword")
  "")
(defun org-idafop-idafop-environment (idafop-environment contents info)
  (message "idafop-environment")
  "")
(defun org-idafop-idafop-fragment (idafop-fragment contents info)
  (message "idafop-fragment")
  "")
(defun org-idafop-line-break (line-break contents info)
  (message "line-break")
  "")
(defun org-idafop-link (link contents info)
  (message "link")
  "")
(defun org-idafop-paragraph (paragraph contents info)
  (message "paragraph")
  (let* ((parent-type (org-element-type (org-export-get-parent paragraph)))
         (margin-top (cond
                      ((eq parent-type 'section) "5mm")
                      (t "0mm"))))
    (concat
                                        ;"<fo:block margin-top=\".2in\">"
     (format "<fo:block margin-top=\"%s\">" margin-top)
     contents
     "</fo:block>")))

(defun org-idafop-plain-list (plain-list contents info)
  (message "plain-list")
  (let* ((type (org-element-property :type plain-list))
         (indentations (cond ((eq type 'ordered) '(".4cm" ".3cm"))
                          ((eq type 'descriptive) '("3cm" ".3cm"))
                          (t '(".3cm" ".2cm")))))
    (concat
     (format 
      "<fo:list-block start-indent=\"1cm\" provisional-distance-between-starts=\"%s\" provisional-label-separation=\"%s\">"
      (car indentations)
      (cadr indentations))
     contents
     "</fo:list-block>")
     ))
(defun org-idafop-item (item contents info)
  (message "item")
  (let* ((tag (org-element-interpret-data (org-element-property :tag item)))
         (structure (org-element-property :structure item))
         (parent (org-export-get-parent item))
         (type (org-element-property :type parent))
         (marker (cond ((eq type 'ordered) (concat (number-to-string (car (org-export-get-ordinal item info))) "."))
                       ((eq type 'descriptive) tag)
                       (t "<fo:character character=\"&#x2022;\"/>"))))
    (message (concat "marker: " marker))
    (concat
     "<fo:list-item><fo:list-item-label end-indent=\"label-end()\">"
     "<fo:block font-weight=\"bold\" font-style=\"italic\" color=\"#44b3d5\">"
     marker
     "</fo:block>"
     "</fo:list-item-label>"
     "<fo:list-item-body start-indent=\"body-start()\">"
     contents
     "</fo:list-item-body></fo:list-item>")))

(defun org-idafop-plain-text (contents info)
  (message (concat "plain-text: " ""))
  contents)
(defun org-idafop-planning (planning contents info)
  (message "planning")
  "")
(defun org-idafop-quote-block (quote-block contents info)
  (message "quote-block")
  "")
(defun org-idafop-quote-section (quote-section contents info)
  (message "quote-section")
  "")
(defun org-idafop-radio-target (radio-target contents info)
  (message "radio-target")
  "")
(defun org-idafop-section (section contents info)
  (message "section")
  contents)
(defun org-idafop-special-block (special-block contents info)
  (message "special-block")
  "block")
(defun org-idafop-src-block (src-block contents info)
  (message "src-block")
  "")
(defun org-idafop-statistics-cookie (statistics-cookie contents info)
  (message "statistics-cookie")
  "")
(defun org-idafop-strike-through (strike-through contents info)
  (message "strike-through")
  (concat
   "<fo:inline text-decoration=\"line-through\">"
   contents
   "</fo:inline>"))
(defun org-idafop-subscript (subscript contents info)
  (message (concat "subscript " contents))
  (concat
   "<fo:inline vertical-align=\"sub\" font-size=\"6pt\">"
   contents
   "</fo:inline>"))
           
(defun org-idafop-superscript (superscript contents info)
  (message "superscript")
  (concat
   "<fo:inline vertical-align=\"super\" font-size=\"6pt\">"
   contents
   "</fo:inline>"))

(defun org-idafop-table (table contents info)
  (message "table")
  (let* ((dim (org-export-table-dimensions table info))
         (cellsizes
          (mapcar
           (lambda
             (col)
             (org-element-map table 'table-row
               (lambda
                 (row)
                 (length
                  (org-export-data
                   (org-element-contents
                    (elt
                     (org-element-contents row) col)) info))) info))
           (number-sequence 0 (- (cdr dim) 1))))
         (char-col-size (mapcar (lambda (colsizes) (apply 'max colsizes)) cellsizes))
         (col-size (let* ((total (apply '+ char-col-size))
                          (part (/ 15.0 total)))
                     (mapcar (lambda (x) (format "%2.2fcm" (* part x))) char-col-size)))
         (caption nil));;(org-element-property :caption table)))
    (concat
     (and caption
          (concat
           "<fo:table-and-caption>"
           "<fo:table-caption>"
           "<fo:block>"
           (org-export-data caption info)
           "</fo:block>"
           "</fo:table-caption>")
           )
     "<fo:table border-style=\"solid\" border-width=\".5mm\" border-color=\"#44b3d5\">"
     (and (org-export-table-has-header-p table info)
          (org-idafop-export-rows t table info))
     (org-idafop-export-rows nil table info)
     "</fo:table>"
     (and caption
          "</fo:table-and-caption>"))))
  
(defun org-idafop-export-rows (head table info)
  (let* ((config (if head
                     '(:tag "table-header" :background "#44b3d5" :text-color "#ffffff" :text-align "center" :cell-borders "")
                   '(:tag "table-body"  :background "#ffffff" :text-color "#000000" :text-align "left" :cell-borders " border-style=\"solid\" border-width=\".5mm\" border-color=\"#44b3d5\""))))
    (concat
     (format "<fo:%s text-align=\"%s\" background-color=\"%s\">" (plist-get config :tag) (plist-get config :text-align) (plist-get config :background))
     (mapconcat 'identity
                (let ((in-header nil))
                  (org-element-map table 'table-row
                    (lambda
                      (row)
                      (let ((ends (org-export-table-row-ends-header-p row info))
                            (starts (org-export-table-row-starts-header-p row info))
                            (special-row (not (eq (org-element-property :type row) 'standard)))
                            (export nil))
                        (if (or starts in-header)
                            (progn
                              (setq export head)
                              (setq in-header (not ends)))
                          (setq export (and (not head) (not special-row))))
                        (if export
                            (org-idafop-export-row config row info))))
                    info))
                "")
    (format "</fo:%s>" (plist-get config :tag)))))
(defun org-idafop-export-row (config row info)
  (concat
   "<fo:table-row>"
   (mapconcat
    'identity
    (org-element-map row 'table-cell
      (lambda (cell)
        (concat
         (format "<fo:table-cell%s>" (plist-get config :cell-borders)) 
         (format "<fo:block color=\"%s\" margin-left=\"1mm\" margin-top=\"1mm\">" (plist-get config :text-color))
         (org-export-data (org-element-contents cell) info)
         "</fo:block>"
         "</fo:table-cell>"))
      info) "")
   "</fo:table-row>"))

(defun org-idafop-table-cell (table-cell contents info)
  (message "table-cell")
  "")
(defun org-idafop-table-row (table-row contents info)
  (message "table-row")
  (let ((test "test"))
        ""))
(defun org-idafop-target (target contents info)
  (message "target")
  "")

;;;;;;;;;;;;;;;;;;;;;;;
; create the document ;
;;;;;;;;;;;;;;;;;;;;;;;
(defun org-idafop-template (contents info)
  (message "template")
  (let* ((title (mapconcat (lambda (o) (org-element-interpret-data o)) (plist-get info :title) ""))
         (created (plist-get info :date))
         (c (format "%s-%s-%s"
                    (plist-get (cadar created) :year-start)
                    (plist-get (cadar created) :month-start)
                    (plist-get (cadar created) :day-start)))
         ;(plist-get info :date))
         )
    (concat
     "<?xml version=\"1.0\" encoding=\"utf-8\"?>
<fo:root xmlns:fo=\"http://www.w3.org/1999/XSL/Format\">
"
     idafop-layout-master-set
     "<fo:page-sequence master-reference=\"titlePage\">"
     idafop-static-content-title
     (format idafop-title-flow title c)
     "</fo:page-sequence>"
     "<fo:page-sequence master-reference=\"content\">"
     idafop-static-content-content
     "<fo:flow flow-name=\"xsl-region-body\" font-size=\"11pt\">"
     contents
     "<fo:block id=\"last-page\"/>"
     "</fo:flow>"
     "</fo:page-sequence>"
     "</fo:root>"
    )))

(defun org-idafop-timestamp (timestamp contents info)
  (message "timestamp")
  contents)

(defun org-idafop-underline (underline contents info)
  (message "underline")
  (concat
   "<fo:inline text-decoration=\"underline\">"
   contents
   "</fo:inline>"))

(defun org-idafop-verbatim (verbatim contents info)
  (message "verbatim")
  (org-idafop-code verbatim contents info))

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
                      margin-bottom=\"2cm\"
                      margin-left=\".7in\"
                      margin-right=\".7in\"/>
      <fo:region-before region-name=\"cHead\" extent=\"2cm\"/>
      <fo:region-after region-name=\"cFooter\" extent=\"1.7cm\"/>
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
<fo:block margin-top=\"2in\" font-size=\"22pt\" text-align=\"center\" font-weight=\"bold\" color=\"#44b3d5\">
    %s
  </fo:block>
<fo:block text-align=\"center\" margin-top=\".3in\" font-size=\"15pt\" font-weight=\"bold\">%s</fo:block>
</fo:flow>")
