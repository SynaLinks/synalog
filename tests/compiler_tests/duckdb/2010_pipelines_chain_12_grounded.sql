-- Initializing DuckDB environment.
create schema if not exists synalog_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists synalogrecord893574736 cascade; create type synalogrecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

DROP TABLE IF EXISTS synalog_home.C0;
CREATE TABLE synalog_home.C0 AS SELECT
  x_1.unnested_pod AS x
FROM
  (select unnest([1, 2, 3, 4, 5, 6, 7, 8]) as unnested_pod) as x_1;

-- Interacting with table synalog_home.C0

DROP TABLE IF EXISTS synalog_home.C3;
CREATE TABLE synalog_home.C3 AS SELECT
  C0.x AS x
FROM
  synalog_home.C0 AS C0
WHERE
  (C0.x IS DISTINCT FROM 3) AND
  (C0.x IS DISTINCT FROM 2) AND
  (C0.x IS DISTINCT FROM 1);

-- Interacting with table synalog_home.C3

DROP TABLE IF EXISTS synalog_home.C6;
CREATE TABLE synalog_home.C6 AS SELECT
  C3.x AS x
FROM
  synalog_home.C3 AS C3
WHERE
  (C3.x IS DISTINCT FROM 6) AND
  (C3.x IS DISTINCT FROM 5) AND
  (C3.x IS DISTINCT FROM 4);

-- Interacting with table synalog_home.C6

DROP TABLE IF EXISTS synalog_home.C9;
CREATE TABLE synalog_home.C9 AS SELECT
  C6.x AS x
FROM
  synalog_home.C6 AS C6
WHERE
  (C6.x IS DISTINCT FROM 9) AND
  (C6.x IS DISTINCT FROM 8) AND
  (C6.x IS DISTINCT FROM 7);

-- Interacting with table synalog_home.C9

DROP TABLE IF EXISTS synalog_home.C12;
CREATE TABLE synalog_home.C12 AS SELECT
  C9.x AS x
FROM
  synalog_home.C9 AS C9
WHERE
  (C9.x IS DISTINCT FROM 12) AND
  (C9.x IS DISTINCT FROM 11) AND
  (C9.x IS DISTINCT FROM 10);

-- Interacting with table synalog_home.C12

SELECT
  C12.x AS x
FROM
  synalog_home.C12 AS C12;