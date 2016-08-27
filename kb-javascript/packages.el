;;; packages.el --- kb-javascript Layer packages File for Spacemacs
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
(setq kb-javascript-packages
    '(
      ;; package names go here
      ))

;; List of packages to exclude.
(setq kb-javascript-excluded-packages '())

;; For each package, define a function kb-javascript/init-<package-name>
;;
;; (defun kb-javascript/init-my-package ()
;;   "Initialize my package"
;;   )
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package

(setq js-indent-level 2)
(setq js2-basic-offset 2)
(setq css-indent-offset 2)
(setq web-mode-markup-indent-offset 2)
(setq web-mode-css-indent-offset 2)
(setq web-mode-code-indent-offset 2)
(setq web-mode-attr-indent-offset 2)

