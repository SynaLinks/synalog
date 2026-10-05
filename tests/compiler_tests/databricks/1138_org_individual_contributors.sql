WITH t_2_Manages AS (SELECT * FROM VALUES
  ("ceo", "cto"),
  ("ceo", "cfo"),
  ("cto", "dev1"),
  ("cto", "dev2"),
  ("cto", "ops"),
  ("cfo", "acct"),
  ("ops", "sre1"),
  ("ops", "sre2"),
  ("dev1", "intern")
AS UNUSED_TABLE_NAME(boss, report)),
t_1_Person_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      Manages.boss AS name
    FROM
      t_2_Manages AS Manages
   UNION ALL
  
    SELECT
      t_3_Manages.report AS name
    FROM
      t_2_Manages AS t_3_Manages
  
) AS UNUSED_TABLE_NAME  ),
t_0_Person AS (SELECT
  Person_MultBodyAggAux.name AS name
FROM
  t_1_Person_MultBodyAggAux AS Person_MultBodyAggAux
GROUP BY 1),
t_5_Boss AS (SELECT
  t_6_Manages.boss AS name
FROM
  t_2_Manages AS t_6_Manages
GROUP BY 1)
SELECT
  Person.name AS name
FROM
  t_0_Person AS Person
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    t_5_Boss AS t_4_Boss
  WHERE
    (t_4_Boss.name = Person.name)) IS NULL) ORDER BY name NULLS LAST;
