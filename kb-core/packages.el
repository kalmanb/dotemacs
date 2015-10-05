;;; packages.el --- kb-core Layer packages File for Spacemacs
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

(defvar kb-core-packages
  '(
    ;; package kb-cores go here
    helm
    company
    dash
    s
    ff
    )
  "List of all packages to install and/or initialize. Built-in packages
which require an initialization must be listed explicitly in the list.")

(defvar kb-core-excluded-packages '()
  "List of packages to exclude.")

;; For each package, define a function kb-core/init-<package-kb-core>
;;
;; (defun kb-core/init-my-package ()
;;   "Initialize my package"
;;   )
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package

(eval-when-compile
  (require 'use-package nil t)
  (require 's nil t)
  (require 'dash nil t)
  (require 'ff nil t)
  )

(defun kb-core/post-init-helm ()
  ;; Back buffer
  (use-package helm 
    :config
    (evil-leader/set-key "SPC" 'spacemacs/alternate-buffer)))

(defun kb-core/post-init-company ()
  "Initialize my package"
  (use-package company
    :config
    (setq company-minimum-prefix-length 3)
    (global-company-mode)))

(defun cb-core/init-dash ()
  (use-package dash
    :config (require 'dash)))

(defun cb-core/init-s ()
  (use-package s
    :config (require 's)))

(defun cb-core/init-f ()
  (use-package ff
    :config (require 'ff)))
