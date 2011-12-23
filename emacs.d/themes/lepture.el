
(eval-when-compile
  (require 'color-theme))

(defun color-theme-slate ()
  (interactive)
  (color-theme-install
   '(color-theme-slate
	 ((background-color . "black")
      (background-mode . light)
      (border-color . "#1a1a1a")
      (cursor-color . "#808080")
      (foreground-color . "#eeeeec")
      (mouse-color . "black"))
     (fringe ((t (:background "#1a1a1a"))))
     (mode-line ((t (:foreground "#000000" :background "#ffffff"))))
     (region ((t (:background "#0d4519"))))
     (font-lock-builtin-face ((t (:foreground "#729fcf"))))
     (font-lock-comment-face ((t (:foreground "#888a85"))))
     (font-lock-function-name-face ((t (:foreground "#edd400"))))
     (font-lock-keyword-face ((t (:foreground "#729fcf"))))
     (font-lock-string-face ((t (:foreground "#ad7fa8"))))
     (font-lock-type-face ((t (:foreground"#8ae234"))))
     (font-lock-variable-name-face ((t (:foreground "#eeeeec"))))
     (minibuffer-prompt ((t (:foreground "#729fcf" :bold t))))
     (font-lock-warning-face ((t (:foreground "Red" :bold t))))
	 (linum ((t (:background "#141314" :foreground "#969696"))))
     )))
(provide 'color-theme-slate)
