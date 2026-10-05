SELECT
  x_7.value AS n,
  (((SELECT (CASE WHEN synalog_v IS NULL THEN NULL WHEN abs(synalog_v) < 0.0000000000000005 THEN '0' WHEN synalog_v = CAST(synalog_v AS INTEGER) AND abs(synalog_v) < 1e18 THEN CAST(CAST(synalog_v AS INTEGER) AS TEXT) WHEN abs(synalog_v) >= 1e38 THEN CAST(synalog_v AS TEXT) WHEN abs(synalog_v) >= 1e15 THEN (CASE WHEN synalog_v < 0 THEN '-' ELSE '' END) || substr(printf('%.14e', abs(synalog_v)), 1, 1) || substr(printf('%.14e', abs(synalog_v)), 3, 14) || substr('0000000000000000000000000', 1, CAST(substr(printf('%.14e', abs(synalog_v)), instr(printf('%.14e', abs(synalog_v)), 'e') + 1) AS INTEGER) - 14) ELSE rtrim(rtrim(printf('%.*f', max(1, min(15, 14 - CAST(floor(log10(coalesce(nullif(abs(synalog_v), 0), 1))) AS INTEGER))), synalog_v), '0'), '.') END) FROM (SELECT x_7.value AS synalog_v))) || (CASE WHEN (x_7.value = 1) THEN 'st' WHEN (x_7.value = 2) THEN 'nd' ELSE 'th' END)) AS o
FROM
  JSON_EACH(JSON_ARRAY(1, 2, 4)) as x_7 ORDER BY n NULLS LAST;
