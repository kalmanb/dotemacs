;;; packages.el --- kb-scala Layer packages File for Spacemacs
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

(defconst kb-scala-packages
  '(
    ;; f
    ;request
    ensime

    scala-errors

    ;; Load local packages
    ;; (scala-errors :location local)
    (scalariform :location local))
  "List of all packages to install and/or initialize. Built-in packages
which require an initialization must be listed explicitly in the list.")

(defvar kb-scala-excluded-packages '()
  "List of packages to exclude.")

;; For each package, define a function kb-scala/init-<package-kb-scala>
;;
;; (defun kb-scala/init-my-package ()
;;   "Initialize my package"
;;   )
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package

;; (defun kb-scala/init-f ()
;;   (use-package f)
;;   )

;(defun kb-scala/init-request ()
  ;(use-package request)
  ;)

(defun kb-scala/post-init-ensime ()
  (setq ensime-tooltip-hints nil)
  (setq ensime-tooltip-type-hints nil)
  (add-hook 'ensime-mode-hook (lambda () (eldoc-mode -1)))
  )

;; Local Packages

(defun kb-scala/init-scala-errors ()
  (add-hook 'scala-mode-hook #'scala-errors-init)
  (add-hook 'scala-mode-hook #'scala-errors-spacemacs-init))

(defun kb-scala/init-scalariform ()
  (with-eval-after-load 'scala-mode2
    (use-package scalariform)))

