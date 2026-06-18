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

-- Logica type: logicarecord848101342
drop type if exists logicarecord848101342 cascade; create type logicarecord848101342 as struct(a text, v numeric);
WITH t_2_Score AS (SELECT * FROM (
  
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
t_0_BestPlayer AS (SELECT
  argmax(Score.player, Score.points) AS logica_value
FROM
  t_2_Score AS Score),
t_3_WorstPlayer AS (SELECT
  argmin(t_4_Score.player, t_4_Score.points) AS logica_value
FROM
  t_2_Score AS t_4_Score)
SELECT
  BestPlayer.logica_value AS best,
  WorstPlayer.logica_value AS worst
FROM
  t_0_BestPlayer AS BestPlayer, t_3_WorstPlayer AS WorstPlayer;