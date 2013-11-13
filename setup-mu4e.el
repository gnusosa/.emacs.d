(require 'smtpmail)
(require 'mu4e)
(setq mu4e-get-mail-command "offlineimap")
(setq message-kill-buffer-on-exit t)

;; don't save message to Sent Messages, Gmail/IMAP takes care of this
(setq mu4e-sent-messages-behavior 'delete)

;; don't prompt for applying of marks, just apply
(setq mu4e-headers-leave-behavior 'apply)

;; Try to display images in mu4e
(setq mu4e-view-show-images t)
;; use imagemagick, if available
(when (fboundp 'imagemagick-register-types)
  (imagemagick-register-types))
(setq mu4e-view-prefer-html t)

(setq mu4e-confirm-quit nil
      mu4e-headers-date-format "%d/%b/%Y %H:%M" ; date format
      mu4e-html2text-command "w3m -T text/html")

;; Start mu4e in fullscreen, immediately ping for new mail
(defun mu4e-up-to-date-status ()
  (interactive)
  (window-configuration-to-register :mu4e-fullscreen)
  (mu4e)
  (mu4e-update-mail-show-window)
  (delete-other-windows))

;; Restore previous window configuration
(defun mu4e-quit-session ()
  "Restores the previous window configuration and kills the magit buffer"
  (interactive)
  (kill-buffer)
  (jump-to-register :mu4e-fullscreen))

(define-key mu4e-main-mode-map (kbd "q") 'mu4e-quit-session)
(define-key mu4e-headers-mode-map (kbd "M-u") 'mu4e-update-mail-show-window)

(setq mu4e-drafts-folder "/Personal/Drafts")
(setq mu4e-sent-folder   "/Personal/Sent Mail")
(setq mu4e-trash-folder  "/Personal/Trash")

;; setup some handy shortcuts
(setq mu4e-maildir-shortcuts
      '(("/Personal/INBOX"             . ?p)
        ("/Personal/Github"            . ?g)
        ("/Personal/Sent Mail"         . ?m)
        ("/Personal/Drafts"            . ?t)
        ("/Work/INBOX"                 . ?i)
        ("/Work/Sent Mail"             . ?s)
        ("/Work/Drafts"                . ?d)
))

;; something about ourselves
;; I don't use a signature...
(setq
  user-full-name  "お名前は何ですか"
 ;; message-signature
 ;;  (concat
 ;;    "Foo X. Bar\n"
 ;;    "http://www.example.com\n")
)

(setq mail-user-agent 'mu4e-user-agent)

(setq message-send-mail-function 'smtpmail-send-it)

(defvar my-mu4e-account-alist
  '(("Personal"
     (mu4e-drafts-folder "/Personal/Drafts")
     (mu4e-sent-folder   "/Personal/Sent Mail")
     (mu4e-trash-folder  "/Personal/Trash")
     (user-mail-address  "personal@domain.tld")
     (smtpmail-smtp-user "personal@domain.tld")
     (smtpmail-default-smtp-server "smtp.domain.tld")
     (smtpmail-smtp-server "smtp.domain.tld")
     (smtpmail-smtp-service 587)
     (starttls-use-gnutls t)
     (smtpmail-starttls-credentials '("smtp.domain.tld" 587 nil nil))
     (smtpmail-auth-credentials (expand-file-name "~/.authinfo.gpg"))
     (smtpmail-debug-info t))
    ("Work"
     (mu4e-drafts-folder "/Work/Drafts")
     (mu4e-sent-folder   "/Work/Sent Mail")
     (mu4e-trash-folder  "/Work/Trash")
     (user-mail-address  "work@domain.tld")
     (smtpmail-smtp-user "work@domain.tld")
     (smtpmail-default-smtp-server "smtp.domain.com")
     (smtpmail-smtp-server "smtp.domain.com")
     (smtpmail-smtp-service 587)
     (starttls-use-gnutls t)
     (smtpmail-starttls-credentials '("smtp.domain.com" 587 nil nil))
     (smtpmail-auth-credentials (expand-file-name "~/.authinfo.gpg"))
     (smtpmail-debug-info t))))

(defun my-mu4e-set-account ()
  "Set the account for composing a message."
  (let* ((account
          (if mu4e-compose-parent-message
              (let ((maildir (mu4e-message-field mu4e-compose-parent-message :maildir)))
                (string-match "/\\(.*?\\)/" maildir)
                (match-string 1 maildir))
            (completing-read (format "Compose with account: (%s) "
                                     (mapconcat #'(lambda (var) (car var)) my-mu4e-account-alist "/"))
                             (mapcar #'(lambda (var) (car var)) my-mu4e-account-alist)
                             nil t nil nil (caar my-mu4e-account-alist))))
         (account-vars (cdr (assoc account my-mu4e-account-alist))))
    (if account-vars
        (mapc #'(lambda (var)
                  (set (car var) (cadr var)))
              account-vars)
      (error "No email account found"))))

(add-hook 'mu4e-compose-pre-hook 'my-mu4e-set-account)

(provide 'setup-mu4e)
