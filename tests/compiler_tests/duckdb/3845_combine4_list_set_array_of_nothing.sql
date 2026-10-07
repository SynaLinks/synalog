-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

SELECT
  (SELECT
  ARRAY_AGG((CASE WHEN x_5.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
FROM
  (select unnest([0]) as unnested_pod) as x_5
WHERE
  (1 > 5)) AS l,
  (SELECT
  ARRAY_AGG(DISTINCT (CASE WHEN x_8.unnested_pod = 0 THEN 1 ELSE NULL END) ORDER BY (CASE WHEN x_8.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
FROM
  (select unnest([0]) as unnested_pod) as x_8
WHERE
  (1 > 5)) AS s,
  (SELECT
  ARRAY_AGG((CASE WHEN x_13.unnested_pod = 0 THEN {arg: 1, value: 1} ELSE NULL END).value order by (CASE WHEN x_13.unnested_pod = 0 THEN {arg: 1, value: 1} ELSE NULL END).arg) AS logica_value
FROM
  (select unnest([0]) as unnested_pod) as x_13
WHERE
  (1 > 5)) AS a;