-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

SELECT
  CASE WHEN (x_6.unnested_pod > 5) THEN 'big' ELSE 'small' END AS s,
  SUM(1) AS n
FROM
  (select unnest([1, 7, 9]) as unnested_pod) as x_6
GROUP BY CASE WHEN (x_6.unnested_pod > 5) THEN 'big' ELSE 'small' END ORDER BY s;