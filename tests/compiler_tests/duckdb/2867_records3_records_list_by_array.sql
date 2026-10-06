-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_8_V AS (SELECT * FROM (
  
    SELECT
      3 AS k,
      'b' AS n
   UNION ALL
  
    SELECT
      1 AS k,
      'c' AS n
   UNION ALL
  
    SELECT
      2 AS k,
      'a' AS n
  
) AS UNUSED_TABLE_NAME  ),
t_5_L AS (SELECT
  ARRAY_AGG({n: V.n} order by V.k) AS l
FROM
  t_8_V AS V),
t_0_J AS (SELECT
  ARRAY_AGG(array_extract(t_4_L.l,  CAST(x_12.unnested_pod+1 AS BIGINT)).n order by x_12.unnested_pod) AS s
FROM
  t_5_L AS t_4_L, (select unnest(Range(LEN(t_4_L.l))) as unnested_pod) as x_12)
SELECT
  ARRAY_TO_STRING(J.s, '-') AS s
FROM
  t_0_J AS J;