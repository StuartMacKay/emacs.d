;;; early-init.el --- Early startup config -*- lexical-binding: t; -*-

;;; Commentary:
;;; Stuart's Emacs Setup
;;; Copyright (c) 2013-2026 Stuart MacKay
;;; URL: https://github.com/StuartMacKay/emacs.d

;;; Code:

;; Speed up startup, restore afterwards.
(setq gc-cons-threshold most-positive-fixnum)
(add-hook 'emacs-startup-hook
          (lambda ()
            (setq gc-cons-threshold (* 16 1024 1024))))

;; Package.el is initialised explicitly in init.el, after archives
;; are configured, so priorities are respected.
(setq package-enable-at-startup nil)

;; Avoid the frame flashing with UI elements before init.el disables them.
(push '(tool-bar-lines . 0) default-frame-alist)
(push '(vertical-scroll-bars) default-frame-alist)
(setq frame-inhibit-implied-resize t)
(setq inhibit-startup-screen t)

(provide 'early-init)
;;; early-init.el ends here
