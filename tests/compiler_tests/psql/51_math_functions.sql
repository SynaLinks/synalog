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
      1 AS x
   UNION ALL
  
    SELECT
      2 AS x
   UNION ALL
  
    SELECT
      3 AS x
  
) AS UNUSED_TABLE_NAME  ),
t_0_Computed AS (SELECT
  Numbers.x AS x,
  EXP(CAST(Numbers.x AS double precision)) AS e,
  LN(CAST(Numbers.x AS double precision)) AS l,
  SIN(CAST(Numbers.x AS double precision)) AS s,
  COS(CAST(Numbers.x AS double precision)) AS c,
  POW(Numbers.x, 2) AS p
FROM
  t_1_Numbers AS Numbers ORDER BY x)
SELECT
  Computed.x AS x,
  Computed.e AS e,
  Computed.l AS l,
  Computed.s AS s,
  Computed.c AS c,
  Computed.p AS p
FROM
  t_0_Computed AS Computed ORDER BY x;