(in-package :kludgecode)
(def use-system (system-keyword)
  "Loads a system if locally available, otherwise trys to fetch it via quicklisp"
  (if (asdf:system-registered-p system-keyword)
      (progn
        (asdf:load-system system-keyword)
        'asdf-loaded)
      (progn 
        (ql:quickload system-keyword)
        'quickloaded)))
