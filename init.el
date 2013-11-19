;; Stuart's Emacs Setup
;; Copyright (C) 2013 Stuart MacKay
;;
;; Author: Stuart MacKay <smackay@flagstonesoftware.com>
;; URL: https://github.com/StuartMacKay/emacs.d
;; Created: 2013-06-08
;; Keywords: emacs setup python django
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

(add-to-list 'load-path "~/.emacs.d")

;; el-get

(require 'cl)	; common lisp goodies, loop

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

;; make sure everything comes over https
(setq el-get-github-default-url-type "https")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (let (el-get-master-branch)
      (goto-char (point-max))
      (eval-print-last-sexp))))

;; set local recipes
(setq
  el-get-sources
  '((:name buffer-move    ; have to add your own keys
           :after (progn
                    (global-set-key (kbd "<C-S-up>") 'buf-move-up)
                    (global-set-key (kbd "<C-S-down>") 'buf-move-down)
                    (global-set-key (kbd "<C-S-left>") 'buf-move-left)
                    (global-set-key (kbd "<C-S-right>") 'buf-move-right)))

    (:name smex    ; a better (ido like) M-x
           :after (progn
                    (setq smex-save-file "~/.emacs.d/.smex-items")
                    (global-set-key (kbd "M-x") 'smex)
                    (global-set-key (kbd "M-X") 'smex-major-mode-commands)))

    (:name goto-last-change    ; move pointer back to last change
          :after (progn
                   ;; when using AZERTY keyboard, consider C-x C-_
                   (global-set-key (kbd "C-x C-/") 'goto-last-change)))))

;; now set our own packages
(setq
  my:el-get-packages
  '(el-get               ; el-get is self-hosting
    autopair
    emacs-dirtree
    flycheck
    jedi
    pymacs
    rope
    ropemacs
    ropemode
    virtualenv
    yaml-mode
    web-mode))  

(setq my:el-get-packages
      (append
       my:el-get-packages
       (loop for src in el-get-sources collect (el-get-source-name src))))

;; install new packages and init already installed packages
(el-get 'sync my:el-get-packages)

(load-library "setup-window")
(load-library "setup-keyboard")
(load-library "setup-ido")
(load-library "setup-python")
(load-library "setup-django")
(load-library "setup-org-mode")
