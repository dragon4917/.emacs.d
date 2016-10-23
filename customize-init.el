;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

(package-initialize)
	(add-to-list 'load-path "~/.emacs.d/packages/")
	(require 'package)
	(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
	(add-to-list 'package-archives '("elpa" . "http://tromey.com/elpa/") t)
	(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
	; (add-to-list 'package-archives '("melpa2" . "http://melpa.org/packages/") t)

;;	================================= customize begin =================================
	(add-to-list 'load-path "~/.emacs.d/lisp/customize-lisp")	
	(require 'customize-frame)	
	(require 'customize-themes-list)
	(require 'customize-operate-habit)
	
	;;设置打开文件的缺省路径
	; (setq default-directory "~/Workspaces")
	(setq default-directory "D:/AptAtt/WorkSpaces/EmacsWorkspace/daily/")
;;	customize end