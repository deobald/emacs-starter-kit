(defgroup tetoo nil
  "Commands for tetoo"
  :prefix "tetoo-"
  :group 'applications)

(defcustom tetoo-db-rebuild "./rebuild_%s"
  "Command to rebuild a database"
  :type 'string
  :group 'tetoo)

(defcustom tetoo-buffer-name "*tetoo*"
  "Buffer name for tetoo processes"
  :type 'string
  :group 'tetoo)

(defun tetoo-project-root ()
  (locate-dominating-file default-directory "project.clj"))

(defmacro tetoo-in-project-root (body)
  "Wrap BODY to make `default-directory' the project folder."
  (let ((dir (gensym)))
    `(let ((,dir (tetoo-project-root)))
       (if ,dir
           (let ((default-directory ,dir)) ,body)
         (error "No project root found")))))

(defun tetoo-db-rebuild-command (&optional environment)
  (format tetoo-db-rebuild environment))

(defun tetoo-db-rebuild (environment)
  (let ((buffer (get-buffer-create tetoo-buffer-name)))
    (tetoo-in-project-root
     (shell-command (format "cd db && %s && ls && cd -" (tetoo-db-rebuild-command environment))
                    tetoo-buffer-name))))

(defmacro tetoo-defun-db-rebuild (environment)
  `(defun ,(intern (concat "tetoo-db-rebuild-" environment)) ()
     ,(concat "Rebuild the " environment " database")
     (interactive)
     (tetoo-db-rebuild ,environment)))

(dolist (environment '(dev qa ea))
  (eval `(tetoo-defun-db-rebuild ,(symbol-name environment))))

(provide 'tetoo)
