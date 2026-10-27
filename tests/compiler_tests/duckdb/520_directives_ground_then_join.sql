-- Initializing DuckDB environment.
create schema if not exists synalog_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists synalogrecord893574736 cascade; create type synalogrecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

DROP TABLE IF EXISTS synalog_home.G;
CREATE TABLE synalog_home.G AS SELECT
  x_1.unnested_pod AS k
FROM
  (select unnest([1]) as unnested_pod) as x_1;

-- Interacting with table synalog_home.G

WITH t_0_N AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      'a' AS s
   UNION ALL
  
    SELECT
      2 AS k,
      'b' AS s
  
) AS UNUSED_TABLE_NAME  )
SELECT
  G.k AS k,
  N.s AS s
FROM
  synalog_home.G AS G, t_0_N AS N
WHERE
  (N.k IS NOT DISTINCT FROM G.k);