-- Initializing DuckDB environment.
create schema if not exists synalog_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists synalogrecord893574736 cascade; create type synalogrecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;


-- Synalog type: synalogrecord481217614
drop type if exists synalogrecord481217614 cascade; create type synalogrecord481217614 as struct(r synalogrecord893574736);

-- Synalog type: synalogrecord383307722
drop type if exists synalogrecord383307722 cascade; create type synalogrecord383307722 as struct(a timestamp);

-- Synalog type: synalogrecord884343024
drop type if exists synalogrecord884343024 cascade; create type synalogrecord884343024 as struct(arg numeric, value numeric);

-- Synalog type: synalogrecord519939597
drop type if exists synalogrecord519939597 cascade; create type synalogrecord519939597 as struct(args text[], predicate text);

-- Synalog type: synalogrecord723118000
drop type if exists synalogrecord723118000 cascade; create type synalogrecord723118000 as struct(a numeric, v numeric);
WITH t_1_V AS (SELECT * FROM (
  
    SELECT
      10 AS id,
      1 AS s
   UNION ALL
  
    SELECT
      30 AS id,
      9 AS s
   UNION ALL
  
    SELECT
      20 AS id,
      5 AS s
  
) AS UNUSED_TABLE_NAME  )
SELECT
  argmax(V.id, V.s) AS w
FROM
  t_1_V AS V;