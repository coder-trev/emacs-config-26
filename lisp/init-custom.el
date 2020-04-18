;;; init-custom.el --- Load custom functionality

;;

;;; Commentary:

;;

;;; Code:

(use-package init-lisp
  :load-path "lisp")

(use-package buffer
  :load-path "lisp"
  :bind (("C-c D" . delete-file-and-bufer)
	 ("C-c R" . rename-file-and-buffer)
	 ("C-;" . toggle-comment-on-line)))

(use-package window
  :load-path "lisp"
  :bind (("C-c t" . transpose-windows)
	 ("C-x C-p" . other-window-backward)))

(message "init-custom")
(provide 'init-custom)

;;; init-custom.el ends here
