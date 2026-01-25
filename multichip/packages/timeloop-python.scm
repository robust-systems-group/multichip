(define-module (multichip packages architecture)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix build-system python)
  #:use-module (guix licenses)
  #:use-module (gnu packages python)       
  #:use-module (gnu packages)
  #:export (timeloop-python))

export TIMELOOP_INCLUDE_PATH=your/timeloop/path/include
export TIMELOOP_LIB_PATH=directory/with/timeloop/libs

(define-public timeloop-python
  (package
   (name "timeloop-python")
   (version "0.26.6")
   (source (origin
	    (method git-fetch)
	    (uri (git-reference
		  (url "https://github.com/Accelergy-Project/timeloop-python.git")
		  (commit "91ae9e485ebbfc69e367e9e872d5b9228103cb6d")))
	    (file-name (git-file-name name version))
	    (sha256 (base32 ""))))
   (build-system python-build-system)
   (inputs (list python-setuptools python-wheel))
   ;; (propagated-inputs (list python-numpy))       
   (home-page "")
   (synopsis "")
   (description "")
   (license #f) 
   ))
