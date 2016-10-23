# .emacs.d
emacs configuration files


> **Please note**: Thanks for download my repository.

**Tested on versions:**
* GNU Emacs 24.3.1 (emacs-w64-25.1-O2) of Last Update: 2016-09-22

## Install

The default configuration-files directory at "C:\Users\YOUR-USER-NAME\AppData\Roaming\.emacs.d", add the next text to init.el

  ```
	;; Change the directory of configuration-files 
	(setenv "HOME" "YOUR-PATH-WHERE-THE-.emacs.d-DIRECTORY-IN(EXCLUDE)") 
	(load "YOUR-PATH-WHERE-THE-.emacs.d-DIRECTORY-IN(EXCLUDE)/.emacs.d/customize-init.el")
  ```