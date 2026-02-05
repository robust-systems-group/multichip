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
		  (commit "52d9811e548081616ba4f6268b8b7cbe1ee09f58")
		  (recursive? #t)))
	    (file-name (git-file-name name version))
	    (sha256 (base32 "0sf6p4bfsdgzyqr63b9z2k3qqzzb6397wbbymqjswv69bbpj07zj")))
	   )
   (build-system cmake-build-system)
   (arguments
    '(#:configure-flags (list "-DCMAKE_BUILD_TYPE=Release" "-DPYTHON=ON")
			#:tests? #f))
   (native-inputs (list python))
   (native-search-paths
    (list (search-path-specification
	   (variable "PYTHONPATH")
	   (files (list "lib/")))))
   ;; https://guix.gnu.org/manual/1.5.0/en/html_node/Search-Paths.html
   (propagated-inputs (list python-numpy python-scipy gcc-toolchain))
   (home-page "blah")
   (synopsis "blah")
   (description "blah")
   (license #f)))
