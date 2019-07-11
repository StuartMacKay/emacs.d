;;; package -- Summary:
;;;
;;; Stuart's Emacs Setup
;;; Copyright (c) 2013-2017 Stuart MacKay
;;;
;;; Author: Stuart MacKay <smackay@flagstonesoftware.com>
;;; URL: https://github.com/StuartMacKay/emacs.d
;;; Created: 2013-06-08
;;; Keywords: emacs setup python django org-mode
;;; Licence: WTFPL, grab your copy here: http://sam.zoy.org/wtfpl/
;;;
;;; This file is NOT part of GNU Emacs.
;;;
;;; The setup steals things from various authors and only works
;;; with Emacs 24+.
;;;
;;; Sources:
;;;   http://aaronbedra.com/emacs.d/

(require 'cl)

;;; Packages

(require 'package)
(package-initialize)

(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)

(defvar mypackages '(ac-slime
                     auto-complete
                     autopair
                     elpy
                     flycheck
                     js2-mode
                     json-mode
                     magit
                     markdown-mode
                     monokai-theme
                     org
                     py-autopep8
                     slime
                     smex
                     web-mode
                     writegood-mode
                     yaml-mode)
  "Default packages")

(defun mypackages-installed-p ()
  (loop for pkg in mypackages
        when (not (package-installed-p pkg)) do (return nil)
        finally (return t)))

(unless (mypackages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg mypackages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))


;; setup

(add-to-list 'load-path "~/.emacs.d/setup")

(load "setup-emacs")
(load "setup-ido")
(load "setup-smex")
(load "setup-themes")
(load "setup-modes")
(load "setup-spellchecker")
(load "setup-javascript-mode")
(load "setup-markdown-mode")
(load "setup-org-mode")
(load "setup-python-mode")
(load "setup-text-mode")
(load "setup-web-mode")
(load "setup-utilities")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
