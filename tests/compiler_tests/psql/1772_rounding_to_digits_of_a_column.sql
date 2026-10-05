-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

WITH t_1_V AS (SELECT * FROM (
  
    SELECT
      'a' AS k,
      1 AS x
   UNION ALL
  
    SELECT
      'b' AS k,
      2 AS x
  
) AS UNUSED_TABLE_NAME  ),
t_2_T AS (SELECT
  SUM(t_3_V.x) AS t
FROM
  t_1_V AS t_3_V)
SELECT
  V.k AS k,
  ROUND(CAST(((100) * ((CAST(V.x AS double precision) / (t_0_T.t)))) AS numeric), 2) AS pct
FROM
  t_1_V AS V, t_2_T AS t_0_T ORDER BY k;
