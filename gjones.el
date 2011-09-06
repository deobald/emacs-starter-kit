(load "default-profile.el")

(add-to-list 'load-path (concat vendor-dir "/emacs-jabber-0.8.0"))
(require 'jabber-autoloads)

(setq jabber-account-list
    '(("gareth.e.jones@gmail.com" 
       (:network-server . "talk.google.com")
       (:connection-type . ssl))))

(setq jabber-chat-buffer-show-avatar nil)
(setq jabber-vcard-avatars-retrieve nil)
(setq jabber-roster-show-title nil)
(setq jabber-roster-line-format " %c %-25n %u %-8s (%r)")
(setq jabber-roster-show-bindings nil)
(setq jabber-show-offline-contacts nil)

;; turn off stupid line highlighting 9_9
(hl-line-mode nil)
