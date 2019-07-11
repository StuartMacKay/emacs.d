;;; Javascript mode

(defun js-configure ()
  "js2-mode configuration"
  (setq js-indent-level 2)
  (js2-imenu-extras-mode))

(add-hook 'js-mode-hook 'js-configure)
