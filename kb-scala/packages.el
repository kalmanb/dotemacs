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

(defvar kb-scala-packages
  '(
    f
    request
    )
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

(defun kb-scala/init-f ()
  (use-package f)
  )

(defun kb-scala/init-request ()
  (use-package request)
  )
