-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

WITH t_2_V AS (SELECT * FROM (
  
    SELECT
      'a' AS g,
      5 AS x
   UNION ALL
  
    SELECT
      'a' AS g,
      6 AS x
   UNION ALL
  
    SELECT
      'b' AS g,
      1 AS x
  
) AS UNUSED_TABLE_NAME  ),
t_1_G AS (SELECT
  V.g AS g
FROM
  t_2_V AS V
GROUP BY V.g),
t_3_Big AS (SELECT
  t_4_V.g AS g
FROM
  t_2_V AS t_4_V
WHERE
  (t_4_V.x > 4)
GROUP BY t_4_V.g)
SELECT
  t_0_G.g AS g
FROM
  t_1_G AS t_0_G
WHERE
  (CAST((SELECT
    MIN((CASE WHEN x_6 = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    t_3_Big AS Big, UNNEST(ARRAY[0]) as x_6
  WHERE
    (Big.g = t_0_G.g)) AS numeric) IS NULL);