-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

WITH t_2_R AS (SELECT * FROM (
  
    SELECT
      'a' AS k,
      10 AS v
   UNION ALL
  
    SELECT
      'a' AS k,
      20 AS v
   UNION ALL
  
    SELECT
      'b' AS k,
      5 AS v
  
) AS UNUSED_TABLE_NAME  ),
t_1_T AS (SELECT
  R.k AS k,
  SUM(R.v) AS t
FROM
  t_2_R AS R
GROUP BY R.k)
SELECT
  t_0_T.k AS k
FROM
  t_1_T AS t_0_T
WHERE
  (t_0_T.t > 10) ORDER BY k;