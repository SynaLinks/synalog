WITH t_0_Manages AS (SELECT * FROM VALUES
  ("ceo", "cto"),
  ("ceo", "cfo"),
  ("cto", "dev1"),
  ("cto", "dev2"),
  ("cto", "ops"),
  ("cfo", "acct"),
  ("ops", "sre1"),
  ("ops", "sre2"),
  ("dev1", "intern")
AS UNUSED_TABLE_NAME(boss, report))
SELECT
  Manages.boss AS boss,
  SUM(1) AS n
FROM
  t_0_Manages AS Manages
GROUP BY 1 ORDER BY boss NULLS LAST, n NULLS LAST;
