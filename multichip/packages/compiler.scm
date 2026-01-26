(define-module (multichip packages compiler)
  #:use-module (multichip packages labellines)
  #:use-module (multichip packages cdlib)
  #:use-module (guix packages)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages python-science)
  #:use-module (gnu packages graph)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix git)
  #:use-module (guix build-system python)
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
   (propagated-inputs (list python-hatchling
		 python-matplotlib
		 python-numpy
		 python-networkx
		 python-scipy
		 python-tomli
		 python-tomli-w
		 python-leidenalg
		 python-tabulate
		 python-cdlib
		 python-matplotlib-label-lines))
   (home-page "blah")
   (synopsis "blah")
   (description "blah")
   (license #f)))


    ;; 'gurobipy==13.0.0',
    ;; 'matplotlib',
    ;; 'numpy',
    ;; 'networkx',
    ;; 'scipy',
    ;; 'cdlib',
    ;; 'leidenalg',
    ;; 'matplotlib-label-lines',
    ;; 'tabulate',
    ;; 'tomli_w',
