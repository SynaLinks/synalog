-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

WITH t_0_R AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      5 AS x,
      'b' AS s,
      true AS b
   UNION ALL
  
    SELECT
      2 AS k,
      CAST(null AS numeric) AS x,
      'a' AS s,
      false AS b
   UNION ALL
  
    SELECT
      3 AS k,
      2 AS x,
      CAST(null AS text) AS s,
      true AS b
   UNION ALL
  
    SELECT
      4 AS k,
      5 AS x,
      'c' AS s,
      CAST(null AS bool) AS b
   UNION ALL
  
    SELECT
      5 AS k,
      -1 AS x,
      'B' AS s,
      false AS b
   UNION ALL
  
    SELECT
      6 AS k,
      2 AS x,
      'a' AS s,
      true AS b
   UNION ALL
  
    SELECT
      7 AS k,
      CAST(null AS numeric) AS x,
      CAST(null AS text) AS s,
      false AS b
   UNION ALL
  
    SELECT
      8 AS k,
      9 AS x,
      'aa' AS s,
      true AS b
  
) AS UNUSED_TABLE_NAME  )
SELECT
  R.k AS k,
  R.x AS x,
  R.s AS s
FROM
  t_0_R AS R ORDER BY x nulls first, k LIMIT 1;