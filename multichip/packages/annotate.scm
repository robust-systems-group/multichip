(define-module (multichip packages annotate)
  #:use-module (guix packages)
  #:use-module (guix git-download)
  #:use-module (gnu packages python-build)
  #:use-module (guix git)
  #:use-module (guix build-system pyproject)
  #:use-module (guix licenses))

(define-public annotate 
  (package
   (name "annotate")
   (version "0.1.0")
   (source (git-checkout
	    (url "git@github.com:robust-systems-group/multichip-annotation.git")
	    (commit "0c0a7401d7876c293b79154df550589736302939")))
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

