-- Initializing DuckDB environment.
create schema if not exists synalog_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists synalogrecord893574736 cascade; create type synalogrecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;


-- Synalog type: synalogrecord481217614
drop type if exists synalogrecord481217614 cascade; create type synalogrecord481217614 as struct(r synalogrecord893574736);

-- Synalog type: synalogrecord383307722
drop type if exists synalogrecord383307722 cascade; create type synalogrecord383307722 as struct(a timestamp);

-- Synalog type: synalogrecord399476892
drop type if exists synalogrecord399476892 cascade; create type synalogrecord399476892 as struct(n text, v numeric);

-- Synalog type: synalogrecord628258701
drop type if exists synalogrecord628258701 cascade; create type synalogrecord628258701 as struct(a synalogrecord399476892);

-- Synalog type: synalogrecord519939597
drop type if exists synalogrecord519939597 cascade; create type synalogrecord519939597 as struct(args text[], predicate text);
SELECT
  x_1.unnested_pod.a.n AS n,
  x_1.unnested_pod.a.v AS v
FROM
  (select unnest([{a: {n: 'p', v: 1}}, {a: {n: 'q', v: 2}}]::synalogrecord628258701[]) as unnested_pod) as x_1 ORDER BY n;