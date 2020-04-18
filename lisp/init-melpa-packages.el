;;; init-melpa-packages --- Install and configure Melpa packages

;;

;;; Commentary:

;;

;;; Code:

(use-package monokai-theme
  :config (load-theme 'monokai t))

(use-package flycheck
  :config (global-flycheck-mode t))

(use-package rainbow-delimiters)

(use-package fringe-helper)

(use-package git-gutter-fringe
  :config (global-git-gutter-mode t))

(use-package magit
  :bind (("C-x g" . magit-status)))

(use-package multiple-cursors
  :init
  (add-hook 'after-init-hook (lambda ()
			       (multiple-cursors-mode)
			       (define-key mc/keymap (kbd "<return>") nil)))

  :bind (("C->" . mc/mark-next-like-this)
	 ("C-<" . mc/mark-previous-like-this)
	 ("C-c C-<" . mc/mark-all-like-this)
	 ("C-S-<mouse-1>" . mc/add-cursor-on-click)))

(message "init-mepla-packages")
(provide 'init-melpa-packages)

;;; init-melpa-packages.el ends here
