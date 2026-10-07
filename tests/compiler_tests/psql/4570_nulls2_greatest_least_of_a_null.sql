-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

WITH t_0_Gv AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      CAST(null AS numeric) AS b
   UNION ALL
  
    SELECT
      2 AS a,
      5 AS b
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Gv.a AS a,
  (CASE WHEN Gv.a IS NULL OR Gv.b IS NULL THEN NULL ELSE GREATEST(Gv.a, Gv.b) END) AS g,
  (CASE WHEN Gv.a IS NULL OR Gv.b IS NULL THEN NULL ELSE LEAST(Gv.a, Gv.b) END) AS l,
  (CASE WHEN Gv.a IS NULL OR CAST(2.5 AS double precision) IS NULL OR COALESCE(Gv.b, 0) IS NULL THEN NULL ELSE GREATEST(Gv.a, CAST(2.5 AS double precision), COALESCE(Gv.b, 0)) END) AS h
FROM
  t_0_Gv AS Gv ORDER BY a;