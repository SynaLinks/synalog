-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists synalog_home;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

DO $$ BEGIN if not exists (select 1 from pg_type where typname = 'synalogrecord10283957592820413579') then create type synalogrecord10283957592820413579 as ("city" text); end if; END $$;
DO $$ BEGIN if not exists (select 1 from pg_type where typname = 'synalogrecord7096894048929051764') then create type synalogrecord7096894048929051764 as ("age" numeric, "home" synalogrecord10283957592820413579, "name" text, "tags" text[]); end if; END $$;
WITH t_1_P AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      ROW(31, ROW('paris')::synalogrecord10283957592820413579, 'ann', ARRAY['a', 'b'])::synalogrecord7096894048929051764 AS r
   UNION ALL
  
    SELECT
      2 AS id,
      ROW(null, ROW('oslo')::synalogrecord10283957592820413579, 'bob', CAST('{}' AS text[]))::synalogrecord7096894048929051764 AS r
   UNION ALL
  
    SELECT
      3 AS id,
      ROW(45, ROW('paris')::synalogrecord10283957592820413579, 'cid', ARRAY['c'])::synalogrecord7096894048929051764 AS r
   UNION ALL
  
    SELECT
      4 AS id,
      ROW(22, ROW(null)::synalogrecord10283957592820413579, 'dee', ARRAY['a'])::synalogrecord7096894048929051764 AS r
   UNION ALL
  
    SELECT
      5 AS id,
      ROW(38, ROW('rome')::synalogrecord10283957592820413579, 'eve', ARRAY['b', 'c', 'd'])::synalogrecord7096894048929051764 AS r
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_P.id AS id
FROM
  t_1_P AS P, t_1_P AS t_0_P
WHERE
  (t_0_P.id IS DISTINCT FROM 4) AND
  (P.id = 4) AND
  (ARRAY[ROW((t_0_P.r).tags)] = ARRAY[ROW((P.r).tags)]) ORDER BY id;