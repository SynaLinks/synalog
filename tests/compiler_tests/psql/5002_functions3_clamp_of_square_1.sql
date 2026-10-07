-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

WITH t_1_V AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      3 AS x,
      'ab' AS s
   UNION ALL
  
    SELECT
      2 AS k,
      -4 AS x,
      'hello' AS s
   UNION ALL
  
    SELECT
      3 AS k,
      0 AS x,
      '' AS s
   UNION ALL
  
    SELECT
      4 AS k,
      CAST(null AS numeric) AS x,
      'x' AS s
   UNION ALL
  
    SELECT
      5 AS k,
      12 AS x,
      CAST(null AS text) AS s
   UNION ALL
  
    SELECT
      6 AS k,
      7 AS x,
      'seven' AS s
  
) AS UNUSED_TABLE_NAME  )
SELECT
  (CASE WHEN 0 IS NULL OR (CASE WHEN ((t_0_V.x) * (t_0_V.x)) IS NULL OR 10 IS NULL THEN NULL ELSE LEAST(((t_0_V.x) * (t_0_V.x)), 10) END) IS NULL THEN NULL ELSE GREATEST(0, (CASE WHEN ((t_0_V.x) * (t_0_V.x)) IS NULL OR 10 IS NULL THEN NULL ELSE LEAST(((t_0_V.x) * (t_0_V.x)), 10) END)) END) AS v
FROM
  t_1_V AS t_0_V
WHERE
  (t_0_V.k = 1);