;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.


	(add-to-list 'load-path "~/.emacs.d/packages/")
	(require 'package)
	(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
	(add-to-list 'package-archives '("elpa" . "http://tromey.com/elpa/") t)
	(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
	; (add-to-list 'package-archives '("melpa2" . "http://melpa.org/packages/") t)
	
	(package-initialize)
	
	
;; ================================ customize begin ================================
	(add-to-list 'load-path "~/.emacs.d/lisp/customize-lisp")	
	(require 'customize-frame)	
	(require 'customize-themes-list)
	(require 'customize-operate-habit)
	(require 'customize-auto-complete)
	(require 'customize-smex)
	(require 'plug-in-additional-settings)
	;;设置打开文件的缺省路径
	; (setq default-directory "~/Workspaces")
	(setq default-directory "D:/AptAtt/WorkSpaces/EmacsWorkspace/daily/")
	
;; -------------------------------- api begin start --------------------------------
    ;; Java document support  
    ; (add-to-list 'load-path (expand-file-name "/opt/emacs_plugins/java"))
	(load-file "~/.emacs.d/lisp/javadoc-help.el")
    (require 'javadoc-help)  
	(javadoc-set-predefined-urls '("D:/ProgramFiles/docs/api"))  
    ; (javadoc-set-predefined-urls 
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
	
;; ================================ customize end ================================
