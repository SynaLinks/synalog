-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

WITH t_0_E AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      'ann' AS name,
      10 AS dept,
      CAST(null AS numeric) AS boss
   UNION ALL
  
    SELECT
      2 AS id,
      'bob' AS name,
      10 AS dept,
      1 AS boss
   UNION ALL
  
    SELECT
      3 AS id,
      'cid' AS name,
      20 AS dept,
      1 AS boss
   UNION ALL
  
    SELECT
      4 AS id,
      'dee' AS name,
      CAST(null AS numeric) AS dept,
      2 AS boss
   UNION ALL
  
    SELECT
      5 AS id,
      'eve' AS name,
      30 AS dept,
      3 AS boss
   UNION ALL
  
    SELECT
      6 AS id,
      'fay' AS name,
      20 AS dept,
      CAST(null AS numeric) AS boss
  
) AS UNUSED_TABLE_NAME  ),
t_2_Boss AS (SELECT
  t_3_E.boss AS id
FROM
  t_0_E AS t_3_E
WHERE
  (t_3_E.boss IS NOT null)
GROUP BY t_3_E.boss)
SELECT
  E.name AS name
FROM
  t_0_E AS E
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_5 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    t_2_Boss AS t_1_Boss, UNNEST(ARRAY[0]) as x_5
  WHERE
    (t_1_Boss.id = E.id)) AS numeric) IS NULL) ORDER BY name;