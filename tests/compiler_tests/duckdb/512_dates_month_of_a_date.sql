-- Initializing DuckDB environment.
create schema if not exists synalog_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists synalogrecord893574736 cascade; create type synalogrecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;


-- Synalog type: synalogrecord481217614
drop type if exists synalogrecord481217614 cascade; create type synalogrecord481217614 as struct(r synalogrecord893574736);

-- Synalog type: synalogrecord383307722
drop type if exists synalogrecord383307722 cascade; create type synalogrecord383307722 as struct(a timestamp);

-- Synalog type: synalogrecord519939597
drop type if exists synalogrecord519939597 cascade; create type synalogrecord519939597 as struct(args text[], predicate text);
SELECT
  SUBSTR(x_2.unnested_pod, 1, 7) AS m,
  SUM(1) AS n
FROM
  (select unnest(['2024-01-03', '2024-01-20', '2024-02-11']::text[]) as unnested_pod) as x_2
GROUP BY SUBSTR(x_2.unnested_pod, 1, 7) ORDER BY m;