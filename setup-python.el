(require 'nose)

(require 'autopair)
(autopair-global-mode)

(require 'virtualenv)

(add-hook 'after-init-hook #'global-flycheck-mode)

(add-hook 'python-mode-hook 'auto-complete-mode)
(add-hook 'python-mode-hook 'jedi:setup)
(add-hook 'python-mode-hook 'linum-mode)

