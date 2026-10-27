-- Initializing DuckDB environment.
create schema if not exists synalog_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists synalogrecord893574736 cascade; create type synalogrecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

SELECT
  providers.npi AS npi
FROM
  providers
WHERE
  ((SELECT
    MIN((CASE WHEN x_10.unnested_pod = 0 THEN 1 ELSE NULL END)) AS synalog_value
  FROM
    ground_truth, (select unnest([0]) as unnested_pod) as x_10
  WHERE
    (providers.npi IS NOT DISTINCT FROM ground_truth.npi) AND
    (providers.scheme IS NOT DISTINCT FROM ground_truth.scheme)) IS NULL);