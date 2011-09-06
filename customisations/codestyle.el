;; wombat color theme
(add-to-list 'load-path (concat vendor-dir "/color-theme-wombat"))
(require 'color-theme-wombat)

;; solarized
(add-to-list 'load-path (concat vendor-dir "/color-theme-solarized"))
(require 'color-theme-solarized)
(color-theme-solarized-light)

;; use inconsolata
(set-face-attribute 'default nil
                    :family "Inconsolata"
                    :height 130)

;; show line numbers
(global-linum-mode t)

;; tabs are 2 spaces
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)
