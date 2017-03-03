;; It's like purcell's init-elpa.el


;;; Find and load the correct package.el

;; When switching between Emacs 23 and 24, we always use the bundled package.el in Emacs 24
(let ((package-el-site-lisp-dir
       (expand-file-name "site-lisp/package" user-emacs-directory)))
  (when (and (file-directory-p package-el-site-lisp-dir)
             (> emacs-major-version 23))
    (message "Removing local package.el from load-path to avoid shadowing bundled version")
    (setq load-path (remove package-el-site-lisp-dir load-path))))

	(require 'package)
	
;;; Standard packages repositories
	; (add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)	15:24 2017/1/24
	(add-to-list 'package-archives '("elpa" . "http://tromey.com/elpa/") t)
	; (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t) ; 15:26 2017/1/24
	; (add-to-list 'package-archives '("melpa2" . "http://melpa.org/packages/") t)
	
	(when (< emacs-major-version 24)
		;; Mainly for ruby-mode	15:24 2017/1/24
		(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/")))
	;; We include the org repository for completeness, but don't normally use it.	15:22 2017/1/24
	(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
	(when (< emacs-major-version 24)	; 15:25 2017/1/24
		(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))

	;; Also use Melpa for most packages	15:27 2017/1/24
	(add-to-list 'package-archives `("melpa" . ,(if (< emacs-major-version 24)
													"http://melpa.org/packages/"
												"https://melpa.org/packages/")))

;; NOTE: In case of MELPA problems, the official mirror URL is
;; https://www.mirrorservice.org/sites/stable.melpa.org/packages/


;; If gpg cannot be found, signature checking will fail, so we
;; conditionally enable it according to whether gpg is available. We
;; re-run this check once $PATH has been configured
(defun sanityinc/package-maybe-enable-signatures ()
  (setq package-check-signature (when (executable-find "gpg") 'allow-unsigned)))

(sanityinc/package-maybe-enable-signatures)
(after-load 'init-exec-path
  (sanityinc/package-maybe-enable-signatures))



;;; On-demand installation of packages

(defun require-package (package &optional min-version no-refresh)
  "Install given PACKAGE, optionally requiring MIN-VERSION.
If NO-REFRESH is non-nil, the available package lists will not be
re-downloaded in order to locate PACKAGE."
  (if (package-installed-p package min-version)
      t
    (if (or (assoc package package-archive-contents) no-refresh)
        (if (boundp 'package-selected-packages)
            ;; Record this as a package the user installed explicitly
            (package-install package nil)
          (package-install package))
      (progn
        (package-refresh-contents)
        (require-package package min-version t)))))


(defun maybe-require-package (package &optional min-version no-refresh)
  "Try to install PACKAGE, and return non-nil if successful.
In the event of failure, return nil and print a warning message.
Optionally require MIN-VERSION.  If NO-REFRESH is non-nil, the
available package lists will not be re-downloaded in order to
locate PACKAGE."
  (condition-case err
      (require-package package min-version no-refresh)
    (error
     (message "Couldn't install package `%s': %S" package err)
     nil)))


;;; Fire up package.el

(setq package-enable-at-startup nil)
(package-initialize)



(require-package 'fullframe)
(fullframe list-packages quit-window)


(require-package 'cl-lib)
(require 'cl-lib)

(defun sanityinc/set-tabulated-list-column-width (col-name width)
  "Set any column with name COL-NAME to the given WIDTH."
  (when (> width (length col-name))
    (cl-loop for column across tabulated-list-format
             when (string= col-name (car column))
             do (setf (elt column 1) width))))

(defun sanityinc/maybe-widen-package-menu-columns ()
  "Widen some columns of the package menu table to avoid truncation."
  (when (boundp 'tabulated-list-format)
    (sanityinc/set-tabulated-list-column-width "Version" 13)
    (let ((longest-archive-name (apply 'max (mapcar 'length (mapcar 'car package-archives)))))
      (sanityinc/set-tabulated-list-column-width "Archive" longest-archive-name))))

(add-hook 'package-menu-mode-hook 'sanityinc/maybe-widen-package-menu-columns)


(provide 'customize-package-repository)