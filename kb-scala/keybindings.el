
;; Scala quickfix
(evil-global-set-key 'normal (kbd ";ff") 'scala-errors-goto-first-error)
(evil-global-set-key 'normal (kbd ";fn") 'scala-errors-goto-next-error)
(evil-global-set-key 'normal (kbd ";fp") 'scala-errors-goto-prev-error)

(evil-global-set-key 'normal (kbd ";knf") 'new-file)
