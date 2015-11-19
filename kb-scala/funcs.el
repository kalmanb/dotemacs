
(defun new-file ()
  (interactive)
  (print "hello")
  ;; (message (buffer-file-name))
  (message "%S" (get-package-dir))
  )

(defun get-package-dir ()
  "Gets the current package name from /src/main/<name> or /app/<name>"
  (let ((splits (split-string buffer-file-name "/src/main/scala/")))
    (if (= (length splits) 2)
        ;; Now get everything but the filename
        ((setq name (nth 1 splits))
        (message "$S" (split-string name "/"))
        (butlast (split-string name "/")))
      "/"
      )
    )
  )


;; (eval-after-load 'evil-leader
;;   '(progn
;;      (evil-leader/set-key-for-mode 'scala-mode "" 'scala-errors-show-errors)
;;      (evil-leader/set-key-for-mode 'scala-mode "mfp" 'scala-errors-goto-prev-error)))



;; (provide 'scala-errors)
