
;;; ================================= version check =================================
	(let ((minver "25.1"))	;11:13 2017/1/24
		(when (version<= emacs-version "25.1")
			(error "All of the configurations is requires v%s. Please update your Emacs." minver)))
;;; ================================= version check =================================


;;; ================================ customize begin ================================

	(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
	(add-to-list 'load-path (expand-file-name "lisp/customizes" user-emacs-directory))
	(add-to-list 'load-path (expand-file-name "lisp/purcells" user-emacs-directory))

	(require 'purcell-benchmarking) ;; Measure startup time	14:48 2017/1/24

	(defconst *spell-check-support-enabled* nil) ;; Enable with t if you prefer
	(defconst *is-a-mac* (eq system-type 'darwin))

;; --------------- GC
	; ;; the frequent garbage collection lead to run caton：https://www.reddit.com/r/emacs/comments/55ork0/is_emacs_251_noticeably_slower_than_245_on_windows/?st=ixl6iw4r&sh=256da377

	; ; (setq gc-cons-threshold (* 1024 1024 1024)) ;	earlier 14:56 2017/1/24
	; ; (setq gc-cons-percentage 0.5)
	; ; (run-with-idle-timer 2 t #'garbage-collect)
	; ; (setq garbage-collection-messages t)

	(defconst sanityinc/initial-gc-cons-threshold gc-cons-threshold
		"Initial value of `gc-cons-threshold' at start-up time.")
	(add-hook 'after-init-hook
          (lambda () (setq gc-cons-threshold sanityinc/initial-gc-cons-threshold)))


;; -------------------------------- Bootstrap config --------------------------------
	(setq custom-file (expand-file-name "customize.el" user-emacs-directory)) ; not working
	(require 'purcell-utils) ; 9:59 2017/1/25 ; after-load inside, dependence on customize-package-repository.
	(require 'purcell-site-lisp) ; 9:35 2017/2/17 ; Must come before customize-package-repository, as it may provide package.el
	; ;; Calls (package-initialize)
	(require 'customize-package-repository) ; Find and load packages, defun require-package and maybe-require-package function.
	; (require 'purcell-exec-path) ;; Set up $PATH

;; ----------------------------- load packages configs -----------------------------
	(require-package 'wgrep) ; 15:43 2017/1/24
	(require-package 'project-local-variables)
	(require-package 'diminish) ; Diminished modes are minor modes with no modeline display ;  diminish,highlight-symbol,browse-kill-ring,expand-region,avy,multiple-cursors,page-break,move-dup,whole-line-or-region,highlight-escape-sequences,popwin,guide-key
	(require-package 'scratch) ; Mode-specific scratch buffers
	(require-package 'mwe-log-commands) ; Add-on to log keyboard commands into a buffer. NOT NECESSARY 17:47 2017/1/24
	; ; (require-package 'mwe-cambridge-permute) ; Transforms text into gibberish which still can be understood amazingly well. NOT NECESSARY	17:51 2017/1/24

	; (require 'purcell-frame-hooks) ; not found function. ; 10:27 2017/2/17
	; ; (require 'purcell-xterm) ; not found function. ; dependence on purcell-frame-hooks 10:38 2017/2/17
	(require 'customize-operate-habit) ; some configs for package 11:18 2017/2/17
	; (require 'customize-themes-list)

	(require 'purcell-ibuffer) ; dependence on purcell-utils	10:04 2017/1/25
	; ; (require 'purcell-flycheck) ; TODO:some unnecessary buffers; not useful 10:34 2017/1/25

	(require 'customize-smex)
	(require 'customize-auto-complete) ; TODO:set variable of 'ac-dictionary-directories' for '~\.emacs.d\lisp\dict' or other value. ; 11:38 2017/2/17
	(require 'purcell-windows) ; switch-windows ; golden-ratio、window-numbering replaced by purcell-windows' 11:36 2017/2/17
	; ; -----------------replaced by purcell-sessions
		; ; (add-to-list 'load-path "~/.emacs.d/lisp/others")
		; (require-package 'session)
		; (require 'session) ; Open recently files	11:13 2017/1/24
		; (add-hook 'after-init-hook 'session-initialize)

		; (load "desktop") ; 'M-x desktop-save' to save the buffer-setting before close Emacs, then you will get the last buffer-setting when reopen Emacs.	11:14 2017/1/24
		; (desktop-load-default)
		; (desktop-read)
	; ; -----------------replaced by purcell-sessions
	(require 'purcell-sessions) ; save a list of open files in ~/.emacs.d/.emacs.desktop or save some configs had been changed like themes/color/font and so on. 11:23 2017/1/25
	(require 'customize-fonts)
	; ; (require-package 'mmm-mode)

	(require 'purcell-editing-utils) ; undo-tree、scope-line and key-tip; dependence on diminish	11:38 2017/1/25
	(require 'purcell-whitespace) ; space-block 10:37 2017/2/7
	; ; ; (require 'purcell-fci) ; not found function. fcitx fix 10:46 2017/2/7

	; ; (require 'purcell-git) ; 11:59 2017/2/17
	; ; (require 'purcell-github) ; 14:00 2017/2/17
	; ; (require 'purcell-projectile) ; 14:37 2017/2/10


;; It's same to purcell's init-xterm.el purcell

	(require-package 'jdee) ; need set 'jdee-jdk-registry'、'jdee-server-dir' 9:23 2017/2/16
	(require 'customize-java-doc) ; 'javadoc-help.el' is NECESSARY (~/.emacs.d/lisp/javadoc-help.el) ; 18:42 2017/3/2
	(require 'purcell-javascript) ; flycheck 15:53 2017/2/10 ; void-function first
	(require 'purcell-org) ; 16:05 2017/2/10
	(require 'purcell-nxml) ; 16:08 2017/2/10
	(require 'customize-html) ; 16:19 2017/2/10
	(require 'purcell-css) ; 16:21 2017/2/10
	(require 'purcell-sql) ; 16:35 2017/2/10
	; ; (require 'purcell-python-mode) ; it isn't use at this time. 16:25 2017/2/10
	; ; (require 'purcell-ruby-mode) ; it isn't use at this time. 16:30 2017/2/10

	(require 'purcell-paredit) ; 16:38 2017/2/10
	(require 'purcell-lisp) ; flycheck 16:40 2017/2/10
	(require 'purcell-slime) ; Superior Lisp Interaction Mode for Emacs. 16:42 2017/2/10
	(require 'purcell-common-lisp) ; 16:45 2017/2/10

	; (when *spell-check-support-enabled*
		; (require 'purcell-spelling)) ; dependence on purcell-flyspell. 16:51 2017/2/10

	(require 'purcell-folding) ; 17:04 2017/2/10
	(require 'purcell-dash) ; A modern list library for Emacs. 17:06 2017/2/10
	(require 'purcell-ledger) ; flycheck 17:10 2017/2/10

;; Extra packages which don't require any configuration
	; (require-package 'gnuplot) ; It isn't use at this time. 17:15 2017/2/10
	; (require-package 'htmlize) ; Convert buffer text and decorations to HTML. it isn't use at this time. 17:17 2017/2/10
	; (require-package 'dsvn) ; Subversion interface. 17:18 2017/2/10
	; (when *is-a-mac*
		; (require-package 'osx-location)) ; not mac.
	; (require-package 'regex-tool) ; A regular expression evaluation tool for programmers. 17:20 2017/2/10

	; (add-hook 'after-save-hook 'executable-make-buffer-file-executable-if-script-p) ; TODO Verification function. 17:00 2017/2/10



;; ---------------------------multiple-cursors begin---------------------------
	;; 一次编辑多处/行文字
	; (add-to-list 'load-path "~/.emacs.d/lisp/multiple-cursors.el-master")
	(require-package 'multiple-cursors)
	; (require 'multiple-cursors)
	;; When you have an active region that spans multiple lines, the following will add a cursor to each line:
	(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)

	;; When you want to add multiple cursors not based on continuous lines, but based on keywords in the buffer, use:
	(global-set-key (kbd "C->") 'mc/mark-next-like-this)
	(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
	(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
;; multiple-cursors end


;; --------------------------rainbow-delimiters begin--------------------------
	;; 对内嵌的括号等pair符号加不同颜色
	; (load-file "~/.emacs.d/lisp/rainbow-delimiters-master/rainbow-delimiters.el")
	(require-package 'rainbow-delimiters)
	; (require 'rainbow-delimiters)
	;; To toggle the mode in the current buffer:
	; M-x rainbow-delimiters-mode

	;; To start the mode automatically in foo-mode, add the following to your init file:
	; (add-hook 'foo-mode-hook #'rainbow-delimiters-mode)

	;; To start the mode automatically in most programming modes (Emacs 24 and above):
	; (add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

	;; rainbow-delimiters
	(rainbow-delimiters-mode t)

;; rainbow-delimiters end

;; rainbow-blocks
	(require-package 'rainbow-blocks)
	; (rainbow-blocks-mode t)
	(global-rainbow-blocks-mode t)
;; rainbow-identifiers-mode
	(require-package 'rainbow-identifiers)
	(rainbow-identifiers-mode t)

;;	-----------------------------smartparens begin-----------------------------
	; (add-to-list 'load-path "~/.emacs.d/lisp/smartparens-master")
	; (load-file "~/.emacs.d/lisp/smartparens-master/smartparens.el")
	;; use smartparens
	; (require 'smartparens-config)
	(require-package 'smartparens)
	;; global enabled, and use strict mode
	(smartparens-global-strict-mode +1)


;; -------------------------- yasnippet begin --------------------------
	(require-package 'yasnippet)
	(require 'yasnippet) ;; not yasnippet-bundle
	(yas/initialize)
	(yas/load-directory "~/.emacs.d/lisp/snippets")

;;	yasnippet end


;;	----------------------------highlight-tail begin----------------------------
	; (load-file "~/.emacs.d/lisp/highlight-tail.el")
	; (require 'highlight-tail) ; Not needed if you use package.el
	; (require-package 'highlight-tail)
	;; 把highlight-tail-steps调小，把highlight-tail-timer调大，这样占的cpu就会更少了。
;;	highlight-tail end


;; ------------------------------ window display begin ------------------------------
	; no scroll
	(set-scroll-bar-mode nil)

	; no tool bar
	; (tool-bar-mode nil) ;; not work
	
	; fullscreen when start
	; (custom-set-variables
		; '(initial-frame-alist (quote ((fullscreen . maximized)))))

;; --------------- window size
	(setq default-frame-alist
		'((vertical-scroll-bars)
			; (top . 25)
			; (left . 45)
			; (width . 110)
			; (height . 40)
			; ; (top . 0)
			; ; (left . 0)
			; ; (width . 80)
			; ; (height . 40)
			; ; (background-color . "black")
			; ; (foreground-color . "grey")
			; ; (cursor-color . "gold1")
			; ; (mouse-color . "gold1")
			(tool-bar-lines . 0)
			; (menu-bar-lines . 1)
			; (right-fringe)
			; (left-fringe)
			))

;; --------------- title bar
;; display buffer's name and path in the title bar.
	; (setq frame-title-format "emacs@%b %I")
	; (setq frame-title-format "%b %I") ; display buffer's name and size.
	;; display the name of current project and the full path of edit file.
	(setq frame-title-format
		(list "["
	; '(:eval (projectile-project-name))
		"]" "emacs@"
			'(buffer-file-name "%f" (dired-directory dired-directory "%b"))))

;; --------------- time line
	(display-time-mode 1) ; display time
	(setq display-time-24hr-format t) ; 24 hour system
	; (setq display-time-day-and-date t);;时间显示包括日期和具体时间
	; (setq display-time-use-mail-icon t);;时间栏旁边启用邮件设置
	(setq display-time-interval 10) ; refresh interval

;; ------------------------------- window display end -------------------------------


;; ------------------------------ system setting begin ------------------------------

;; --------------- default load path
	; (setq default-directory "~/Workspaces")
	(setq default-directory "E:/daily/Workspaces/")  ; must use "/" in the path, or you will see messy code.

;; ------------------------------- system setting end -------------------------------


;; ------------------------ plug-in-additional-settings end ------------------------
;; --------------- load customize-variable file
	(load-file "~/.emacs.d/customize.el")
	(require 'customize)
;; ================================ customize end ================================

(provide 'init)

;; Local Variables:
;; coding: utf-8
;; no-byte-compile: t
;; End: