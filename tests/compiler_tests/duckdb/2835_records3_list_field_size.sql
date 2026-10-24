-- Initializing DuckDB environment.
create schema if not exists synalog_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists synalogrecord893574736 cascade; create type synalogrecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;


-- Synalog type: synalogrecord481217614
drop type if exists synalogrecord481217614 cascade; create type synalogrecord481217614 as struct(r synalogrecord893574736);

-- Synalog type: synalogrecord383307722
drop type if exists synalogrecord383307722 cascade; create type synalogrecord383307722 as struct(a timestamp);

-- Synalog type: synalogrecord51730912
drop type if exists synalogrecord51730912 cascade; create type synalogrecord51730912 as struct(name text, xs numeric[]);

-- Synalog type: synalogrecord519939597
drop type if exists synalogrecord519939597 cascade; create type synalogrecord519939597 as struct(args text[], predicate text);
WITH t_0_S AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      {name: 'a', xs: [1, 2, 3]::numeric[]} AS r
   UNION ALL
  
    SELECT
      2 AS k,
      {name: 'b', xs: [4]::numeric[]} AS r
   UNION ALL
  
    SELECT
      3 AS k,
      {name: 'c', xs: []::numeric[]} AS r
  
) AS UNUSED_TABLE_NAME  )
SELECT
  S.k AS k,
  LEN(S.r.xs) AS n
FROM
  t_0_S AS S ORDER BY k;