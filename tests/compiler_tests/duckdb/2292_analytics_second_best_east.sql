-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;


-- Logica type: logicarecord481217614
drop type if exists logicarecord481217614 cascade; create type logicarecord481217614 as struct(r logicarecord893574736);

-- Logica type: logicarecord383307722
drop type if exists logicarecord383307722 cascade; create type logicarecord383307722 as struct(a timestamp);

-- Logica type: logicarecord519939597
drop type if exists logicarecord519939597 cascade; create type logicarecord519939597 as struct(args text[], predicate text);
WITH t_0_S AS (SELECT * FROM (
  
    SELECT
      'north' AS r,
      1 AS d,
      5 AS v
   UNION ALL
  
    SELECT
      'north' AS r,
      2 AS d,
      8 AS v
   UNION ALL
  
    SELECT
      'north' AS r,
      3 AS d,
      3 AS v
   UNION ALL
  
    SELECT
      'north' AS r,
      5 AS d,
      9 AS v
   UNION ALL
  
    SELECT
      'north' AS r,
      6 AS d,
      1 AS v
   UNION ALL
  
    SELECT
      'south' AS r,
      1 AS d,
      7 AS v
   UNION ALL
  
    SELECT
      'south' AS r,
      2 AS d,
      7 AS v
   UNION ALL
  
    SELECT
      'south' AS r,
      4 AS d,
      2 AS v
   UNION ALL
  
    SELECT
      'south' AS r,
      5 AS d,
      6 AS v
   UNION ALL
  
    SELECT
      'east' AS r,
      2 AS d,
      4 AS v
   UNION ALL
  
    SELECT
      'east' AS r,
      3 AS d,
      11 AS v
   UNION ALL
  
    SELECT
      'east' AS r,
      4 AS d,
      6 AS v
   UNION ALL
  
    SELECT
      'east' AS r,
      5 AS d,
      10 AS v
   UNION ALL
  
    SELECT
      'east' AS r,
      7 AS d,
      3 AS v
  
) AS UNUSED_TABLE_NAME  ),
t_2_Better_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      t_3_S.d AS d,
      1 AS n
    FROM
      t_0_S AS t_3_S, t_0_S AS t_4_S
    WHERE
      (t_4_S.v > t_3_S.v) AND
      (t_3_S.r = 'east') AND
      (t_4_S.r = 'east')
   UNION ALL
  
    SELECT
      t_5_S.d AS d,
      1 AS n
    FROM
      t_0_S AS t_5_S, t_0_S AS t_6_S
    WHERE
      (t_6_S.d < t_5_S.d) AND
      (t_5_S.r = 'east') AND
      (t_6_S.r = 'east') AND
      (t_6_S.v = t_5_S.v)
  
) AS UNUSED_TABLE_NAME  ),
t_1_Better AS (SELECT
  Better_MultBodyAggAux.d AS d,
  SUM(Better_MultBodyAggAux.n) AS n
FROM
  t_2_Better_MultBodyAggAux AS Better_MultBodyAggAux
GROUP BY Better_MultBodyAggAux.d)
SELECT
  S.d AS d,
  S.v AS v
FROM
  t_0_S AS S, t_1_Better AS Better
WHERE
  (S.r = 'east') AND
  (Better.d = S.d) AND
  (Better.n = 1);