# .emacs.d
emacs configuration files


> **Please note**: Thanks for download my repository.

**Tested on versions:**
* GNU Emacs 25.1.2 (emacs-w64-25.1-O2) of Last Update: 2016-09-22

## Install

The default configuration-files directory at `C:\Users\YOUR-USER-NAME\AppData\Roaming\.emacs.d\`, load this repository to `C:\Users\YOUR-USER-NAME\AppData\Roaming\`.
  
 OR
  
 Change the name of `init.el` to `customize-init.el` and add the next text to `init.el`.
  
  ```
  ;; Change the directory of configuration-files 
  (setenv "HOME" "YOUR-PATH-WHERE-THE-.emacs.d-DIRECTORY-IN(EXCLUDE)") 
  (load "YOUR-PATH-WHERE-THE-.emacs.d-DIRECTORY-IN(EXCLUDE)\.emacs.d\customize-init.el")
  ```
  
Update the list of packages. 	
  
  ```
  M-x list-packages 
  ```
  
## Plugins

### Useful

* `auto-complete` -- Auto complete.
* `golden-ratio` -- Resizing automatically the windows you are working on to the size specified in the "Golden Ratio".
* `highlight-tail` -- draw a colourful "tail" while you write
* `multiple-cursors` -- Edit several lines at the same time.
* `smartparens` -- Automatic insertion, wrapping and paredit-like navigation with user defined pairs.
* `window-numbering` -- Assigns numbers to windows for quick access (like Firefox does for tabs).
* `yasnippet` -- A template system for Emacs. It allows you to type an abbreviation and automatically expand it into function templates.

### JAVA

The use of java language development projects

* `ecb` -- A code browser for Emacs.
* `javadoc-loopup` -- Javadoc Emacs integration with Maven.
* `JDEE` -- A Java Development Environment for Emacs.
* `rainbow-blocks-mode` -- Block syntax highlighting for lisp code.
* `rainbow-delimiters` -- Highlight brackets according to their depth.
* `rainbow-identifiers` -- Highlight identifiers according to their names.
