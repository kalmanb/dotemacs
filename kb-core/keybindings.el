;;(require 'helm)

;; Reassign M-x to C-Spc and S-Spc
(bind-key* "S-SPC" 'helm-M-x)
(global-unset-key (kbd "C-@"))
(bind-key* "C-SPC" 'helm-M-x)
(bind-key* "M-x" 'helm-M-x)

;; Bring up helm
(evil-global-set-key 'normal (kbd ";g") 'helm-for-files)
(evil-global-set-key 'normal (kbd ";t") 'helm-projectile-find-file)

;; Movement
(dolist (mode '(normal visual))
  (evil-global-set-key mode (kbd "n") 'evil-next-line)
  (evil-global-set-key mode (kbd "e") 'evil-previous-line)
  (evil-global-set-key mode (kbd "i") 'evil-forward-char)
  (evil-global-set-key mode (kbd "h") 'evil-backward-char))

;; Insert Mode
(evil-global-set-key 'normal (kbd "l") 'evil-insert-state)

;; Search remapping
(evil-global-set-key 'normal "j" 'evil-search-next)


;; Close current buffer
(evil-global-set-key 'normal (kbd ";bd") (lambda()
                                             (interactive)
                                             (kill-buffer (current-buffer))))


(setq helm-ag-insert-at-point 'symbol)  ;; Needed for search word under cursor
;; Needed for search word under cursor to work - need to define these bad boys
(setq grep-find-ignored-files nil
            grep-find-ignored-directories nil)
(evil-global-set-key 'normal (kbd ";vv") 'helm-projectile-ag)

;; Commenting
;; Usually Spc-c-l
(evil-global-set-key 'normal (kbd "; c SPC") 'evilnc-comment-or-uncomment-lines)
(evil-global-set-key 'visual (kbd "; c SPC") 'evilnc-comment-or-uncomment-lines)


;; Temp - meta pp
;; (evil-leader/set-key "pp" 'projectile-switch-project)


;; Moving between windows in emacs
(evil-leader/set-key 
  "wn" 'evil-window-down
  "we" 'evil-window-up
  "wh" 'evil-window-left
  "wi" 'evil-window-right)


;; tmux bindings
(bind-key* "C-a" nil)
(bind-key* "C-a n" 'evil-window-down)
(bind-key* "C-a e" 'evil-window-up)
(bind-key* "C-a h" 'evil-window-left)
(bind-key* "C-a i" 'evil-window-right)

(bind-key* "C-a |" 'split-window-horizontally-and-switch)
(bind-key* "C-a \\" 'split-window-horizontally-and-switch)
(bind-key* "C-a -" 'split-window-vertically-and-switch)

;; Font size
(define-key global-map (kbd "M-+") 'text-scale-increase)
(define-key global-map (kbd "M--") 'text-scale-decrease)

