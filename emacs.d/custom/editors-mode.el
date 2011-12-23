
(setq load-path (cons "~/.emacs.d/vendor/editors" load-path))

;; restructuredText
(require 'rst-mode)
(rst-set-level-default 'rst-level-face-base-color "black")
(setq auto-mode-alist
	  (append '(("\\.txt$" . rst-mode)
				("\\.rst$" . rst-mode)
				("\\.rest$" . rst-mode)) auto-mode-alist))

;; markdown
(require 'markdown-mode)
(setq auto-mode-alist
	  (append '(("\\.md$" . markdown-mode)
				("\\.mkd$" . markdown-mode)
				("\\.markdown" . markdown-mode)) auto-mode-alist))

;; zen coding
(require 'zencoding-mode)


;; django template
(require 'pony-mode)

