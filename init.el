;;; init.el --- Main Emacs initialization file

;;

;;; Commentary:

;;

;;; Code:

(when (< emacs-major-version 26)
  (error "Only works with Emacs 26 and newer"))

(require 'package)

(add-to-list 'package-archives
	     '("melpa-stable" . "https://stable.melpa.org/packages/"))
	     ;;'("melpa" . "https://melpa.org/packages"))

(package-initialize)

;; bootstrap use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; define packages
(require 'use-package)

;; always download if unavailable
(setq use-package-always-ensure t)

(use-package init-emacs
  :load-path "lisp")

(use-package init-melpa-packages
  :load-path "lisp")

(use-package init-custom
  :load-path "lisp")

;;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ido-auto-merge-work-directories-length -1)
 '(ido-enable-flex-matching t)
 '(ido-use-virtual-buffers t)
 '(package-selected-packages (quote (flycheck use-package)))
 '(python-shell-interpreter "python3")
 '(recentf-max-menu-items 40 t)
 '(recentf-save-file "/home/skeltont/.emacs.d/.recentf" t)
 '(save-place-file "/home/skeltont/.emacs.d/saveplace")
 '(uniquify-buffer-name-style (quote forward) nil (uniquify)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
