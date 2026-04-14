(require "steel/result")
(require-builtin steel/base)
;; fds
(define home "not_written")

(let [(mbwhome (maybe-get-env-var "WAKATIME_HOME")) (mbhome (maybe-get-env-var "HOME"))]
    (cond
        [(Ok? mbwhome) (set! home (unwrap-ok mbwhome))]
        [else (cond
        [(Ok? mbhome)(set! home (unwrap-ok mbhome))]
        [else (set! home "UNKNOWN")]
        )]
    )
)

(define shared_state_parent_dir (string-append home "/.wakatime"))


(displayln home)

(displayln shared_state_parent_dir)