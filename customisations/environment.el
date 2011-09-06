;; fix the PATH variable
(defun set-exec-path-from-shell-PATH ()
 (let ((path-from-shell (shell-command-to-string "$SHELL -i -c 'echo $PATH'")))
   (setenv "PATH" path-from-shell)
   (setq exec-path (split-string path-from-shell path-separator))))

(if window-system (set-exec-path-from-shell-PATH))

;; causes clojure-jack-in to shit the bed??
;; hook to redirect stdout to slime buffer
;; (add-hook 'slime-connected-hook 'slime-redirect-inferior-output)

;; ruby
(setq ruby-deep-indent-paren-style nil)

;; smooth-scrolling stops that annoying jump when moving around
(require 'smooth-scrolling)

;; dircolors colors buffers like ls --color
(require 'dircolors)

;; makes sexps flash when you eval them!
(require 'highlight)
(require 'eval-sexp-fu)

;; make emacs like vim lisp mode :D
(require 'rainbow-delimiters)
(require 'rainbow-parens)

;; set ack to be ack-grep for debian
(require 'full-ack)
(setq ack-executable (executable-find  "ack-grep" ))

;; require tetoo stuff
(require 'tetoo)
;;>>>>>>> drwti-master
