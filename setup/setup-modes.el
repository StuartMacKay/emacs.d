;;; Modes

(line-number-mode 1)              ; have line numbers and
(column-number-mode 1)            ; column numbers in the mode line

;; (cua-mode t)                   ; disable c-x, c-v for now

(setq initial-major-mode 'org-mode)
(setq indent-tabs-mode nil)
(setq tab-width 4)
(setq-default show-trailing-whitespace t)
(setq x-select-enable-clipboard t)

(add-to-list 'auto-mode-alist '("\\.bash$" . shell-script-mode))
(add-to-list 'auto-mode-alist '("\\.gitconfig$" . conf-mode))

