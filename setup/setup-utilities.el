;;; Utilities - useful functions

(defun json-format ()
  ;; Format the json data displayed in a buffer.
  (interactive)
  (save-excursion
    (shell-command-on-region (mark) (point) "python -m json.tool" (buffer-name) t)))
