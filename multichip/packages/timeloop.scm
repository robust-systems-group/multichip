(define-module (multichip packages timeloop)
  #:use-module (multichip packages barvinok)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix build-system python)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system scons)
  #:use-module (gnu packages algebra)
  #:use-module (guix licenses)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages cmake)
  #:use-module (gnu packages multiprecision)
  #:use-module (gnu packages ncurses)
  #:use-module (gnu packages textutils)
  #:use-module (gnu packages boost)
  #:use-module (gnu packages serialization)
  #:use-module (gnu packages commencement)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages gawk))


(define-public timeloop
  (package
   (name "timeloop")
   (version "0.0.1")
   (source (origin
	    (method git-fetch)
	    (uri (git-reference
		  (url "https://github.com/robust-systems-group/timeloop.git")
		  (commit "afdf7c169cda031bbae5713a817afdc2a417486b")))
	    (file-name (git-file-name name version))
	    (sha256 (base32 "17m4cb071lx6jzzgcdzd7fdx0030scj2481zaxpi50lvcwy1wrsm"))))
   (build-system scons-build-system)
   (arguments
    '(#:phases
      (modify-phases %standard-phases
		     (add-after 'unpack 'load-default-pat
				(lambda _ (copy-recursively "pat-public/src/pat" "src/pat") #t))
		     ;; (add-after 'unpack 'env-timeloop
		     ;;  		(lambda _ (setenv "TIMELOOP_INCLUDE_PATH" (assoc-ref %outputs "out")) #t))
		     (delete 'check)
		     )
      #:scons-flags (list "--with-isl" "--accelergy" (string-append "--prefix="  (assoc-ref %outputs "out")))
      ))
   (inputs (list yaml-cpp libconfig barvinok ntl boost ncurses/tinfo gmp))
   (home-page "blah")
   (synopsis "blah")
   (description "blah")
   (license #f)))


