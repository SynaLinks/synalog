WITH t_0_Event AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      '2025-12-30 23:15:00' AS "at",
      'login' AS kind,
      'ana' AS "user"
   UNION ALL
  
    SELECT
      2 AS id,
      '2026-01-02 08:05:30' AS "at",
      'buy' AS kind,
      'ana' AS "user"
   UNION ALL
  
    SELECT
      3 AS id,
      '2026-01-15 12:00:00' AS "at",
      'login' AS kind,
      'ben' AS "user"
   UNION ALL
  
    SELECT
      4 AS id,
      '2026-02-01 00:00:01' AS "at",
      'buy' AS kind,
      'ben' AS "user"
   UNION ALL
  
    SELECT
      5 AS id,
      '2026-02-14 18:45:10' AS "at",
      'buy' AS kind,
      'ana' AS "user"
   UNION ALL
  
    SELECT
      6 AS id,
      '2026-02-28 23:59:59' AS "at",
      'login' AS kind,
      'cy' AS "user"
   UNION ALL
  
    SELECT
      7 AS id,
      '2026-03-01 06:30:00' AS "at",
      'buy' AS kind,
      'cy' AS "user"
   UNION ALL
  
    SELECT
      8 AS id,
      '2026-03-15 14:20:00' AS "at",
      'refund' AS kind,
      'ana' AS "user"
   UNION ALL
  
    SELECT
      9 AS id,
      '2026-03-31 09:00:00' AS "at",
      'login' AS kind,
      'ben' AS "user"
   UNION ALL
  
    SELECT
      10 AS id,
      '2026-04-01 10:10:10' AS "at",
      'buy' AS kind,
      'ben' AS "user"
  
) AS UNUSED_TABLE_NAME  )
SELECT
  CASE WHEN (CAST(SUBSTR(Event."at", 6, 2) AS INTEGER) < 10) THEN (('0') || ((SELECT (CASE WHEN synalog_v IS NULL THEN NULL WHEN abs(synalog_v) < 0.0000000000000005 THEN '0' WHEN synalog_v = CAST(synalog_v AS INTEGER) AND abs(synalog_v) < 1e18 THEN CAST(CAST(synalog_v AS INTEGER) AS TEXT) WHEN abs(synalog_v) >= 1e38 THEN CAST(synalog_v AS TEXT) WHEN abs(synalog_v) >= 1e15 THEN (CASE WHEN synalog_v < 0 THEN '-' ELSE '' END) || substr(printf('%.14e', abs(synalog_v)), 1, 1) || substr(printf('%.14e', abs(synalog_v)), 3, 14) || substr('0000000000000000000000000', 1, CAST(substr(printf('%.14e', abs(synalog_v)), instr(printf('%.14e', abs(synalog_v)), 'e') + 1) AS INTEGER) - 14) ELSE rtrim(rtrim(printf('%.*f', max(1, min(15, 14 - CAST(floor(log10(coalesce(nullif(abs(synalog_v), 0), 1))) AS INTEGER))), synalog_v), '0'), '.') END) FROM (SELECT CAST(SUBSTR(Event."at", 6, 2) AS INTEGER) AS synalog_v)))) ELSE (SELECT (CASE WHEN synalog_v IS NULL THEN NULL WHEN abs(synalog_v) < 0.0000000000000005 THEN '0' WHEN synalog_v = CAST(synalog_v AS INTEGER) AND abs(synalog_v) < 1e18 THEN CAST(CAST(synalog_v AS INTEGER) AS TEXT) WHEN abs(synalog_v) >= 1e38 THEN CAST(synalog_v AS TEXT) WHEN abs(synalog_v) >= 1e15 THEN (CASE WHEN synalog_v < 0 THEN '-' ELSE '' END) || substr(printf('%.14e', abs(synalog_v)), 1, 1) || substr(printf('%.14e', abs(synalog_v)), 3, 14) || substr('0000000000000000000000000', 1, CAST(substr(printf('%.14e', abs(synalog_v)), instr(printf('%.14e', abs(synalog_v)), 'e') + 1) AS INTEGER) - 14) ELSE rtrim(rtrim(printf('%.*f', max(1, min(15, 14 - CAST(floor(log10(coalesce(nullif(abs(synalog_v), 0), 1))) AS INTEGER))), synalog_v), '0'), '.') END) FROM (SELECT CAST(SUBSTR(Event."at", 6, 2) AS INTEGER) AS synalog_v)) END AS m
FROM
  t_0_Event AS Event
GROUP BY CASE WHEN (CAST(SUBSTR(Event."at", 6, 2) AS INTEGER) < 10) THEN (('0') || ((SELECT (CASE WHEN synalog_v IS NULL THEN NULL WHEN abs(synalog_v) < 0.0000000000000005 THEN '0' WHEN synalog_v = CAST(synalog_v AS INTEGER) AND abs(synalog_v) < 1e18 THEN CAST(CAST(synalog_v AS INTEGER) AS TEXT) WHEN abs(synalog_v) >= 1e38 THEN CAST(synalog_v AS TEXT) WHEN abs(synalog_v) >= 1e15 THEN (CASE WHEN synalog_v < 0 THEN '-' ELSE '' END) || substr(printf('%.14e', abs(synalog_v)), 1, 1) || substr(printf('%.14e', abs(synalog_v)), 3, 14) || substr('0000000000000000000000000', 1, CAST(substr(printf('%.14e', abs(synalog_v)), instr(printf('%.14e', abs(synalog_v)), 'e') + 1) AS INTEGER) - 14) ELSE rtrim(rtrim(printf('%.*f', max(1, min(15, 14 - CAST(floor(log10(coalesce(nullif(abs(synalog_v), 0), 1))) AS INTEGER))), synalog_v), '0'), '.') END) FROM (SELECT CAST(SUBSTR(Event."at", 6, 2) AS INTEGER) AS synalog_v)))) ELSE (SELECT (CASE WHEN synalog_v IS NULL THEN NULL WHEN abs(synalog_v) < 0.0000000000000005 THEN '0' WHEN synalog_v = CAST(synalog_v AS INTEGER) AND abs(synalog_v) < 1e18 THEN CAST(CAST(synalog_v AS INTEGER) AS TEXT) WHEN abs(synalog_v) >= 1e38 THEN CAST(synalog_v AS TEXT) WHEN abs(synalog_v) >= 1e15 THEN (CASE WHEN synalog_v < 0 THEN '-' ELSE '' END) || substr(printf('%.14e', abs(synalog_v)), 1, 1) || substr(printf('%.14e', abs(synalog_v)), 3, 14) || substr('0000000000000000000000000', 1, CAST(substr(printf('%.14e', abs(synalog_v)), instr(printf('%.14e', abs(synalog_v)), 'e') + 1) AS INTEGER) - 14) ELSE rtrim(rtrim(printf('%.*f', max(1, min(15, 14 - CAST(floor(log10(coalesce(nullif(abs(synalog_v), 0), 1))) AS INTEGER))), synalog_v), '0'), '.') END) FROM (SELECT CAST(SUBSTR(Event."at", 6, 2) AS INTEGER) AS synalog_v)) END ORDER BY m NULLS LAST;
