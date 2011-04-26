;; custom functions

(defvar *clojure-scratch-dir* "~/sandbox/projects/clojure/clj-scratch"
  "Location of a scratch project for quickly playing with clojure stuff")

(defun scratch-clojure ()
  (interactive)
  (if (file-exists-p *clojure-scratch-dir*)
      (progn
        (cd *clojure-scratch-dir*)
        (elein-swank)
        (find-file (concat *clojure-scratch-dir* "/src/clj_scratch/core.clj")))
    (message "make sure you have your clj-scratch project set up sucker")))

