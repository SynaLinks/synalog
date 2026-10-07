-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

WITH t_3_T AS (SELECT * FROM (
  
    SELECT
      'a' AS g,
      0 AS x
   UNION ALL
  
    SELECT
      'b' AS g,
      1 AS x
   UNION ALL
  
    SELECT
      'b' AS g,
      3 AS x
  
) AS UNUSED_TABLE_NAME  ),
t_1_M AS (SELECT
  t_2_T.g AS g,
  MIN(t_2_T.x) AS m
FROM
  t_3_T AS t_2_T
GROUP BY t_2_T.g),
t_4_S AS (SELECT
  t_5_T.g AS g,
  SUM(t_5_T.x) AS t
FROM
  t_3_T AS t_5_T
GROUP BY t_5_T.g)
SELECT
  t_0_M.g AS g,
  (CAST(t_0_M.m AS double precision) / NULLIF(S.t, 0)) AS share
FROM
  t_1_M AS t_0_M, t_4_S AS S
WHERE
  (S.g = t_0_M.g) ORDER BY g;