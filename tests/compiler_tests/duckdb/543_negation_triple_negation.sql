-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_2_NotA AS (SELECT
  x_17.unnested_pod AS x
FROM
  (select unnest([1, 2]) as unnested_pod) as x_17
WHERE
  ((SELECT
    MIN((CASE WHEN x_20.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    (select unnest([0]) as unnested_pod) as x_20
  WHERE
    (x_17.unnested_pod = 1)) IS NULL)),
t_0_NotNotA AS (SELECT
  x_10.unnested_pod AS x
FROM
  (select unnest([1, 2]) as unnested_pod) as x_10
WHERE
  ((SELECT
    MIN((CASE WHEN x_13.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    t_2_NotA AS NotA, (select unnest([0]) as unnested_pod) as x_13
  WHERE
    (NotA.x = x_10.unnested_pod)) IS NULL))
SELECT
  x_3.unnested_pod AS x
FROM
  (select unnest([1, 2]) as unnested_pod) as x_3
WHERE
  ((SELECT
    MIN((CASE WHEN x_6.unnested_pod = 0 THEN 1 ELSE NULL END)) AS logica_value
  FROM
    t_0_NotNotA AS NotNotA, (select unnest([0]) as unnested_pod) as x_6
  WHERE
    (NotNotA.x = x_3.unnested_pod)) IS NULL);