(define-module (multichip packages barvinok)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix licenses)
  #:use-module (guix build-system gnu)
  #:use-module (gnu packages algebra)
  #:use-module (gnu packages multiprecision))

(define-public barvinok
(package
  (name "barvinok")
  (version "2.10")
  (source (origin
            (method url-fetch)
            (uri (string-append "mirror://gnu/hello/hello-" version
                                ".tar.gz"))
            (sha256
             (base32
              "0ssi1wpaf7plaswqqjwigppsg5fyh99vdlb9kzl7c9lng89ndq1i"))))
  (build-system gnu-build-system)
  (synopsis "Hello, Guix world: An example custom Guix package")
  (description
   "GNU Hello prints the message \"Hello, world!\" and then exits.  It
serves as an example of standard GNU coding practices.  As such, it supports
command-line arguments, multiple languages, and so on.")
  (home-page "https://www.gnu.org/software/hello/")
  (license gpl3+)))

;;(define-public barvinok
;;  (package
;;   (name "barvinok")
;;   (version "0.41.8")
;;   (source (origin
;;	    (method url-fetch)
;;	    (uri (string-append "https://barvinok.sourceforge.io/barvinok-" version ".tar.gz"))
;;	    (sha256 (base32 "0fnaivdimv8b901i70r14dmw9sbpyc1v75p6mvxsjbl8bbpgwh6c"))))
;;   (build-system gnu-build-system)
;;   (inputs (list gmp ntl))
;;   (arguments
;;    `(#:configure-flags '("--enable-shared-barvinok")))
;;   (synopsis "barvinok is a library for counting the number of integer points in parametric and non-parametric polytopes.")
;;   (description "barvinok is a library for counting the number of integer points in parametric and non-parametric polytopes. For parametric polytopes an explicit function in the shape of a piece-wise step-polynomial is constructed. This is a generalization of both Ehrhart quasi-polynomials and vector partition functions. Alternatively, a generalized Ehrhart series can be constructed as well.")
;;   (home-page "https://barvinok.sourceforge.io/")
;;   (license license:gpl3+)))
