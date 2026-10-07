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
WITH t_2_V AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      1 AS x
  
) AS UNUSED_TABLE_NAME  ),
t_1_A AS (SELECT
  V.x AS x
FROM
  t_2_V AS V
GROUP BY V.x),
t_3_B AS (SELECT
  t_4_V.x AS x
FROM
  t_2_V AS t_4_V
GROUP BY t_4_V.x),
t_0_U AS (SELECT * FROM (
  
    SELECT
      A.x AS x
    FROM
      t_1_A AS A
   UNION ALL
  
    SELECT
      B.x AS x
    FROM
      t_3_B AS B
  
) AS UNUSED_TABLE_NAME  )
SELECT
  SUM(1) AS n
FROM
  t_0_U AS U;