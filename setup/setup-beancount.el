;;; Beancount
;;; 
;;; Sources:
;;;   https://github.com/beancount/beancount-mode

(add-hook 'beancount-mode-hook #'outline-minor-mode)

(define-key beancount-mode-map (kbd "C-c C-n") #'outline-next-visible-heading)
(define-key beancount-mode-map (kbd "C-c C-p") #'outline-previous-visible-heading)
(define-key beancount-mode-map (kbd "C-c C-u") #'outline-up-heading)

