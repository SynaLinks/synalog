-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

DO $$ BEGIN if not exists (select 1 from pg_type where typname = 'logicarecord1853525428886262866') then create type logicarecord1853525428886262866 as ("name" text, "tags" text[]); end if; END $$;
WITH t_1_R AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      ROW('a', ARRAY['x', 'y'])::logicarecord1853525428886262866 AS r
   UNION ALL
  
    SELECT
      2 AS id,
      ROW('b', CAST('{}' AS text[]))::logicarecord1853525428886262866 AS r
   UNION ALL
  
    SELECT
      3 AS id,
      ROW('c', ARRAY['y'])::logicarecord1853525428886262866 AS r
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_R.id AS id
FROM
  t_1_R AS t_0_R, UNNEST((t_0_R.r).tags) as x_3
WHERE
  ('y' = x_3) ORDER BY id;