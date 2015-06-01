;;; packages.el --- kb-gtags Layer packages File for Spacemacs
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

(defvar kb-gtags-packages
  '(
    ;; package kb-gtagss go here
    ;; gtags
    helm-gtags
    )
  "List of all packages to install and/or initialize. Built-in packages
which require an initialization must be listed explicitly in the list.")

(defvar kb-gtags-excluded-packages '()
  "List of packages to exclude.")

;; For each package, define a function kb-gtags/init-<package-kb-gtags>
;;
;; (defun kb-gtags/init-my-package ()
;;   "Initialize my package"
;;   )
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package

;; (defun kb-gtags/init-gtags ()
;;   (use-package gtags))

(defun kb-gtags/init-helm-gtags ()
  (use-package helm-gtags))
