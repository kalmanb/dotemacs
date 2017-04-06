;; Kal's core config

;; Turn off syntax highlighting
(global-font-lock-mode 0)

(setq evil-escape-key-sequence "ii")
(setq evil-escape-delay 0.5)

;; setq-efault means for all buffers
(setq-default tab-width 2)
(setq-default evil-shift-width 2)
(setq css-indent-offset 2)
(setq standard-indent 2)

;; Refresh files - esp after scalariform
(global-auto-revert-mode 1)
(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-verbose nil)
(setq auto-revert-interval 0.1)

;; Temporarily stop creating lock files - throws webpack out
(setq create-lockfiles nil)
