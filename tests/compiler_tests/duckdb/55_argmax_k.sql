-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;


-- Logica type: logicarecord481217614
drop type if exists logicarecord481217614 cascade; create type logicarecord481217614 as struct(r logicarecord893574736);

-- Logica type: logicarecord383307722
drop type if exists logicarecord383307722 cascade; create type logicarecord383307722 as struct(a timestamp);

-- Logica type: logicarecord183863755
drop type if exists logicarecord183863755 cascade; create type logicarecord183863755 as struct(arg text, value numeric);

-- Logica type: logicarecord519939597
drop type if exists logicarecord519939597 cascade; create type logicarecord519939597 as struct(args text[], predicate text);

-- Logica type: logicarecord909294181
drop type if exists logicarecord909294181 cascade; create type logicarecord909294181 as struct(arg_1 text, lim numeric, value_1 numeric);
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
  (array_agg(Score.player order by Score.points desc))[1:2] AS top2,
  (array_agg(Score.player order by Score.points))[1:1] AS bottom1
FROM
  t_3_Score AS Score
GROUP BY Score.team ORDER BY team)
SELECT
  TeamLeaders.team AS team,
  TeamLeaders.top2 AS top2,
  TeamLeaders.bottom1 AS bottom1
FROM
  t_0_TeamLeaders AS TeamLeaders ORDER BY team;