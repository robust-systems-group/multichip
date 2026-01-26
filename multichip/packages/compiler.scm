(define-module (multichip packages compiler)
  #:use-module (guix packages)
  #:use-module (gnu packages python-build)
  #:use-module (guix git-download)
  #:use-module (guix git)
  #:use-module (guix build-system pyproject)
  #:use-module (guix licenses))

(define-public compiler 
  (package
   (name "compiler")
   (version "0.1.0")
   (source (git-checkout
	    (url "git@github.com:robust-systems-group/multichip-compiler.git")
	    (commit "2b33d23552664f4b9329746f45debdaaa163a5ae")))
   (build-system pyproject-build-system)
   (arguments
    '(#:phases
      (modify-phases %standard-phases
		     (delete 'check))))
   (inputs (list python-hatchling))
   (home-page "blah")
   (synopsis "blah")
   (description "blah")
   (license #f)))

