-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;


-- Logica type: logicarecord481217614
drop type if exists logicarecord481217614 cascade; create type logicarecord481217614 as struct(r logicarecord893574736);

-- Logica type: logicarecord383307722
drop type if exists logicarecord383307722 cascade; create type logicarecord383307722 as struct(a timestamp);

-- Logica type: logicarecord6083990
drop type if exists logicarecord6083990 cascade; create type logicarecord6083990 as struct(x numeric, y numeric);

-- Logica type: logicarecord519939597
drop type if exists logicarecord519939597 cascade; create type logicarecord519939597 as struct(args text[], predicate text);
WITH t_3_V AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      3 AS x,
      'ab' AS s
   UNION ALL
  
    SELECT
      2 AS k,
      -4 AS x,
      'hello' AS s
   UNION ALL
  
    SELECT
      3 AS k,
      0 AS x,
      '' AS s
   UNION ALL
  
    SELECT
      4 AS k,
      null AS x,
      'x' AS s
   UNION ALL
  
    SELECT
      5 AS k,
      12 AS x,
      null AS s
   UNION ALL
  
    SELECT
      6 AS k,
      7 AS x,
      'seven' AS s
  
) AS UNUSED_TABLE_NAME  ),
t_0_Q_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      V.k AS a,
      t_1_V.k AS b
    FROM
      t_3_V AS V, t_3_V AS t_1_V
    WHERE
      (V.k < t_1_V.k) AND
      (((V.x) * (V.x)) = ((((t_1_V.x) * (t_1_V.x))) + (7)))
   UNION ALL
  
    SELECT
      t_4_V.k AS a,
      t_5_V.k AS b
    FROM
      t_3_V AS t_4_V, t_3_V AS t_5_V
    WHERE
      (t_4_V.k < t_5_V.k) AND
      (((t_4_V.x) * (t_4_V.x)) = ((t_5_V.x) * (t_5_V.x)))
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Q_MultBodyAggAux.a AS a,
  Q_MultBodyAggAux.b AS b
FROM
  t_0_Q_MultBodyAggAux AS Q_MultBodyAggAux
GROUP BY Q_MultBodyAggAux.a, Q_MultBodyAggAux.b ORDER BY a, b;