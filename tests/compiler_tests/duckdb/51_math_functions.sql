-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

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
  EXP(CAST(Numbers.x AS DOUBLE)) AS e,
  LN(CAST(Numbers.x AS DOUBLE)) AS l,
  SIN(CAST(Numbers.x AS DOUBLE)) AS s,
  COS(CAST(Numbers.x AS DOUBLE)) AS c,
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