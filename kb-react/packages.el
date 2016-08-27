;;; packages.el --- kb-react Layer packages File for Spacemacs
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
(setq kb-react-packages
    '(
      ;; package names go here
      jsx-mode
      web-mode
      ))

;; List of packages to exclude.
(setq kb-react-excluded-packages '())

;; For each package, define a function kb-react/init-<package-name>
;;
;; (defun kb-react/init-my-package ()
;;   "Initialize my package"
;;   )
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package

(defun kb-react/init-jsx-mode ()
  "Initialize my package"
  (add-to-list 'auto-mode-alist '("\\.jsx\\'" . jsx-mode))
  (setq jsx-indent-level 2))

(defun kb-react/post-init-web-mode ()
  "Initialize my package"
  (add-to-list 'auto-mode-alist '("\\.js\\'" . react-mode)))

