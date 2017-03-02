;; ------------------------------ customize-frame start -------------------------------

;; 取消滚动栏
	(set-scroll-bar-mode nil)
;; 取消工具栏
	(tool-bar-mode nil) ;; 初始有效，后无效
	; (tool-bar-mode -1)
;; 在custom-set-variables区域添加代码，让emacs启动后自动最大化。请注意括号的匹配。
	; (custom-set-variables
		; '(initial-frame-alist (quote ((fullscreen . maximized)))))
;; 设置窗口尺寸
	(setq default-frame-alist
		'((vertical-scroll-bars)
			(top . 25)
			(left . 45)
			(width . 110)
			(height . 40)
			; (background-color . "black")
			; (foreground-color . "grey")
			; (cursor-color . "gold1")
			; (mouse-color . "gold1")
			(tool-bar-lines . 0)
			(menu-bar-lines . 1)
			(right-fringe)
			(left-fringe)))	
;; 设置时间显示
	(display-time-mode 1);;启用时间显示设置，在minibuffer上面的那个杠上
	(setq display-time-24hr-format t);;时间使用24小时制
	; (setq display-time-day-and-date t);;时间显示包括日期和具体时间
	(setq display-time-use-mail-icon t);;时间栏旁边启用邮件设置
	(setq display-time-interval 10);;时间的变化频率，单位多少来着？
	
;; ------------------------------- customize-frame end --------------------------------

(provide 'customize-frame)
