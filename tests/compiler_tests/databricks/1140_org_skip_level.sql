WITH t_1_Manages AS (SELECT * FROM VALUES
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
  t_0_Manages.report AS report
FROM
  t_1_Manages AS Manages, t_1_Manages AS t_0_Manages
WHERE
  (t_0_Manages.boss = Manages.report) ORDER BY boss NULLS LAST, report NULLS LAST;
