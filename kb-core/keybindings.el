(require 'helm)

;; Bring up helm
(bind-key "S-SPC" 'helm-for-files)
(evil-global-set-key 'normal (kbd "; t") 'helm-for-files)

;; Movement
(evil-global-set-key 'normal (kbd "n") 'evil-next-line)
(evil-global-set-key 'normal (kbd "e") 'evil-previous-line)
(evil-global-set-key 'normal (kbd "i") 'evil-forward-char)
(evil-global-set-key 'normal (kbd "h") 'evil-backward-char)

;; Insert Mode
(evil-global-set-key 'normal (kbd "l") 'evil-insert-state)

;; Search remapping
(evil-global-set-key 'normal "j" 'evil-search-next)

;; Back buffer
(evil-leader/set-key "SPC" 'spacemacs/alternate-buffer)

;; Close current buffer
(evil-global-set-key 'normal (kbd ";bd") (lambda()
                                             (interactive)
                                             (kill-buffer (current-buffer))))

;; AG
(evil-global-set-key 'normal (kbd ";vv") 'helm-projectile-ag)

