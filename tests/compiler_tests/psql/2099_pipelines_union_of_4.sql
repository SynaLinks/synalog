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
WITH t_1_W_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      x_4 AS x
    FROM
      UNNEST(ARRAY[0, 1]::numeric[]) as x_4
   UNION ALL
  
    SELECT
      x_6 AS x
    FROM
      UNNEST(ARRAY[2, 3]::numeric[]) as x_6
   UNION ALL
  
    SELECT
      x_8 AS x
    FROM
      UNNEST(ARRAY[4, 5]::numeric[]) as x_8
   UNION ALL
  
    SELECT
      x_10 AS x
    FROM
      UNNEST(ARRAY[6, 7]::numeric[]) as x_10
  
) AS UNUSED_TABLE_NAME  ),
t_0_W AS (SELECT
  W_MultBodyAggAux.x AS x
FROM
  t_1_W_MultBodyAggAux AS W_MultBodyAggAux
GROUP BY W_MultBodyAggAux.x)
SELECT
  SUM(1) AS n
FROM
  t_0_W AS W;