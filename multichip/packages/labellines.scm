(define-module (multichip packages labellines)
  #:use-module (guix packages)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages check)
  #:use-module (gnu packages python-check)
  #:use-module (guix git-download)
  #:use-module (guix git)
  #:use-module (guix build-system pyproject)
  #:use-module (guix licenses))

(define-public python-matplotlib-label-lines
  (package
    (name "python-matplotlib-label-lines")
    (version "0.8.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/cphyc/matplotlib-label-lines")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1jh2mkwsw4s18jvpslsr40ny13xfazkfzwf1ykxhiqv3zv0qx2x8"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-matplotlib python-more-itertools
                             python-numpy))
    (native-inputs (list python-hatchling python-matplotlib python-pytest
                         python-pytest-cov python-pytest-mpl))
    (home-page "https://github.com/cphyc/matplotlib-label-lines")
    (synopsis "Label lines in matplotlib.")
    (description "Label lines in matplotlib.")
    (license #f)))
