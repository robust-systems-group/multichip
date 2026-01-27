(define-module (multichip packages python-accelergy)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix build-system pyproject)
  #:use-module (gnu packages serialization)
  #:use-module (gnu packages python-xyz)
  #:use-module (guix build-system python)
  #:use-module (gnu packages python-build))

(define-public python-jinja2
  (package
    (name "python-jinja2")
    (version "3.1.6")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/pallets/jinja/")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "01ds59a1cync34xq7s0q6f50k9nvn2n80zh62qa2a8vnr7fz5nlv"))))
    (build-system pyproject-build-system)
    (propagated-inputs (list python-markupsafe))
    (native-inputs (list python-flit-core))
    (home-page "https://github.com/pallets/jinja/")
    (synopsis "A very fast and expressive template engine.")
    (description
     "This package provides a very fast and expressive template engine.")
    (license #f)))

(define-public python-accelergy
  (package
   (name "python-accelergy")
   (version "0.1.0")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/Accelergy-Project/accelergy.git")
           (commit "6911d15686ee7efdceba7d95605102df4472ae3a")))
     (file-name (git-file-name name version))
     (sha256
      (base32 "1alvxgb6pdrqz6qbczx94x4mhqkjyyd8zb74jgihxfsz2admn0k2"))))
   (build-system pyproject-build-system)
   (arguments
    '(#:phases (modify-phases %standard-phases (delete 'check) (delete 'sanity-check))))
   (propagated-inputs (list python-jinja2 python-deepdiff python-ruamel.yaml python-pyfiglet python-pyyaml))
   (native-inputs (list python-setuptools python-wheel))
   (home-page "")
   (synopsis "")
   (description "")
   (license #f)))
