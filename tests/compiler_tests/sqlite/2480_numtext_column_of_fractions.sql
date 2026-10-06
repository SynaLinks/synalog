WITH t_0_V AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      0.1 AS x
   UNION ALL
  
    SELECT
      2 AS k,
      (CAST(1 AS REAL) / NULLIF(3, 0)) AS x
   UNION ALL
  
    SELECT
      3 AS k,
      (CAST(4 AS REAL) / NULLIF(2, 0)) AS x
   UNION ALL
  
    SELECT
      4 AS k,
      1e6 AS x
  
) AS UNUSED_TABLE_NAME  )
SELECT
  V.k AS k,
  (SELECT (CASE WHEN synalog_v IS NULL THEN NULL WHEN abs(synalog_v) < 0.0000000000000005 THEN '0' WHEN synalog_v = CAST(synalog_v AS INTEGER) AND abs(synalog_v) < 1e18 THEN CAST(CAST(synalog_v AS INTEGER) AS TEXT) WHEN abs(synalog_v) >= 1e38 THEN CAST(synalog_v AS TEXT) WHEN abs(synalog_v) >= 1e15 THEN (CASE WHEN synalog_v < 0 THEN '-' ELSE '' END) || substr(printf('%.14e', abs(synalog_v)), 1, 1) || substr(printf('%.14e', abs(synalog_v)), 3, 14) || substr('0000000000000000000000000', 1, CAST(substr(printf('%.14e', abs(synalog_v)), instr(printf('%.14e', abs(synalog_v)), 'e') + 1) AS INTEGER) - 14) ELSE rtrim(rtrim(printf('%.*f', max(1, min(15, 14 - CAST(floor(log10(coalesce(nullif(abs(synalog_v), 0), 1))) AS INTEGER))), synalog_v), '0'), '.') END) FROM (SELECT V.x AS synalog_v)) AS s
FROM
  t_0_V AS V ORDER BY k NULLS LAST;