(define-module (multichip packages taco)
  #:use-module (guix packages)
  #:use-module (gnu packages python)
  #:use-module (guix download)
  #:use-module (gnu packages commencement)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages python-science)
  #:use-module (guix git-download)
  #:use-module (guix licenses)
  #:use-module (guix utils)
  #:use-module (guix build-system cmake))

(define-public taco
  (package
   (name "taco")
   (version "0.1.1")
   (source (origin
	    (method git-fetch)
	    (uri (git-reference
		  (url "https://github.com/C0L/taco.git")
		  (commit "0fd4ee7cb475fbb3e848ce262213029f2123f298")
                  (recursive? #t)))
	    (file-name (git-file-name name version))
	    (sha256 (base32 "1dmprwrrid8ffkwxbscqfhxl0sfgpwaa0y8hbf051psk0ygs66bd")))
    )
   (build-system cmake-build-system)
   (arguments
    '(#:configure-flags (list "-DCMAKE_BUILD_TYPE=Release" "-DPYTHON=ON")
      #:tests? #f))
   (native-inputs (list python))
   (propagated-inputs (list python-numpy python-scipy gcc-toolchain))
   (native-search-paths
    (list (search-path-specification
           (variable "PYTHONPATH")
           (files (list "lib")))
	  (search-path-specification
           (variable "TACO_CC")
           (files (list "bin/gcc")))))
   (home-page "blah")
   (synopsis "blah")
   (description "blah")
   (license #f)))
