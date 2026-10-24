-- Initializing DuckDB environment.
create schema if not exists synalog_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists synalogrecord893574736 cascade; create type synalogrecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_0_C AS (SELECT
  ARRAY_AGG(DISTINCT x_3.unnested_pod ORDER BY x_3.unnested_pod) AS s
FROM
  (select unnest(SPLIT('a b a', ' ')) as unnested_pod) as x_3)
SELECT
  LEN(C.s) AS n
FROM
  t_0_C AS C;