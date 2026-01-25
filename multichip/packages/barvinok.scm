(define-module (multichip packages barvinok)
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
  #:use-module (gnu packages gawk))

(define-public barvinok
  (package
   (name "barvinok")
   (version "0.41.8")
   (source (origin
	    (method url-fetch)
	    (uri (string-append "https://barvinok.sourceforge.io/barvinok-" version ".tar.gz"))
	    (sha256
	     (base32 "0fnaivdimv8b901i70r14dmw9sbpyc1v75p6mvxsjbl8bbpgwh6c"))))
   (build-system gnu-build-system)
   (inputs (list gmp ntl))
   (arguments
    `(#:configure-flags '("--enable-shared-barvinok")))
   (synopsis "barvinok is a library for counting the number of integer
points in parametric and non-parametric polytopes.")
   (description "barvinok is a library for counting the number of
integer points in parametric and non-parametric polytopes. For
parametric polytopes an explicit function in the shape of a piece-wise
step-polynomial is constructed. This is a generalization of both
Ehrhart quasi-polynomials and vector partition
functions. Alternatively, a generalized Ehrhart series can be
constructed as well.")
   (home-page "https://barvinok.sourceforge.io/")
   (license #f)))
