(add-to-list 'load-path "~/.emacs.d")

;; el-get
;; see https://github.com/dimitri/emacs-kicker/blob/master/init.el

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil t)
  (url-retrieve
   "https://github.com/dimitri/el-get/raw/master/el-get-install.el"
   (lambda (s)
     (end-of-buffer)
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
    deft
    emacs-dirtree
    flycheck
    jedi
    nose
    virtualenv
    yaml-mode
    color-theme
    monokai-theme
    solarized-theme
   ))  

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
(load-library "setup-org-mode")

