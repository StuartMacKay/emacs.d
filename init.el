;;Library Paths

(add-to-list 'load-path "~/.emacs.d")
(progn (cd "~/.emacs.d") (normal-top-level-add-subdirs-to-load-path))

;; Libraries to autoload

(require 'dired-single)
(require 'linum)

(load-library "keyboard-shortcuts")

(load-library "setup-dirtree")
(load-library "setup-org-mode")
(load-library "setup-python")
(load-library "setup-subversion")
(load-library "setup-yaml")

;; Calendar settings

(setq calendar-longitude -9.15)
(setq calendar-latitude 38.73)
(setq calendar-location-name "Lisbon, PT")

;; Base text mode and other configuration

(setq default-major-mode 'text-mode)
(line-number-mode t)
(column-number-mode t)
(setq-default fill-column 72)
(setq-default indent-tabs-mode nil)
(setq auto-fill-mode 1)
(setq x-select-enable-clipboard t)

;; Turn off UI extras

(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
;;(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(current-language-environment "UTF-8")
 '(org-agenda-files (quote ("~/Dropbox/Tasks/tasks.org")))
 '(tool-bar-mode nil))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

;; ======== IBuffer ========
(global-set-key (kbd "C-x C-b") 'ibuffer)

    
;; ======== Deft ========

(require 'deft)
(setq deft-directory "~/Dropbox/notes/")
