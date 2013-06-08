;; full screen
(defun fullscreen ()
  (interactive)
  (set-frame-parameter nil 'fullscreen
(if (frame-parameter nil 'fullscreen) nil 'fullboth)))
(global-set-key [f11] 'fullscreen)

;; set frame width
(defun set-frame-width-interactive (arg)
   (interactive "p")
   (set-frame-width (selected-frame) arg))

(setq inhibit-splash-screen t)    ; no splash screen, thanks
(line-number-mode 1)              ; have line numbers and
(column-number-mode 1)            ; column numbers in the mode line

(tool-bar-mode -1)                ; no tool bar with icons
(scroll-bar-mode -1)              ; no scroll bars
(menu-bar-mode 1)                 ; keep the menu bar

;; Navigate windows with M-<arrows>
(windmove-default-keybindings 'meta)
(setq windmove-wrap-around t)

;; (set-face-font 'default "Monospace-10")

;; Save desktip layout on exit
(require 'desktop)
(desktop-save-mode 1)

(defun my-desktop-save ()
  (interactive)
  ;; Don't call desktop-save-in-desktop-dir, as it prints a message.
  (if (eq (desktop-owner) (emacs-pid))
      (desktop-save desktop-dirname)))

(add-hook 'auto-save-hook 'my-desktop-save)

