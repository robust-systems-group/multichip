(define-module (multichip packages python-timeloop)
  #:use-module (multichip packages barvinok)
  #:use-module (multichip packages timeloop)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (gnu packages python-xyz)
  #:use-module (guix build-system python)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system cmake)
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
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages gawk))

(define-public python-timeloop
  (package
   (name "python-timeloop")
   (version "0.1.0")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/robust-systems-group/timeloop-python.git")
           (commit "91ae9e485ebbfc69e367e9e872d5b9228103cb6d")
	   (recursive? #t)))
     (file-name (git-file-name name version))
     (sha256
      (base32 "1arz9097vf4v90hmwvw4b6aypbcjcs9qzbdfaympdwpvj6km0ncs"))))
   (build-system pyproject-build-system)
   (inputs (list timeloop boost libconfig yaml-cpp isl))
   (propagated-inputs (list timeloop))
   (native-inputs (list python-setuptools python-wheel cmake-minimal cmake-shared pybind11))
   (arguments
    '(#:phases
      (modify-phases %standard-phases
		     (delete 'check)
		     (delete 'sanity-check)
		     (add-after 'unpack 'env-timeloop
				(lambda _ (setenv "TIMELOOP_INCLUDE_PATH" (assoc-ref %build-inputs "timeloop")) #t)))))
   (home-page "")
   (synopsis "")
   (description "")
   (license #f)))
