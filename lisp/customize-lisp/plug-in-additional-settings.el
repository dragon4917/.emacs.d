;; ----------------------- plug-in-additional-settings start -----------------------

;; auto-complete

;; ecb

;; JDEE
	(add-to-list 'load-path "~/.emacs.d/lisp/jdee-master/")
	(require 'jdee)
;; golden-ratio
	(golden-ratio-mode 1)
	
;; highlight-tail
	; (highlight-tail-mode t)
	
;; java-snippets
	
;; javadoc-lookup
	

;; multiple-cursors start
	;;一次编辑多处/行文字
	; (add-to-list 'load-path "~/.emacs.d/lisp/multiple-cursors.el-master")
	; (require 'multiple-cursors)
	;; When you have an active region that spans multiple lines, the following will add a cursor to each line:
	(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)

	;; When you want to add multiple cursors not based on continuous lines, but based on keywords in the buffer, use:
	(global-set-key (kbd "C->") 'mc/mark-next-like-this)
	(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
	(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
;; multiple-cursors end

;; yasnippet begin
	(add-to-list 'load-path "~/.emacs.d/lisp/yasnippet-master")
	(require 'yasnippet) ;; not yasnippet-bundle
	(yas/initialize)
	(yas/load-directory "~/.emacs.d/lisp/snippets")
	;; (setq yas-snippet-dirs '( "~/.emacs.d/custom-snippets" ;personal snippets
	;; "~/.emacs.d/elpa/yasnippet-20140729.1240/snippets" ;default
	;; "~/.emacs.d/elpa/yasnippet-20140720.1534/snippets" ;default))
	;; change file yasnippet.el the line of 161 (expand-file-name "lisp/snippets" user-emacs-directory))
	;; (yas-snippet-dirs "~/.emacs.d/snippets") ;; not yet useful
	;; (custom-set-variables '(yas-snippet-dirs (quote ("~/.emacs.d/lisp/snippets" yas-installed-snippets-dir)))) ;; not yet useful
;; change the directory : M-x customize-variable yas-snippet-dirs ; not yet useful

;;	yasnippet end

;; rainbow-blocks
	; (rainbow-blocks-mode t)
	(global-rainbow-blocks-mode t)
;; rainbow-delimiters
	(rainbow-delimiters-mode t)
;; rainbow-identifiers-mode
	(rainbow-identifiers-mode t)

;; smartparens
	(smartparens-global-strict-mode +1)

;; window-numbering
	(window-numbering-mode t)

;; ------------------------ plug-in-additional-settings end ------------------------

(provide 'plug-in-additional-settings)
