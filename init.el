;;; package -- Summary:
;;;
;;; Stuart's Emacs Setup
;;; Copyright (c) 2013-2025 Stuart MacKay
;;;
;;; Author: Stuart MacKay <smackay@flagstonesoftware.com>
;;; URL: https://github.com/StuartMacKay/emacs.d
;;; Created: 2013-06-08
;;; Keywords: emacs setup org-mode
;;; Licence: WTFPL, grab your copy here: http://sam.zoy.org/wtfpl/
;;;
;;; This file is NOT part of GNU Emacs.
;;;
;;; The setup steals things from various authors and only works
;;; with Emacs 24+.
;;;
;;; Sources:
;;;   http://aaronbedra.com/emacs.d/

;;; Packages

(require 'package)
(package-initialize)

(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)

;; load locally stored packages


(add-to-list 'load-path "~/.emacs.d/packages")


;; setup

(add-to-list 'load-path "~/.emacs.d/setup")

(load "setup-emacs")
(load "setup-themes")
(load "setup-modes")
(load "setup-spellchecker")
(load "setup-org-mode")
(load "setup-text-mode")
(load "setup-utilities")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(direx use-package monokai-theme magit flycheck)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
