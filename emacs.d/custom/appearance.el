
;; set title to filename
(setq frame-title-format "%b")

;; no menu bar
(if (not window-system)
	(add-hook 'term-setup-hook #'(lambda()(menu-bar-mode -1))))

;; column line
(require 'linum)
(setq linum-format "%3d ")
(add-hook 'find-file-hooks(lambda()(linum-mode 1)))

;; themes
(setq color-theme-libraries "~/.emacs.d/themes") ;; disable default libraries
(require 'color-theme)
;;(load-file "~/.emacs.d/themes/twilight.el")
;;(color-theme-twilight)
(load-file "~/.emacs.d/themes/lepture.el")
(color-theme-slate)
