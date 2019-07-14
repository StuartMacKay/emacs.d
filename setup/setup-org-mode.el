;;; Org mode

(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cb" 'org-iswitchb)

(setq org-startup-indented t)

(setq org-todo-keywords '("TODO(t)" "STARTED(s)" "WAITING(w@)" "|" "DONE(d)" "CANCELLED(c@)"))

;;;; Org Capture

(setq org-directory "~/Tasks")
(setq org-default-notes-file "~/Tasks/todo.org")

(global-set-key (kbd "\C-cc") 'org-capture)

(setq org-capture-templates (quote (
    ("i" "Idea" entry
         (file+headline "~/Tasks/todo.org" "Inbox")
         "** IDEA %?")

    ("n" "Notes" entry
         (file+headline "~/Tasks/todo.org" "Inbox")
         "** %?")

    ("t" "Task" entry
         (file+headline "~/Tasks/todo.org" "Inbox")
         "** TODO %?")

    ("j" "Journal" entry
         (file+datetree "~/Tasks/journal.org")
         "**** %U %?" :tree-type week)

    )))

;; Remove empty LOGBOOK drawers on clock out
(defun remove-empty-drawer-on-clock-out ()
  (interactive)
  (save-excursion
    (beginning-of-line 0)
    (org-remove-empty-drawer-at "LOGBOOK" (point))))

(add-hook 'org-clock-out-hook 'remove-empty-drawer-on-clock-out 'append)
(add-hook 'org-mode-hook
          (lambda ()
            (flyspell-mode)))

;;;; Org Refile

;; Targets include this file and any file contributing to the agenda - up to 3 levels deep
(setq org-refile-targets (quote ((nil :maxlevel . 3)
                                 (org-agenda-files :maxlevel . 3))))

;; Use full outline paths for refile targets - we file directly with IDO
(setq org-refile-use-outline-path t)

;; Targets complete directly with IDO
(setq org-outline-path-complete-in-steps nil)

;; Allow refile to create parent tasks with confirmation
(setq org-refile-allow-creating-parent-nodes (quote confirm))

;; Use IDO for both buffer and file completion and ido-everywhere to t
(setq org-completion-use-ido t)
(setq ido-everywhere t)
(setq ido-max-directory-size 100000)
(ido-mode (quote both))
;; Use the current window when visiting files and buffers with ido
(setq ido-default-file-method 'selected-window)
(setq ido-default-buffer-method 'selected-window)
;; Use the current window for indirect buffer display
(setq org-indirect-buffer-display 'current-window)

;; Exclude DONE state tasks from refile targets
(defun verify-refile-target ()
  "Exclude todo keywords with a done state from refile targets"
  (not (member (nth 2 (org-heading-components)) org-done-keywords)))

(setq org-refile-target-verify-function 'verify-refile-target)

;;;; Org Log

(setq org-log-done 'time)

;;;; Org Agenda

(global-set-key "\C-ca" 'org-agenda)

(setq org-agenda-include-diary t)
(setq org-agenda-include-all-todo t)
(setq org-agenda-files (quote ("~/Tasks")))
