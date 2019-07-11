;;; Ido for minibuffer completion

(setq ido-save-directory-list-file (expand-file-name ".ido-last" user-emacs-directory))
(setq ido-enable-flex-matching t)
(setq ido-use-filename-at-point 'guess)
(setq ido-create-new-buffer 'always)
(setq ido-show-dot-for-dired t)

(ido-mode t)

(global-set-key (kbd "C-x C-b") 'ido-switch-buffer)
(global-set-key (kbd "C-x B") 'ibuffer)
