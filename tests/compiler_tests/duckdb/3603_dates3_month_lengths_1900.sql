-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

SELECT
  x_3.unnested_pod AS m,
  CASE WHEN (x_3.unnested_pod = 2) THEN CASE WHEN (((((1900) % NULLIF(4, 0)) = 0) AND (((1900) % NULLIF(100, 0)) != 0)) OR (((1900) % NULLIF(400, 0)) = 0)) THEN 29 ELSE 28 END ELSE (CASE WHEN ((x_3.unnested_pod) - (1)) < 0 THEN NULL ELSE array_extract([31, 0, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31], CAST(((x_3.unnested_pod) - (1)) + 1 AS BIGINT)) END) END AS n
FROM
  (select unnest(Range(13)) as unnested_pod) as x_3
WHERE
  (x_3.unnested_pod > 0) ORDER BY m;