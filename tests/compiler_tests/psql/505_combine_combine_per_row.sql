-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

WITH t_1_V AS (SELECT * FROM (
  
    SELECT
      'a' AS g,
      1 AS x
   UNION ALL
  
    SELECT
      'a' AS g,
      2 AS x
   UNION ALL
  
    SELECT
      'b' AS g,
      4 AS x
  
) AS UNUSED_TABLE_NAME  ),
t_2_G AS (SELECT
  t_3_V.g AS g
FROM
  t_1_V AS t_3_V
GROUP BY t_3_V.g)
SELECT
  t_0_G.g AS g,
  CAST((SELECT
  SUM((CASE WHEN x_7 = 0 THEN V.x ELSE NULL END)) AS logica_value
FROM
  t_1_V AS V, UNNEST(ARRAY[0]) as x_7
WHERE
  (V.g = t_0_G.g)) AS numeric) AS t
FROM
  t_2_G AS t_0_G ORDER BY g;