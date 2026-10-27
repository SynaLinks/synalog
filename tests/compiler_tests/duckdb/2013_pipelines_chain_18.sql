-- Initializing DuckDB environment.
create schema if not exists synalog_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists synalogrecord893574736 cascade; create type synalogrecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

SELECT
  x_39.unnested_pod AS x
FROM
  (select unnest([1, 2, 3, 4, 5, 6, 7, 8]) as unnested_pod) as x_39
WHERE
  (x_39.unnested_pod IS DISTINCT FROM 18) AND
  (x_39.unnested_pod IS DISTINCT FROM 17) AND
  (x_39.unnested_pod IS DISTINCT FROM 16) AND
  (x_39.unnested_pod IS DISTINCT FROM 15) AND
  (x_39.unnested_pod IS DISTINCT FROM 14) AND
  (x_39.unnested_pod IS DISTINCT FROM 13) AND
  (x_39.unnested_pod IS DISTINCT FROM 12) AND
  (x_39.unnested_pod IS DISTINCT FROM 11) AND
  (x_39.unnested_pod IS DISTINCT FROM 10) AND
  (x_39.unnested_pod IS DISTINCT FROM 9) AND
  (x_39.unnested_pod IS DISTINCT FROM 8) AND
  (x_39.unnested_pod IS DISTINCT FROM 7) AND
  (x_39.unnested_pod IS DISTINCT FROM 6) AND
  (x_39.unnested_pod IS DISTINCT FROM 5) AND
  (x_39.unnested_pod IS DISTINCT FROM 4) AND
  (x_39.unnested_pod IS DISTINCT FROM 3) AND
  (x_39.unnested_pod IS DISTINCT FROM 2) AND
  (x_39.unnested_pod IS DISTINCT FROM 1);