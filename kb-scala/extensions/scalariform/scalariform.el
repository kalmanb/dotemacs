;; (use-package request :commands request :ensure request)

(require 'request)

;; location of the scalariform config file
(setq scalariform-preferences-file "/home/kalmanb/work/dev-tools/eclipse/scala-formatter.properties")


;; Call daemon for formatting
(defun scalariform-daemon-format-file ()
  (interactive)
  (when (and (boundp 'scalariform-preferences-file)
             scalariform-preferences-file)
    (request
     "http://127.0.0.1:5474/format"
     :params `((fileName . ,buffer-file-name)
               (preferencesFile . ,scalariform-preferences-file)))))

;; Start server
(defun start-scalariform-daemon ()
  (interactive)
  (let ((buf-name "*scalariform-daemon*")
        (default-directory (expand-file-name "~/work/scalariform-daemon/")))
    (if (get-buffer buf-name)
        (with-current-buffer buf-name (recompile))
      (compile "java -jar ./target/scala-2.11/scalariform-daemon.jar")
      (with-current-buffer "*compilation*" (rename-buffer buf-name)))))

(eval-after-load 'evil-leader
  '(progn
     (evil-leader/set-key-for-mode 'scala-mode "mkb" 'start-scalariform-daemon)
     (evil-leader/set-key-for-mode 'scala-mode "mkx" 'scalariform-daemon-format-file)))


(provide 'scalariform)
