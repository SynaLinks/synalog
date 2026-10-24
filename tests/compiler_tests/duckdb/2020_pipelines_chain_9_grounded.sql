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
DROP TABLE IF EXISTS synalog_home.C0;
CREATE TABLE synalog_home.C0 AS SELECT
  x_21.unnested_pod AS x
FROM
  (select unnest([1, 2, 3, 4, 5, 6, 7, 8]::numeric[]) as unnested_pod) as x_21;

-- Interacting with table synalog_home.C0

DROP TABLE IF EXISTS synalog_home.C3;
CREATE TABLE synalog_home.C3 AS SELECT
  C0.x AS x
FROM
  synalog_home.C0 AS C0
WHERE
  (C0.x != 3) AND
  (C0.x != 2) AND
  (C0.x != 1);

-- Interacting with table synalog_home.C3

DROP TABLE IF EXISTS synalog_home.C6;
CREATE TABLE synalog_home.C6 AS SELECT
  C3.x AS x
FROM
  synalog_home.C3 AS C3
WHERE
  (C3.x != 6) AND
  (C3.x != 5) AND
  (C3.x != 4);

-- Interacting with table synalog_home.C6

DROP TABLE IF EXISTS synalog_home.C9;
CREATE TABLE synalog_home.C9 AS SELECT
  C6.x AS x
FROM
  synalog_home.C6 AS C6
WHERE
  (C6.x != 9) AND
  (C6.x != 8) AND
  (C6.x != 7);

-- Interacting with table synalog_home.C9

SELECT
  C9.x AS x
FROM
  synalog_home.C9 AS C9;