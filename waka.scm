(require "helix/editor.scm")
(require-builtin steel/core/result)
(require-builtin steel/process)
(require-builtin steel/strings)
(require-builtin steel/time)

(define cursor_row #f)
(define cursor_col #f)
(define home "")

(define (get-cursor-pos-row-col)
    (match (current-cursor)
        [(list pos kind)
            ]
    )
)


(let [(mwbhome (maybe-get-env-var "WAKATIME_HOME")) (mbhome (maybe-get-env-var "HOME"))]
    (cond
        [(Ok? mbwhome) (set! home (unwrap-ok mbwhome))]
        [else (cond
        [(Ok? mbhome)(set! home (unwrap-ok mbwhome))]
        [else (set! home "UNKNOWN")]
        )]
    )
)
