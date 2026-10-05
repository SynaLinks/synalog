-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

WITH t_1_V AS (SELECT * FROM (
  
    SELECT
      'a' AS g,
      'p' AS n,
      1 AS x
   UNION ALL
  
    SELECT
      'a' AS g,
      'q' AS n,
      5 AS x
   UNION ALL
  
    SELECT
      'b' AS g,
      'r' AS n,
      2 AS x
  
) AS UNUSED_TABLE_NAME  ),
t_2_M AS (SELECT
  t_3_V.g AS g,
  MAX(t_3_V.x) AS m
FROM
  t_1_V AS t_3_V
GROUP BY t_3_V.g)
SELECT
  V.g AS g,
  V.n AS n
FROM
  t_1_V AS V, t_2_M AS t_0_M
WHERE
  (t_0_M.g = V.g) AND
  (t_0_M.m = V.x) ORDER BY g;