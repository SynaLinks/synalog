-- Initializing DuckDB environment.
create schema if not exists synalog_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists synalogrecord893574736 cascade; create type synalogrecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;


-- Synalog type: synalogrecord481217614
drop type if exists synalogrecord481217614 cascade; create type synalogrecord481217614 as struct(r synalogrecord893574736);

-- Synalog type: synalogrecord383307722
drop type if exists synalogrecord383307722 cascade; create type synalogrecord383307722 as struct(a timestamp);

-- Synalog type: synalogrecord829297287
drop type if exists synalogrecord829297287 cascade; create type synalogrecord829297287 as struct(a text, b numeric);

-- Synalog type: synalogrecord519939597
drop type if exists synalogrecord519939597 cascade; create type synalogrecord519939597 as struct(args text[], predicate text);
WITH t_0_N AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      {a: 'x', b: 1} AS r
   UNION ALL
  
    SELECT
      2 AS k,
      {a: null, b: 2} AS r
   UNION ALL
  
    SELECT
      3 AS k,
      {a: 'z', b: null} AS r
  
) AS UNUSED_TABLE_NAME  )
SELECT
  N.k AS k
FROM
  t_0_N AS N
WHERE
  (N.r.a IS null);