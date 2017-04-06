;;; packages.el --- kb-auto-completion Layer packages File for Spacemacs
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
(setq kb-auto-completion-packages
    '(
      ;; ggtags
      ))

;; List of packages to exclude.
(setq kb-auto-completion-excluded-packages '())

;; For each package, define a function kb-auto-completion/init-<package-name>
;;
;; (defun kb-auto-completion/init-my-package ()
;;   "Initialize my package"
;;   )
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package

;; (defun kb-auto-completion/init-ggtags ()
;;   (add-hook 'prog-mode-hook 'ggtags-mode))
