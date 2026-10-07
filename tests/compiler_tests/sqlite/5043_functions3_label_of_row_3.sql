WITH t_1_V AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      3 AS x,
      'ab' AS s
   UNION ALL
  
    SELECT
      2 AS k,
      -4 AS x,
      'hello' AS s
   UNION ALL
  
    SELECT
      3 AS k,
      0 AS x,
      '' AS s
   UNION ALL
  
    SELECT
      4 AS k,
      null AS x,
      'x' AS s
   UNION ALL
  
    SELECT
      5 AS k,
      12 AS x,
      null AS s
   UNION ALL
  
    SELECT
      6 AS k,
      7 AS x,
      'seven' AS s
  
) AS UNUSED_TABLE_NAME  )
SELECT
  CASE WHEN (t_0_V.x IS null) THEN 'none' ELSE (SELECT (CASE WHEN synalog_v IS NULL THEN NULL WHEN abs(synalog_v) < 0.0000000000000005 THEN '0' WHEN synalog_v = CAST(synalog_v AS INTEGER) AND abs(synalog_v) < 1e18 THEN CAST(CAST(synalog_v AS INTEGER) AS TEXT) WHEN abs(synalog_v) >= 1e38 THEN CAST(synalog_v AS TEXT) WHEN abs(synalog_v) >= 1e15 THEN (CASE WHEN synalog_v < 0 THEN '-' ELSE '' END) || substr(printf('%.14e', abs(synalog_v)), 1, 1) || substr(printf('%.14e', abs(synalog_v)), 3, 14) || substr('0000000000000000000000000', 1, substr(printf('%.14e', abs(synalog_v)), 19) - 14) ELSE rtrim(rtrim(printf('%.*f', min(15, max(1, 14 - floor(log10(abs(synalog_v))))), synalog_v), '0'), '.') END) FROM (SELECT t_0_V.x AS synalog_v)) END AS v
FROM
  t_1_V AS t_0_V
WHERE
  (t_0_V.k = 3);