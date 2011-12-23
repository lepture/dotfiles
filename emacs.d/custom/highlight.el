(require 'highlight-symbol)

(global-set-key (kbd "C-c C-h") 'highlight-symbol-at-point)
(global-set-key [(control right)] 'highlight-symbol-next)
(global-set-key [(control left)] 'highlight-symbol-prev)