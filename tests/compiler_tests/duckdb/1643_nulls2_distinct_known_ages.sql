-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_2_Person AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      'ann' AS name,
      30 AS age
   UNION ALL
  
    SELECT
      2 AS id,
      'bob' AS name,
      null AS age
   UNION ALL
  
    SELECT
      3 AS id,
      'cid' AS name,
      25 AS age
   UNION ALL
  
    SELECT
      4 AS id,
      null AS name,
      40 AS age
   UNION ALL
  
    SELECT
      5 AS id,
      'eve' AS name,
      null AS age
  
) AS UNUSED_TABLE_NAME  ),
t_1_Age AS (SELECT
  Person.age AS age
FROM
  t_2_Person AS Person
WHERE
  ((SELECT
    MIN((CASE WHEN x_4.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    (select unnest([0]) as unnested_pod) as x_4
  WHERE
    (Person.age IS NULL)) IS NULL)
GROUP BY Person.age)
SELECT
  SUM(1) AS n
FROM
  t_1_Age AS t_0_Age;
