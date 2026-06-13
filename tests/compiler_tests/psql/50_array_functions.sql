-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;


DO $$
BEGIN
-- Logica type: logicarecord481217614
if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord481217614') then create type logicarecord481217614 as (r logicarecord893574736); end if;
-- Logica type: logicarecord86796764
if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord86796764') then create type logicarecord86796764 as (s text); end if;
END $$;
WITH t_1_Lists AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      ARRAY[1, 2]::numeric[] AS a,
      ARRAY[3, 4]::numeric[] AS b
   UNION ALL
  
    SELECT
      2 AS id,
      ARRAY[5]::numeric[] AS a,
      ARRAY[6, 7, 8]::numeric[] AS b
  
) AS UNUSED_TABLE_NAME  ),
t_0_Concatenated AS (SELECT
  Lists.id AS id,
  COALESCE(ARRAY_LENGTH(Lists.a || Lists.b, 1), 0) AS total_size,
  (Lists.a || Lists.b)[0 + 1] AS head
FROM
  t_1_Lists AS Lists ORDER BY id)
SELECT
  Concatenated.id AS id,
  Concatenated.total_size AS total_size,
  Concatenated.head AS head
FROM
  t_0_Concatenated AS Concatenated ORDER BY id;