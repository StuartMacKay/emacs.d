;;; Modes

(line-number-mode 1)              ; have line numbers and
(column-number-mode 1)            ; column numbers in the mode line
(autopair-global-mode)            ; enable autopair in all buffers

;; (cua-mode t)                   ; disable c-x, c-v for now

(setq initial-major-mode 'org-mode)
(setq indent-tabs-mode nil)
(setq tab-width 4)
(setq-default show-trailing-whitespace t)
(setq x-select-enable-clipboard t)

(add-to-list 'auto-mode-alist '("\\.bash$" . shell-script-mode))
(add-to-list 'auto-mode-alist '("\\.gitconfig$" . conf-mode))
(add-to-list 'auto-mode-alist '("\\.html$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.yaml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.mdown$" . markdown-mode))

;;; Setup slime mode and autocomplete
;;; from https://github.com/purcell/ac-slime

(add-hook 'slime-mode-hook 'set-up-slime-ac)
(add-hook 'slime-repl-mode-hook 'set-up-slime-ac)
(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'slime-repl-mode))


;;; Select the modes where autocomplete is enabled

(ac-config-default)

(add-to-list 'ac-modes 'python-mode)
(add-to-list 'ac-modes 'js2-mode)
(add-to-list 'ac-modes 'web-mode)
