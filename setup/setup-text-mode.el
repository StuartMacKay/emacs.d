;;; Text mode

(defun text-configure ()
  "text-mode configuration"
  (turn-on-auto-fill))

(add-hook 'text-mode-hook 'text-configure)
