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
-- Logica type: logicarecord183863755
if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord183863755') then create type logicarecord183863755 as (arg text, value numeric); end if;
-- Logica type: logicarecord995901280
if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord995901280') then create type logicarecord995901280 as (arg text, lim numeric, value numeric); end if;
END $$;
WITH t_3_Score AS (SELECT * FROM (
  
    SELECT
      'A' AS team,
      'p1' AS player,
      10 AS points
   UNION ALL
  
    SELECT
      'A' AS team,
      'p2' AS player,
      30 AS points
   UNION ALL
  
    SELECT
      'A' AS team,
      'p3' AS player,
      20 AS points
   UNION ALL
  
    SELECT
      'B' AS team,
      'p4' AS player,
      50 AS points
   UNION ALL
  
    SELECT
      'B' AS team,
      'p5' AS player,
      40 AS points
  
) AS UNUSED_TABLE_NAME  ),
t_0_TeamLeaders AS (SELECT
  Score.team AS team,
  (ARRAY_AGG(Score.player order by Score.points desc))[1:2] AS top2,
  (ARRAY_AGG(Score.player order by Score.points))[1:1] AS bottom1
FROM
  t_3_Score AS Score
GROUP BY Score.team ORDER BY team)
SELECT
  TeamLeaders.team AS team,
  TeamLeaders.top2 AS top2,
  TeamLeaders.bottom1 AS bottom1
FROM
  t_0_TeamLeaders AS TeamLeaders ORDER BY team;