;;; init-lisp.el --- Setup emacs-lisp-mode

;;

;;; Commentary:

;;

;;; Code:

(dolist (hook '(emacs-lisp-mode-hook
		lisp-interaction-mode-hook
		ielm-mode-hook
		lisp-mode-hook))
  (dolist (mode '(rainbow-delimiters-mode
		  turn-on-eldoc-mode))
    (add-hook hook mode)))

(defun check-parens-after-save ()
  "Run 'check-parens'."
  (when (equal major-mode 'emacs-lisp-mode)
    (check-parens)))

(add-hook 'after-save-hook #'check-parens-after-save)

(message "config lisp")
(provide 'init-lisp)

;;; init-lisp.el ends here
