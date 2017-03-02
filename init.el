;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.


	; (add-to-list 'load-path "~/.emacs.d/packages/")
	; (require 'package)
	(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
	(add-to-list 'package-archives '("elpa" . "http://tromey.com/elpa/") t)
	(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
	; (add-to-list 'package-archives '("melpa2" . "http://melpa.org/packages/") t)
	
	(package-initialize)
	
	
;; ================================ customize begin ================================
	(setq gc-cons-threshold (* 5 1024 1024 1024))
	(setq gc-cons-percentage 0.5)
	(run-with-idle-timer 5 t #'garbage-collect)
	(setq garbage-collection-messages t)


	(add-to-list 'load-path "~/.emacs.d/lisp/customize-lisp")	
	(require 'customize-frame)	
	(require 'customize-themes-list)
	(require 'customize-operate-habit)
	(require 'customize-auto-complete)
	(require 'customize-smex)
	; (require 'plug-in-additional-settings)
;;设置打开文件的缺省路径
	; (setq default-directory "~/Workspaces")
	(setq default-directory "D:/WorkSpaces/EmacsWorkspace/")
	
;;	在标题栏显示buffer的名字和大小，而不是默认的没用的显示
	; (setq frame-title-format "emacs@%b %I")
	; (setq frame-title-format "%b %I") ;显示文件名和大小
	;; 标题栏	就可以显示当前项目名，当前编辑文件的完整路径。
	(setq frame-title-format
		(list "[" 
	; '(:eval (projectile-project-name)) 
		"]" "emacs@"
			'(buffer-file-name "%f" (dired-directory dired-directory "%b"))))

	
;; -------------------------------- api begin start --------------------------------
    ;; Java document support. Javadoc-lookup or Javadoc-help
    ;; (add-to-list 'load-path (expand-file-name "/opt/emacs_plugins/java"))
	
	; (load-file "~/.emacs.d/lisp/javadoc-help.el")
    ; (require 'javadoc-help)  
	; (javadoc-set-predefined-urls '("D:/ProgramFiles/docs/api"))  
    ;; (javadoc-set-predefined-urls 
		; '("/opt/java_docs/common-cache-1.0.0-javadoc"  
		; "/opt/java_docs/commons-codec-1.4-javadoc"  
        ; "/opt/java_docs/commons-logging-1.1.1-javadoc"  
        ; "/opt/java_docs/ehcache-server-1.0.0-javadoc"  
        ; "/opt/java_docs/gson-1.7.1-javadoc"  
        ; "/opt/java_docs/jcommander-1.12-javadoc"  
        ; "/opt/java_docs/jersey-apache-client-1.9.1-javadoc"  
        ; "/opt/java_docs/jersey-client-1.9.1-javadoc"  
        ; "/opt/java_docs/jersey-core-1.9.1-javadoc"  
        ; "/opt/java_docs/joda-time-1.6.2-javadoc"  
        ; "/opt/java_docs/junit-4.8.2-javadoc"  
        ; "/opt/java_docs/logback-classic-1.0.0-javadoc"  
        ; "/opt/java_docs/logback-core-1.0.0-javadoc"  
        ; "/opt/java_docs/lombok-0.10.4-javadoc"  
        ; "/opt/java_docs/mongo-java-driver-2.7.2-javadoc"  
        ; "/opt/java_docs/mybatis-3.0.5-javadoc"  
        ; "/opt/java_docs/slf4j-api-1.6.4-javadoc"  
        ; "/opt/java_docs/snakeyaml-1.6-javadoc"  
        ; "/opt/java_docs/testng-6.1.1-javadoc"))  
      
    (global-set-key [(f1)]          'javadoc-lookup)  ; F1 to lookup  
    (global-set-key [(shift f1)]    'javadoc-help)    ; Shift-F1 to bring up menu  
;; api end

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

	
;; ================================ customize end ================================
