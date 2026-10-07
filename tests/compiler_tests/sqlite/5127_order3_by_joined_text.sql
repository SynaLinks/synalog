WITH t_0_R AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      5 AS x,
      'b' AS s,
      true AS b
   UNION ALL
  
    SELECT
      2 AS k,
      null AS x,
      'a' AS s,
      false AS b
   UNION ALL
  
    SELECT
      3 AS k,
      2 AS x,
      null AS s,
      true AS b
   UNION ALL
  
    SELECT
      4 AS k,
      5 AS x,
      'c' AS s,
      null AS b
   UNION ALL
  
    SELECT
      5 AS k,
      -1 AS x,
      'B' AS s,
      false AS b
   UNION ALL
  
    SELECT
      6 AS k,
      2 AS x,
      'a' AS s,
      true AS b
   UNION ALL
  
    SELECT
      7 AS k,
      null AS x,
      null AS s,
      false AS b
   UNION ALL
  
    SELECT
      8 AS k,
      9 AS x,
      'aa' AS s,
      true AS b
  
) AS UNUSED_TABLE_NAME  )
SELECT
  R.k AS k,
  ((((R.s) || ('-'))) || ((SELECT (CASE WHEN synalog_v IS NULL THEN NULL WHEN abs(synalog_v) < 0.0000000000000005 THEN '0' WHEN synalog_v = CAST(synalog_v AS INTEGER) AND abs(synalog_v) < 1e18 THEN CAST(CAST(synalog_v AS INTEGER) AS TEXT) WHEN abs(synalog_v) >= 1e38 THEN CAST(synalog_v AS TEXT) WHEN abs(synalog_v) >= 1e15 THEN (CASE WHEN synalog_v < 0 THEN '-' ELSE '' END) || substr(printf('%.14e', abs(synalog_v)), 1, 1) || substr(printf('%.14e', abs(synalog_v)), 3, 14) || substr('0000000000000000000000000', 1, substr(printf('%.14e', abs(synalog_v)), 19) - 14) ELSE rtrim(rtrim(printf('%.*f', min(15, max(1, 14 - floor(log10(abs(synalog_v))))), synalog_v), '0'), '.') END) FROM (SELECT R.k AS synalog_v)))) AS t
FROM
  t_0_R AS R ORDER BY t NULLS LAST, k NULLS LAST;