WITH t_0_Event AS (SELECT * FROM VALUES
  (1, "2025-12-30 23:15:00", "login", "ana"),
  (2, "2026-01-02 08:05:30", "buy", "ana"),
  (3, "2026-01-15 12:00:00", "login", "ben"),
  (4, "2026-02-01 00:00:01", "buy", "ben"),
  (5, "2026-02-14 18:45:10", "buy", "ana"),
  (6, "2026-02-28 23:59:59", "login", "cy"),
  (7, "2026-03-01 06:30:00", "buy", "cy"),
  (8, "2026-03-15 14:20:00", "refund", "ana"),
  (9, "2026-03-31 09:00:00", "login", "ben"),
  (10, "2026-04-01 10:10:10", "buy", "ben")
AS UNUSED_TABLE_NAME(id, `at`, kind, `user`))
SELECT
  CASE WHEN (CAST(ROUND(SUBSTR(Event.`at`, 6, 2)) AS BIGINT) < 10) THEN (CONCAT("0", transform(array(CAST(ROUND(SUBSTR(Event.`at`, 6, 2)) AS BIGINT)), synalog_v -> (CASE WHEN synalog_v IS NULL THEN NULL WHEN ABS(synalog_v) < 0.0000000000000005 THEN '0' WHEN synalog_v = FLOOR(synalog_v) AND ABS(synalog_v) < 1e18 THEN CAST(CAST(synalog_v AS BIGINT) AS STRING) WHEN ABS(synalog_v) >= 1e38 THEN CAST(synalog_v AS STRING) WHEN ABS(synalog_v) >= 1e15 THEN concat(CASE WHEN synalog_v < 0 THEN '-' ELSE '' END, substr(format_string('%.14e', ABS(CAST(synalog_v AS DOUBLE))), 1, 1), substr(format_string('%.14e', ABS(CAST(synalog_v AS DOUBLE))), 3, 14), repeat('0', CAST(substr(format_string('%.14e', ABS(CAST(synalog_v AS DOUBLE))), instr(format_string('%.14e', ABS(CAST(synalog_v AS DOUBLE))), 'e') + 1) AS INT) - 14)) ELSE TRIM(TRAILING '.' FROM TRIM(TRAILING '0' FROM format_string(concat('%.', CAST(GREATEST(1, LEAST(15, 14 - CAST(FLOOR(LOG10(COALESCE(NULLIF(ABS(synalog_v), 0), 1))) AS INT))) AS STRING), 'f'), CAST(synalog_v AS DOUBLE)))) END))[0])) ELSE transform(array(CAST(ROUND(SUBSTR(Event.`at`, 6, 2)) AS BIGINT)), synalog_v -> (CASE WHEN synalog_v IS NULL THEN NULL WHEN ABS(synalog_v) < 0.0000000000000005 THEN '0' WHEN synalog_v = FLOOR(synalog_v) AND ABS(synalog_v) < 1e18 THEN CAST(CAST(synalog_v AS BIGINT) AS STRING) WHEN ABS(synalog_v) >= 1e38 THEN CAST(synalog_v AS STRING) WHEN ABS(synalog_v) >= 1e15 THEN concat(CASE WHEN synalog_v < 0 THEN '-' ELSE '' END, substr(format_string('%.14e', ABS(CAST(synalog_v AS DOUBLE))), 1, 1), substr(format_string('%.14e', ABS(CAST(synalog_v AS DOUBLE))), 3, 14), repeat('0', CAST(substr(format_string('%.14e', ABS(CAST(synalog_v AS DOUBLE))), instr(format_string('%.14e', ABS(CAST(synalog_v AS DOUBLE))), 'e') + 1) AS INT) - 14)) ELSE TRIM(TRAILING '.' FROM TRIM(TRAILING '0' FROM format_string(concat('%.', CAST(GREATEST(1, LEAST(15, 14 - CAST(FLOOR(LOG10(COALESCE(NULLIF(ABS(synalog_v), 0), 1))) AS INT))) AS STRING), 'f'), CAST(synalog_v AS DOUBLE)))) END))[0] END AS m
FROM
  t_0_Event AS Event
GROUP BY 1 ORDER BY m NULLS LAST;
