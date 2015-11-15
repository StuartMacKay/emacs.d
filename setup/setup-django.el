
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.less\\'" . web-mode))

(setq web-mode-engines-alist 
      '(("django" . "\\.html\\."))
)
