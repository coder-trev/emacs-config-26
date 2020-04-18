;;; init-emacs.el --- Emacs configuration

;;

;;; Commentary:

;;

;;; Code:

;;
;; Modes
;;

(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(blink-cursor-mode 0)
(global-display-line-numbers-mode t)

;;
;; Variables
;;

(setq-default
 ;; full path in title bar
 frame-title-format "%b (%f)")

(setq
 ;; Emacs initial size
 ;; initial-frame-alist '((top . 0) (left. 0) (width . 157) (height . 44))
 default-frame-alist '((fullscreen . maximized))

 ;; makes killing/yanking interact with the clipboard
 select-enable-clipboard t

 ;; I'm actually not sure what this does but it's recommended?
 select-enable-primary t

 ;; save clipboard strings into kill ring before replacing them.
 ;; When one selects something in another program to paste it into emacs,
 ;; but kills something in emacs before actuall pasting it,
 ;; this selection is gone unless this variable is non-nil
 save-interprogram-paste-before-kill t

 ;; shows all options when running apropos
 apropos-do-all t

 ;; mouse yank commands yank at point instead of at click
 mouse-yank-at-point t

 ;; go straight to scratch buffer on startup
 inhibit-startup-message t

 ;; no bell
 ring-bell-function 'ignore

 ;; enable smooth scrolling
 scroll-conservatively 10000

 ;; backup files
 backup-directory-alist `(("." . ,(expand-file-name "backups" user-emacs-directory)))
 auto-save-default nil

 ;; no need for '~' files while ediitng
 create-lockfiles nil)

;; increase font size for readability
(set-face-attribute 'default nil :height 120)

;;
;; Hooks
;;

;; prevent garbage collection while typing in minibuffer
(add-hook 'minibuffer-setup-hook (lambda ()
				   (setq gc-cons-threshold most-positive-fixnum)))

;; reset the garbage collection to default
(add-hook 'minibuffer-exit-hook (lambda ()
				  (setq gc-cons-threshold 800000)))

;; cleanup whitespace before saving file
(add-hook 'before-save-hook #'whitespace-cleanup)

;; enable narrowing
(put 'narrow-to-region 'disabled nil)

;;
;; builtin packages
;;

(use-package paren
  ;; highlight matching parens
  :config (show-paren-mode t))

(use-package elec-pair
  ;; eanble paren matching
  :config (electric-pair-mode t))

(use-package hl-line
  ;; highlight current line
  :config (global-hl-line-mode t))

(use-package hi-lock
  ;; syntax highlighting
  :config (global-hi-lock-mode t))

(use-package ido
  :config
  (ido-mode t)

  :custom
  ;; fuzzy matching, e.g. "tl" will match "Tyrion Lannister"
  (ido-enable-flex-matching t)

  ;; don't try to match file across "work" directories"; only match files
  ;; in the current directory displayed in the minibuffer
  (ido-auto-merge-work-directories-length -1)

  ;; Include buffer naes of recently open files, even if they're not
  ;; open now
  (ido-use-virtual-buffers t))

(use-package recentf
  :config
  (recentf-mode t)

  ;; easily switch to recently edited files
  :custom
  (recentf-save-file (expand-file-name ".recentf" user-emacs-directory))
  (recentf-max-menu-items 40)

  :bind (("C-x C-r" . recentf-open-files)))

(use-package saveplace
  :config
  ;; activate for all buffers
  (setq-default save-place t)

  :custom
  (save-place-file (expand-file-name "saveplace" user-emacs-directory)))

;; (use-package uniquify
;;   ;; the forward naming method includes part of the file's directory name
;;   ;; at the beginning of the buffer name
;;   :config
;;   (setq uniquify-buffer-name-style 'forward))

;;
;; Key Binds
;;

(global-set-key (kbd "C-x C-b") #'ibuffer)
(global-set-key (kbd "C-s") #'isearch-forward-regexp)
(global-set-key (kbd "C-r") #'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") #'isearch-forward)
(global-set-key (kbd "C-M-r") #'isearch-backward)

(global-set-key (kbd "C-x C-n") #'other-window)

(message "init-emacs")
(provide 'init-emacs)

;;; init-emacs.el ends here
