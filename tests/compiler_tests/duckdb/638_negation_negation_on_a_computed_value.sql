-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

SELECT
  x_3.unnested_pod AS x
FROM
  (select unnest([1, 2, 3]) as unnested_pod) as x_3
WHERE
  ((SELECT
    MIN((CASE WHEN x_6.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    (select unnest([1, 2, 3]) as unnested_pod) as x_10, (select unnest([0]) as unnested_pod) as x_6
  WHERE
    (((x_3.unnested_pod) % NULLIF(2, 0)) = 0) AND
    (x_3.unnested_pod = x_10.unnested_pod)) IS NULL) ORDER BY x;