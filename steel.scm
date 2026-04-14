(require "steel/result")
(require-builtin steel/base)
;; fds
(define home "not_written")

(let [(mbhome (maybe-get-env-var "HOME"))]
    (cond
        [(Ok? mbhome) (set! home (unwrap-ok mbhome))]
        [else (set! home "it's an error")]
    )
)


(displayln home)