;; ------------------------------ customize-frame start -------------------------------

;; ȡ��������
	(set-scroll-bar-mode nil)
;; ȡ��������
	(tool-bar-mode nil) ;; ��ʼ��Ч������Ч
	; (tool-bar-mode -1)
;; ��custom-set-variables������Ӵ��룬��emacs�������Զ���󻯡���ע�����ŵ�ƥ�䡣
	; (custom-set-variables
		; '(initial-frame-alist (quote ((fullscreen . maximized)))))
;; ���ô��ڳߴ�
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
;; ����ʱ����ʾ
	(display-time-mode 1);;����ʱ����ʾ���ã���minibuffer������Ǹ�����
	(setq display-time-24hr-format t);;ʱ��ʹ��24Сʱ��
	; (setq display-time-day-and-date t);;ʱ����ʾ�������ں;���ʱ��
	(setq display-time-use-mail-icon t);;ʱ�����Ա������ʼ�����
	(setq display-time-interval 10);;ʱ��ı仯Ƶ�ʣ���λ�������ţ�
	
;; ------------------------------- customize-frame end --------------------------------

(provide 'customize-frame)
