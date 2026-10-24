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
WITH t_0_W AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      'naïve' AS s
   UNION ALL
  
    SELECT
      2 AS k,
      '' AS s
   UNION ALL
  
    SELECT
      3 AS k,
      null AS s
  
) AS UNUSED_TABLE_NAME  )
SELECT
  W.k AS k,
  REVERSE(REVERSE(W.s)) AS v,
  REVERSE(W.s) AS r
FROM
  t_0_W AS W ORDER BY k;