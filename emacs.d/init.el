;; init.el
;;
;; Copyright (c) 2011 Hsiaoming Young
;;
;; Author: Hsiaoming Young <lepture@me.com>
;;
;;; Code:



(defvar emacs-config-root-dir (file-name-directory load-file-name)
  "The root dir of the emacs config file.")
(defvar emacs-vendor-dir (concat emacs-config-root-dir "vendor/")
  "The vendor dir")
(defvar emacs-custom-dir (concat emacs-config-root-dir "custom/")
  "The custom config dir")

(add-to-list 'load-path emacs-vendor-dir)
(add-to-list 'load-path emacs-custom-dir)

;; common settings
(setq default-fill-column 60)
(setq inhibit-startup-message t)
(setq mouse-yank-at-point t)

;; turn off bell
(setq visible-bell t)
(setq ring-bell-function 'ignore)

;; indent style
(setq indent-tabs-mode nil)
(setq default-tab-width 4)
(setq tab-width 4)

;; auto save and tramp
(setq make-backup-files t)
(add-to-list 'backup-directory-alist
             (cons "." "~/.hide/emacs_save"))
(setq auto-save-list-file-prefix "~/.hide/emacs_auto_save_list")
(setq tramp-backup-directory-alist backup-directory-alist)
(setq  tramp-persistency-file-name "~/.hide/tramp")

;; user config
(setq user-full-name "Hsiaoming Young")
(setq user-mail-address "lepture@me.com")

;; replace "yes or no" with y or n
(fset 'yes-or-no-p 'y-or-n-p)

;; vendor path
(setq load-path (cons emacs-vendor-dir load-path))

;; appearance
(load-file (concat emacs-custom-dir "appearance.el"))

;; highlight
(load-file (concat emacs-custom-dir "highlight.el"))

;; binding keys
(load-file (concat emacs-custom-dir "keybindings.el"))

;; add custom mode
(load-file (concat emacs-custom-dir "editors-mode.el"))

;; project tree
(require 'dirtree)
