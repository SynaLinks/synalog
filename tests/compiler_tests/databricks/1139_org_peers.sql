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
  Manages.report AS a,
  t_0_Manages.report AS b
FROM
  t_1_Manages AS Manages, t_1_Manages AS t_0_Manages
WHERE
  (Manages.report != t_0_Manages.report) AND
  (t_0_Manages.boss = Manages.boss) ORDER BY a NULLS LAST, b NULLS LAST;
