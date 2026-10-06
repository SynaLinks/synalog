-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

WITH t_2_Person AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      'Ann' AS name,
      'red' AS team,
      34 AS age,
      true AS active
   UNION ALL
  
    SELECT
      2 AS id,
      'Bob' AS name,
      'red' AS team,
      CAST(null AS numeric) AS age,
      false AS active
   UNION ALL
  
    SELECT
      3 AS id,
      'Cid' AS name,
      'blue' AS team,
      52 AS age,
      true AS active
   UNION ALL
  
    SELECT
      4 AS id,
      'Dee' AS name,
      'blue' AS team,
      23 AS age,
      false AS active
   UNION ALL
  
    SELECT
      5 AS id,
      'Eve' AS name,
      'green' AS team,
      41 AS age,
      CAST(null AS bool) AS active
   UNION ALL
  
    SELECT
      6 AS id,
      'Fay' AS name,
      'red' AS team,
      19 AS age,
      true AS active
   UNION ALL
  
    SELECT
      7 AS id,
      'Gus' AS name,
      'gold' AS team,
      60 AS age,
      false AS active
  
) AS UNUSED_TABLE_NAME  ),
t_1_Team AS (SELECT
  Person.team AS team
FROM
  t_2_Person AS Person
GROUP BY Person.team),
t_3_Senior AS (SELECT
  t_4_Person.team AS team
FROM
  t_2_Person AS t_4_Person
WHERE
  t_4_Person.active AND
  (t_4_Person.age > 40)
GROUP BY t_4_Person.team)
SELECT
  t_0_Team.team AS team
FROM
  t_1_Team AS t_0_Team
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_6 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    t_3_Senior AS Senior, UNNEST(ARRAY[0]) as x_6
  WHERE
    (Senior.team = t_0_Team.team)) AS numeric) IS NULL) ORDER BY team;