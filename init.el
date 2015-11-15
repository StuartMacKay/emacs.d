;; Stuart's Emacs Setup
;; Copyright (c) 2013-2015 Stuart MacKay
;;
;; Author: Stuart MacKay <smackay@flagstonesoftware.com>
;; URL: https://github.com/StuartMacKay/emacs.d
;; Created: 2013-06-08
;; Keywords: emacs setup python django org-mode
;; Licence: WTFPL, grab your copy here: http://sam.zoy.org/wtfpl/
;;
;; This file is NOT part of GNU Emacs.
;;
;; The setup steals things from various "Emacs as a Python IDE" articles
;; and is intended to work with Emacs 24.
;;
;; Sources:
;;   https://github.com/dimitri/emacs-kicker/blob/master/init.el
;;   http://caisah.info/emacs-for-python/
;;
;; Commentary:
;; My original setup was based on Gabriel Lanaro's awesomely excellent
;; emacs for python, https://github.com/gabrielelanaro/emacs-for-python.
;; The idea was to create a cross platform install that could be used on
;; my desktop (Ubuntu) and eeepc (Ubuntu/XP) first using Dropbox and then
;; Github. However keeping it up to date while still allowing customizations
;; to cover various installation quirks for each platform proved messy. The
;; discovery of el-get in particular the ability to bootstrap itself solved
;; a lot of these issues.

;; el-get
;;
;; the install script fails when run on windows xp so paste it into the
;; scratch buffer and evualate it there.

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(setq el-get-github-default-url-type "https")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
(el-get 'sync)

;; Now set our own packages
(setq my-packages
  '(el-get
    autopair
    jedi
    pymacs
    rope
    ropemacs
    ropemode
    yaml-mode
    web-mode))

(el-get 'sync my-packages)

;; add MELPA after el-get to avoid warnings when downloaded packages
;; are available from both repositories.

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

;; setup

(add-to-list 'load-path "~/.emacs.d/setup")

(load "setup-window")
(load "setup-keyboard")
(load "setup-text-mode")
(load "setup-ido")
(load "setup-python")
(load "setup-django")
(load "setup-org-mode")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (flycheck))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
