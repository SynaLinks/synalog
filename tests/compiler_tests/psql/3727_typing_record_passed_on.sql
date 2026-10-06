-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

DO $$ BEGIN if not exists (select 1 from pg_type where typname = 'logicarecord5254081060469241495') then create type logicarecord5254081060469241495 as ("name" text, "score" numeric, "tags" text[]); end if; END $$;
WITH t_0_P AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      ROW('a', CAST(1.5 AS double precision), ARRAY['x'])::logicarecord5254081060469241495 AS r
   UNION ALL
  
    SELECT
      2 AS id,
      ROW('b', null, CAST('{}' AS text[]))::logicarecord5254081060469241495 AS r
  
) AS UNUSED_TABLE_NAME  )
SELECT
  P.id AS id,
  (P.r).name AS name,
  CARDINALITY((P.r).tags) AS n,
  (P.r).score AS s
FROM
  t_0_P AS P ORDER BY id;