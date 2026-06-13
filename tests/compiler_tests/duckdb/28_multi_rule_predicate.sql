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
WITH t_1_Number AS (SELECT * FROM (
  
    SELECT
      x_6.unnested_pod AS col0
    FROM
      (select unnest(Range(5)) as unnested_pod) as x_6
   UNION ALL
  
    SELECT
      x_8.unnested_pod AS col0
    FROM
      (select unnest([10, 11, 12, 13, 14]::double[]) as unnested_pod) as x_8
  
) AS UNUSED_TABLE_NAME  ),
t_0_Stats_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      E'all' AS col0,
      1 AS count
    FROM
      t_1_Number AS Number
   UNION ALL
  
    SELECT
      E'even' AS col0,
      1 AS count
    FROM
      t_1_Number AS t_2_Number
    WHERE
      (((t_2_Number.col0) % (2)) = 0)
   UNION ALL
  
    SELECT
      E'odd' AS col0,
      1 AS count
    FROM
      t_1_Number AS t_3_Number
    WHERE
      (((t_3_Number.col0) % (2)) != 0)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Stats_MultBodyAggAux.col0 AS col0,
  SUM(Stats_MultBodyAggAux.count) AS count
FROM
  t_0_Stats_MultBodyAggAux AS Stats_MultBodyAggAux
GROUP BY Stats_MultBodyAggAux.col0;