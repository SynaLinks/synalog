-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_2_Manages AS (SELECT * FROM (
  
    SELECT
      'ceo' AS boss,
      'cto' AS report
   UNION ALL
  
    SELECT
      'ceo' AS boss,
      'cfo' AS report
   UNION ALL
  
    SELECT
      'cto' AS boss,
      'dev1' AS report
   UNION ALL
  
    SELECT
      'cto' AS boss,
      'dev2' AS report
   UNION ALL
  
    SELECT
      'cto' AS boss,
      'ops' AS report
   UNION ALL
  
    SELECT
      'cfo' AS boss,
      'acct' AS report
   UNION ALL
  
    SELECT
      'ops' AS boss,
      'sre1' AS report
   UNION ALL
  
    SELECT
      'ops' AS boss,
      'sre2' AS report
   UNION ALL
  
    SELECT
      'dev1' AS boss,
      'intern' AS report
  
) AS UNUSED_TABLE_NAME  ),
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
GROUP BY Person_MultBodyAggAux.name),
t_5_Boss AS (SELECT
  t_6_Manages.boss AS name
FROM
  t_2_Manages AS t_6_Manages
GROUP BY t_6_Manages.boss)
SELECT
  Person.name AS name
FROM
  t_0_Person AS Person
WHERE
  ((SELECT
    MIN((CASE WHEN x_10.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    t_5_Boss AS t_4_Boss, (select unnest([0]) as unnested_pod) as x_10
  WHERE
    (t_4_Boss.name = Person.name)) IS NULL) ORDER BY name;
