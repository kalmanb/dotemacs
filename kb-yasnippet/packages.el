;;; packages.el --- kb-yasnippet Layer packages File for Spacemacs
;;
;; Copyright (c) 2012-2014 Sylvain Benner
;; Copyright (c) 2014-2015 Sylvain Benner & Contributors
;;
;; Author: Sylvain Benner <sylvain.benner@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;; List of all packages to install and/or initialize. Built-in packages
;; which require an initialization must be listed explicitly in the list.
(setq kb-yasnippet-packages
    '(
      yasnippet
      ))

;; List of packages to exclude.
(setq kb-yasnippet-excluded-packages '())

;; For each package, define a function kb-yasnippet/init-<package-name>
;;
;; (defun kb-yasnippet/init-my-package ()
;;   "Initialize my package"
;;   )
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package

(defun kb-yasnippet/post-init-yasnippet ()
  (setq yas-snippet-dirs (list (f-join user-layers-directory "snippets")))

  ;; Use TAB completion
  (evil-global-set-key 'insert (kbd "TAB") 'yas-expand-from-trigger-key)

  (with-eval-after-load 'yasnippet
    (bind-key "<backspace>" 'yas/backspace yas-keymap)
    (evil-define-key 'insert yas-keymap (kbd "SPC") 'yas/space))

  (spacemacs/declare-prefix "Y" "yasnippet")
  (evil-leader/set-key "Yf" 'yas-visit-snippet-file) ;; Edit snippet
  (evil-leader/set-key "Yn" 'yas-new-snippet)
  (evil-leader/set-key "Yy" 'yas-insert-snippet)
  (evil-leader/set-key "Yr" 'yas-reload-all)

  ;; Could be put into funcs.el
  (defun yas/current-field ()
    "Return the current active field."
    (and (boundp 'yas--active-field-overlay)
         yas--active-field-overlay
         (overlay-buffer yas--active-field-overlay)
         (overlay-get yas--active-field-overlay 'yas--field)))

  (defun yas/beginning-of-field ()
    (-when-let (field (yas/current-field))
      (marker-position (yas--field-start field))))

  (defun yas/end-of-field ()
    (-when-let (field (yas/current-field))
      (marker-position (yas--field-end field))))

  (defun yas/current-field-text ()
    "Return the text in the active snippet field."
    (-when-let (field (yas/current-field))
      (yas--field-text-for-display field)))

  (defun yas/clear-blank-field ()
    "Clear the current field if it is blank."
    (-when-let* ((beg (yas/beginning-of-field))
                 (end (yas/end-of-field))
                 (str (yas/current-field-text)))
      (when (s-matches? (rx bos (+ space) eos) str)
        (delete-region beg end)
        t)))

  (defun yas/maybe-goto-field-end ()
    "Move to the end of the current field if it has been modified."
    (-when-let (field (yas/current-field))
      (when (and (yas--field-modified-p field)
                 (yas--field-contains-point-p field))
              (goto-char (yas/end-of-field)))))

  (defun yas/space ()
    "Clear and skip this field if it is unmodified. Otherwise insert a space."
    (interactive "*")
    (let ((field (yas/current-field)))
      (cond ((and field
                  (not (yas--field-modified-p field))
                  (eq (point) (marker-position (yas--field-start field))))
             (yas--skip-and-clear field)
             (yas-next-field 1))
            (t
             (insert " ")))))

  (defun yas/backspace ()
      "Clear the current field if the current snippet is unmodified.
Otherwise delete backwards."
      (interactive "*")
      (let ((field (yas/current-field)))
        (cond ((and field
                    (not (yas--field-modified-p field))
                    (eq (point) (marker-position (yas--field-start field))))
               (yas--skip-and-clear field)
               (yas-next-field 1))
              ((and (boundp 'smartparens-mode) smartparens-mode)
               (call-interactively 'sp-backward-delete-char))
              (t
                          (call-interactively 'backward-delete-char)))))


  ;; Advise editing commands.
  ;;
  ;; Pressing SPC in an unmodified field will clear it and switch to the next.
  ;;
  ;; Pressing S-TAB to go to last field will place point at the end of the field.
  (defadvice yas-next-field (before clear-blank-field activate)
    (yas/clear-blank-field))

  (defadvice yas-prev-field (before clear-blank-field activate)
    (yas/clear-blank-field))

  (defadvice yas-next-field (after goto-field-end activate)
    (yas/maybe-goto-field-end)
    (evil-insert-state))

  (defadvice yas-prev-field (after goto-field-end activate)
    (yas/maybe-goto-field-end)
        (evil-insert-state))
  )
