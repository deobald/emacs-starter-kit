(load "default-profile.el")

;; use inconsolata
(set-face-attribute 'default nil
                    :family "Inconsolata"
                    :height 150)

(if (not (boundp 'ffip-patterns))
    (setq ffip-patterns '()))

(dolist (pattern (list "Rakefile" "package.fig" "*.js" "*.java" "*.clj" "*.sql" "*.xml"))
  (add-to-list 'ffip-patterns pattern))
