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
WITH t_1_Numbers AS (SELECT * FROM (
  
    SELECT
      4 AS x
   UNION ALL
  
    SELECT
      9 AS x
   UNION ALL
  
    SELECT
      16 AS x
   UNION ALL
  
    SELECT
      25 AS x
  
) AS UNUSED_TABLE_NAME  ),
t_0_Computed AS (SELECT
  Numbers.x AS x,
  SQRT(Numbers.x) AS sqrt_x,
  ABS(- ((1) * (Numbers.x))) AS abs_neg,
  ((Numbers.x) * (2)) AS doubled
FROM
  t_1_Numbers AS Numbers ORDER BY x)
SELECT
  Computed.x AS x,
  Computed.sqrt_x AS sqrt_x,
  Computed.abs_neg AS abs_neg,
  Computed.doubled AS doubled
FROM
  t_0_Computed AS Computed ORDER BY x;