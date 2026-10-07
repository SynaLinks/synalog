WITH t_2_O AS (SELECT * FROM VALUES
  (1, "ann", 30),
  (2, "ann", 12),
  (3, "bob", 50),
  (4, "cid", 7),
  (5, "cid", 7),
  (6, "cid", 40),
  (7, "bob", 5)
AS UNUSED_TABLE_NAME(id, c, amt))
SELECT
  ARRAY_JOIN((SELECT
  (CASE WHEN COUNT(*) = 0 THEN NULL ELSE TRANSFORM(ARRAY_SORT(COLLECT_LIST(STRUCT(O.id AS arg, transform(array(O.amt), synalog_v -> (CASE WHEN synalog_v IS NULL THEN NULL WHEN ABS(synalog_v) < 0.0000000000000005 THEN '0' WHEN synalog_v = FLOOR(synalog_v) AND ABS(synalog_v) < 1e18 THEN CAST(CAST(synalog_v AS BIGINT) AS STRING) WHEN ABS(synalog_v) >= 1e38 THEN CAST(synalog_v AS STRING) WHEN ABS(synalog_v) >= 1e15 THEN concat(CASE WHEN synalog_v < 0 THEN '-' ELSE '' END, substr(format_string('%.14e', ABS(CAST(synalog_v AS DOUBLE))), 1, 1), substr(format_string('%.14e', ABS(CAST(synalog_v AS DOUBLE))), 3, 14), repeat('0', CAST(substr(format_string('%.14e', ABS(CAST(synalog_v AS DOUBLE))), instr(format_string('%.14e', ABS(CAST(synalog_v AS DOUBLE))), 'e') + 1) AS INT) - 14)) ELSE TRIM(TRAILING '.' FROM TRIM(TRAILING '0' FROM format_string(concat('%.', CAST(GREATEST(1, LEAST(15, 14 - CAST(FLOOR(LOG10(COALESCE(NULLIF(ABS(synalog_v), 0), 1))) AS INT))) AS STRING), 'f'), CAST(synalog_v AS DOUBLE)))) END))[0] AS value))), s -> s.value) END) AS logica_value
FROM
  t_2_O AS O
WHERE
  (O.c = "cid")), ";") AS s;