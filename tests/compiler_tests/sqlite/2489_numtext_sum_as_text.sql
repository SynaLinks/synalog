WITH t_2_V AS (SELECT * FROM (
  
    SELECT
      0.1 AS x
   UNION ALL
  
    SELECT
      0.2 AS x
   UNION ALL
  
    SELECT
      0.3 AS x
  
) AS UNUSED_TABLE_NAME  ),
t_1_T AS (SELECT
  SUM(V.x) AS t
FROM
  t_2_V AS V)
SELECT
  (SELECT (CASE WHEN synalog_v IS NULL THEN NULL WHEN abs(synalog_v) < 0.0000000000000005 THEN '0' WHEN synalog_v = CAST(synalog_v AS INTEGER) AND abs(synalog_v) < 1e18 THEN CAST(CAST(synalog_v AS INTEGER) AS TEXT) WHEN abs(synalog_v) >= 1e38 THEN CAST(synalog_v AS TEXT) WHEN abs(synalog_v) >= 1e15 THEN (CASE WHEN synalog_v < 0 THEN '-' ELSE '' END) || substr(printf('%.14e', abs(synalog_v)), 1, 1) || substr(printf('%.14e', abs(synalog_v)), 3, 14) || substr('0000000000000000000000000', 1, substr(printf('%.14e', abs(synalog_v)), 19) - 14) ELSE rtrim(rtrim(printf('%.*f', min(15, max(1, 14 - floor(log10(abs(synalog_v))))), synalog_v), '0'), '.') END) FROM (SELECT t_0_T.t AS synalog_v)) AS s
FROM
  t_1_T AS t_0_T;