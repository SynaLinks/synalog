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
WITH t_1_Score AS (SELECT * FROM (
  
    SELECT
      'Alice' AS player,
      85 AS points
   UNION ALL
  
    SELECT
      'Bob' AS player,
      92 AS points
   UNION ALL
  
    SELECT
      'Charlie' AS player,
      78 AS points
  
) AS UNUSED_TABLE_NAME  ),
t_0_MaxScore AS (SELECT
  MAX(Score.points) AS logica_value
FROM
  t_1_Score AS Score),
t_2_MinScore AS (SELECT
  MIN(t_3_Score.points) AS logica_value
FROM
  t_1_Score AS t_3_Score),
t_4_PlayerCount AS (SELECT
  SUM(1) AS logica_value
FROM
  t_1_Score AS t_5_Score)
SELECT
  MaxScore.logica_value AS max_score,
  MinScore.logica_value AS min_score,
  PlayerCount.logica_value AS count
FROM
  t_0_MaxScore AS MaxScore, t_2_MinScore AS MinScore, t_4_PlayerCount AS PlayerCount;