;;; init.el --- Stuart's Emacs Setup -*- lexical-binding: t; -*-

;;; Commentary:
;;; Stuart's Emacs Setup
;;; Copyright (c) 2013-2026 Stuart MacKay
;;;
;;; Author: Stuart MacKay <smackay@flagstonesoftware.com>
;;; URL: https://github.com/StuartMacKay/emacs.d
;;; Created: 2013-06-08
;;; Keywords: emacs setup org-mode
;;; Licence: WTFPL, grab your copy here: http://sam.zoy.org/wtfpl/
;;;
;;; This file is NOT part of GNU Emacs.
;;;
;;; Requires Emacs 29+.

;;; Code:

;;;; Packages

(require 'package)

(setq package-archives
      '(("gnu"    . "https://elpa.gnu.org/packages/")
        ("nongnu" . "https://elpa.nongnu.org/nongnu/")
        ("melpa"  . "https://melpa.org/packages/")))

(setq package-archive-priorities
      '(("gnu" . 3) ("nongnu" . 2) ("melpa" . 1)))

(package-initialize)

(require 'use-package)
(setq use-package-always-ensure t)

;;;; Customize

;; Keep Custom's output out of this file.
(setq custom-file (locate-user-emacs-file "custom.el"))
(load custom-file 'noerror)

;;;; Emacs

(use-package emacs
  :ensure nil
  :custom
  (inhibit-splash-screen t)
  (initial-scratch-message nil)
  (initial-major-mode 'org-mode)
  (indent-tabs-mode nil)
  (tab-width 4)
  (show-trailing-whitespace t)
  (x-select-enable-clipboard t)
  :init
  (menu-bar-mode 1)
  (line-number-mode 1)
  (column-number-mode 1)
  (electric-pair-mode 1)
  (savehist-mode 1)
  (recentf-mode 1)
  (save-place-mode 1)
  (fido-vertical-mode 1)
  (add-hook 'before-save-hook 'delete-trailing-whitespace)
  (add-to-list 'auto-mode-alist '("\\.bash\\'" . shell-script-mode))
  (add-to-list 'auto-mode-alist '("\\.gitconfig\\'" . conf-mode))
  :bind
  ("C-x M-t" . cleanup-region)
  ("C-c n"   . cleanup-buffer))

;;;; Utilities

(defun untabify-buffer ()
  "Untabify the whole buffer."
  (interactive)
  (untabify (point-min) (point-max)))

(defun indent-buffer ()
  "Indent the whole buffer."
  (interactive)
  (indent-region (point-min) (point-max)))

(defun cleanup-buffer ()
  "Perform a bunch of operations on the whitespace content of a buffer."
  (interactive)
  (indent-buffer)
  (untabify-buffer)
  (delete-trailing-whitespace))

(defun cleanup-region (beg end)
  "Remove tmux artifacts from region between BEG and END."
  (interactive "r")
  (dolist (re '("\\\\│\·*\n" "\W*│\·*"))
    (replace-regexp re "" nil beg end)))

;;;; Themes

(use-package modus-themes
  :ensure nil
  :custom
  (modus-themes-bold-constructs t)
  (modus-themes-italic-constructs t)
  :init
  (load-theme 'modus-vivendi t)
  :bind
  ("<f5>" . modus-themes-toggle)
  :hook
  (shell-mode . ansi-color-for-comint-mode-on))

;;;; Text mode

(add-hook 'text-mode-hook #'turn-on-auto-fill)

;;;; Spell checker

(use-package ispell
  :ensure nil
  :custom
  (ispell-program-name (if (eq system-type 'darwin)
                           "/usr/local/bin/aspell"
                         "/usr/bin/aspell"))
  (ispell-list-command "list")
  (flyspell-issue-welcome-flag nil))

;;;; Org mode

(defun remove-empty-drawer-on-clock-out ()
  "Remove empty LOGBOOK drawers on clock out."
  (interactive)
  (save-excursion
    (beginning-of-line 0)
    (org-remove-empty-drawer-at "LOGBOOK" (point))))

(defun verify-refile-target ()
  "Exclude todo keywords with a done state from refile targets."
  (not (member (nth 2 (org-heading-components)) org-done-keywords)))

(use-package org
  :ensure nil
  :bind
  (("C-c l" . org-store-link)
   ("C-c c" . org-capture)
   ("C-c a" . org-agenda))
  :custom
  (org-startup-indented t)
  (org-todo-keywords '((sequence "TODO(t)" "STARTED(s)" "WAITING(w@)"
                                  "|" "DONE(d)" "CANCELLED(c@)")))
  (org-todo-keyword-faces '(("TODO" . "orange")
                            ("DOING" . "yellow")
                            ("BLOCKED" . "red")
                            ("DONE" . "blue")
                            ("ARCHIVED" . "blue")))
  (org-directory "~/Documents/Tasks")
  (org-default-notes-file "~/Documents/Tasks/todo.org")
  (org-capture-templates
   '(("i" "Idea" entry
      (file+headline "~/Documents/Tasks/todo.org" "Inbox")
      "** IDEA %?")
     ("n" "Notes" entry
      (file+headline "~/Documents/Tasks/todo.org" "Inbox")
      "** %?")
     ("t" "Task" entry
      (file+headline "~/Documents/Tasks/todo.org" "Inbox")
      "** TODO %?")
     ("j" "Journal" entry
      (file+datetree "~/Documents/Tasks/journal.org")
      "**** %U %?" :tree-type week)))
  (org-refile-targets '((nil :maxlevel . 3)
                        (org-agenda-files :maxlevel . 3)))
  (org-refile-allow-creating-parent-nodes 'confirm)
  (org-refile-target-verify-function 'verify-refile-target)
  (org-indirect-buffer-display 'current-window)
  (org-log-done 'time)
  (org-agenda-include-diary t)
  (org-agenda-include-all-todo t)
  (org-agenda-files '("~/Documents/Tasks/todo.org"))
  :init
  (with-eval-after-load 'org-faces
    (dolist (face '(org-document-title
                    org-level-1
                    org-level-2
                    org-level-3))
      (set-face-attribute face nil :height 1.0)))
  :hook
  ((org-clock-out . remove-empty-drawer-on-clock-out)
   (org-mode . flyspell-mode)))

(use-package org-modern
  :hook (org-mode . org-modern-mode))

;;;; Beancount

(use-package beancount
  :mode ("\\.beancount\\'" . beancount-mode)
  :hook (beancount-mode . outline-minor-mode)
  :bind
  (:map beancount-mode-map
        ("C-c C-n" . outline-next-visible-heading)
        ("C-c C-p" . outline-previous-visible-heading)
        ("C-c C-u" . outline-up-heading)))

;;;; Version control

(use-package magit)

(use-package diff-hl
  :init
  (global-diff-hl-mode 1)
  :hook
  (magit-post-refresh . diff-hl-magit-post-refresh))

;;;; Directory browser

(use-package direx
  :bind ("C-c C-j" . direx:jump-to-directory))

;;; init.el ends here
