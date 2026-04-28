(require "helix/editor.scm")
(require "helix/configuration.scm")
(require "helix/components.scm")
(require "helix/commands.scm")
(require "steel/result")
(require-builtin steel/process)
(require-builtin steel/strings)
(require-builtin steel/time)


(define version "v0.26.04dev")


(define cursor_row #f)
(define cursor_col #f)
(define home "")
(define message "")

(define (get-cursor-row-col)
  (match (current-cursor)
    [#f
      (set! message "No primary cursor is visible") (set! cursor_row #f) (set! cursor_col #f)]
    [(list pos kind) 
      (set! cursor_row (position-row pos))
      (set! cursor_col (position-col pos))]))


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
(define shared_state_file (string-append home "/helix_shared_state"))
(define hb_last_sent (system-time/now))
(define last_heartbeat (hash 'last_activity_at 0 'last_heartbeat_at 0 'file ""))

(define wakatimecliversion spawn-process (run-shell-command "wakatime-cli" (list "--version")
(echo wakatimecliversion)
(if (not wakatimecliversion))) 
[set! message "Wakatime cli not found!"]
)