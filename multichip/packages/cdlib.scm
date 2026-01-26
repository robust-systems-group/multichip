(define-module (multichip packages cdlib)
  #:use-module (guix packages)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages python-science)
  #:use-module (gnu packages machine-learning)
  #:use-module (gnu packages graph)
  #:use-module (guix git-download)
  #:use-module (guix download)
  #:use-module (guix git)
  #:use-module (guix build-system python)
  #:use-module (guix build-system pyproject)
  #:use-module (guix licenses))

;; guix import pypy -r cdlib
(define-public python-thresholdclustering
  (package
   (name "python-thresholdclustering")
   (version "1.1")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
           (url
            "https://github.com/IngoMarquart/python-threshold-clustering")
           (commit version)))
     (file-name (git-file-name name version))
     (sha256
      (base32 "18hcdzdi3v2n7y1nn2y4xb4pxig4dk5glkdjv5lbkgc4ibj3cm78"))))
   (build-system pyproject-build-system)
   (arguments
    '(#:phases
      (modify-phases %standard-phases
		     (delete 'check))))
   (propagated-inputs (list python-networkx python-numpy))
   (native-inputs (list python-setuptools python-wheel))
   (home-page "https://github.com/IngoMarquart/python-threshold-clustering")
   (synopsis
    "Community detection for directed, weighted networkX graphs with spectral thresholding.")
   (description
    "Community detection for directed, weighted @code{networkX} graphs with spectral
thresholding.")
   (license #f)))

(define-public python-eva-lcd
  (package
   (name "python-eva-lcd")
   (version "0.1.1")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/GiulioRossetti/eva")
           (commit (string-append "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32 "1zw3036ggfcpyd23xs5rm0c38hyva0zdprlgymwdankzclmmxw0a"))))
   (build-system pyproject-build-system)
   (arguments
    '(#:phases
      (modify-phases %standard-phases
		     (delete 'check))))
   (propagated-inputs (list python-networkx python-numpy))
   (native-inputs (list python-setuptools python-wheel))
   (home-page "https://github.com/GiulioRossetti/eva")
   (synopsis "Eva: Community Discovery for labeled graphs")
   (description "Eva: Community Discovery for labeled graphs.")
   (license #f)))

(define-public python-dynetx
  (package
   (name "python-dynetx")
   (version "0.3.2")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/GiulioRossetti/dynetx")
           (commit (string-append "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32 "0air99mxna1m6v1ll98bbc8yv86zdb67qifmr9z66bis94wc87fh"))))
   (build-system pyproject-build-system)
   (arguments
    '(#:phases
      (modify-phases %standard-phases
		     (delete 'check))))

   (propagated-inputs (list python-decorator python-future python-networkx
                            python-numpy python-tqdm))
   (native-inputs (list python-setuptools python-wheel))
   (home-page "https://github.com/GiulioRossetti/dynetx")
   (synopsis "Dynamic Network library")
   (description "Dynamic Network library.")
   (license #f)))

(define-public python-demon
  (package
   (name "python-demon")
   (version "2.0.6")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/GiulioRossetti/DEMON")
           (commit (string-append "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32 "132bhb03lj82g5yrgrn3wgr7wl1pk1yx40bklbhrya15a5r29rqf"))))
   (build-system pyproject-build-system)
   (arguments
    '(#:phases
      (modify-phases %standard-phases
		     (delete 'check))))

   (propagated-inputs (list python-networkx python-tqdm))
   (native-inputs (list python-setuptools python-wheel))
   (home-page "https://github.com/GiulioRossetti/DEMON")
   (synopsis "Community Discovery algorithm")
   (description "Community Discovery algorithm.")
   (license #f)))

(define-public python-bimlpa
  (package
   (name "python-bimlpa")
   (version "0.1.2")
   (source
    (origin
     (method url-fetch)
     (uri (pypi-uri "bimlpa" version))
     (sha256
      (base32 "19fxhv7vhvn4v4zi20r5d78ivr7si9d1wmhgkd5q4va120q4p6xl"))))
   (build-system pyproject-build-system)
   (arguments
    '(#:phases
      (modify-phases %standard-phases
		     (delete 'check))))

   (propagated-inputs (list python-matplotlib python-networkx
                            python-scikit-learn))
   (native-inputs (list python-setuptools python-wheel))
   (home-page "https://github.com/hbkt/BiMLPA")
   (synopsis
    "Community detection in bipartite networks using multi-label propagation algorithm")
   (description
    "Community detection in bipartite networks using multi-label propagation
algorithm.")
   (license #f)))

(define-public python-angelcommunity
  (package
   (name "python-angelcommunity")
   (version "2.0.0")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/GiulioRossetti/ANGEL")
           (commit (string-append "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32 "0dawyzrq6h3v2lswd1zy5z1nrsm7mvwsf33gd3ibpd40dx81s287"))))
   (build-system pyproject-build-system)
   (arguments
    '(#:phases
      (modify-phases %standard-phases
		     (delete 'check)
		     (delete 'sanity-check))))
   (propagated-inputs (list python-future python-networkx python-numpy
                            python-igraph python-tqdm))
   (native-inputs (list python-setuptools python-wheel))
   (home-page "https://github.com/GiulioRossetti/ANGEL")
   (synopsis "Community Discovery algorithm")
   (description "Community Discovery algorithm.")
   (license #f)))

(define-public python-cdlib
  (package
   (name "python-cdlib")
   (version "0.4.0")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/GiulioRossetti/cdlib")
           (commit (string-append "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32 "16qx7qdjk289y0j62cgmm8miqcmnz6cy3w5gx3k98qjvp482j83p"))))
   (build-system pyproject-build-system)
   (arguments
    '(#:phases
      (modify-phases %standard-phases
		     (delete 'check)
		     (delete 'sanity-check))))
   (propagated-inputs (list python-angelcommunity
                            python-bimlpa
                            python-demon
                            python-dynetx
                            python-eva-lcd
                            python-networkx
                            python-numpy
                            python-pandas
                            python-plotly
                            python-pooch
                            python-pulp
                            python-igraph
                            python-levenshtein
                            python-louvain
                            python-scikit-learn
                            python-scipy
                            python-seaborn
                            python-thresholdclustering
                            python-tqdm))
   (native-inputs (list python-setuptools python-wheel))
   (home-page "https://github.com/GiulioRossetti/cdlib")
   (synopsis "Community Discovery Library")
   (description "Community Discovery Library.")
   (license #f)))

