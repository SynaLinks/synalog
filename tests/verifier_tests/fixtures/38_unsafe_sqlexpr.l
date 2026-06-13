# Verifier Test: Unsafe SqlExpr escape hatch
# Expected Error: unsafeSqlExpr
#
# SqlExpr injects raw, unparsed, non-portable SQL into the compiled query,
# bypassing verification. The dialect library may use it, but user programs
# must not; the verifier rejects it so temporal/other math stays on the safe
# string -> int pipeline.

TenMinutesAgo(timestamp:) :-
  Now(timestamp: now),
  timestamp == SqlExpr("{t} - INTERVAL 10 MINUTE", {t: now});
