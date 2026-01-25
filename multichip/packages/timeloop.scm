(define-module (multichip packages timeloop)
  #:use-module (multichip packages barvinok)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system scons)
  #:use-module (gnu packages algebra)
  #:use-module (guix licenses)
  #:use-module (gnu packages multiprecision)
  #:use-module (gnu packages ncurses)
  #:use-module (gnu packages textutils)
  #:use-module (gnu packages boost)
  #:use-module (gnu packages serialization)
  #:use-module (gnu packages commencement)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages gawk)
  #:export (timeloop)
  )

(define-public timeloop
  (package
   (name "timeloop")
   (version (git-version "0.26.6" "1" "28dc9bb1c31c951ff258c2c8293f9152ee74c690"))
   (source (origin
	    (method git-fetch)
	    (uri (git-reference
		  (url "https://github.com/robust-systems-group/timeloop.git")
		  (commit "28dc9bb1c31c951ff258c2c8293f9152ee74c690")))
	    (file-name (git-file-name name version))
	    (sha256 (base32 "1p42z36yrvf9i7midf6bj08czniqd1v4kqcxlmn75qyxxy72r10q"))))
   (build-system scons-build-system)
   (arguments
    '(#:phases
      (modify-phases %standard-phases
		     (add-after 'unpack 'my-new-phase
				(lambda _
				  (copy-recursively "pat-public/src/pat" "src/pat") #t))
		     (delete 'check))
      #:scons-flags (list "--with-isl" "--accelergy" (string-append "--prefix="  (assoc-ref %outputs "out")))
      ))
   (inputs (list yaml-cpp libconfig barvinok ntl boost ncurses/tinfo gmp))
   (home-page "blah")
   (synopsis "blah")
   (description "blah")
   (license #f)))

timeloop
