;;; Markdown mode

(setq markdown-command "pandoc --smart -f markdown -t html")
(setq markdown-coding-system "utf-8")

(defun markdown-configure ()
  "markdown-mode configuration"
  (visual-line-mode t)
  (writegood-mode t)
  (flyspell-mode t))

(add-hook 'markdown-mode-hook 'markdown-configure)

