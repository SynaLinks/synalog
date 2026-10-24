-- Initializing DuckDB environment.
create schema if not exists synalog_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists synalogrecord893574736 cascade; create type synalogrecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;


-- Synalog type: synalogrecord481217614
drop type if exists synalogrecord481217614 cascade; create type synalogrecord481217614 as struct(r synalogrecord893574736);

-- Synalog type: synalogrecord383307722
drop type if exists synalogrecord383307722 cascade; create type synalogrecord383307722 as struct(a timestamp);

-- Synalog type: synalogrecord183863755
drop type if exists synalogrecord183863755 cascade; create type synalogrecord183863755 as struct(arg text, value numeric);

-- Synalog type: synalogrecord519939597
drop type if exists synalogrecord519939597 cascade; create type synalogrecord519939597 as struct(args text[], predicate text);

-- Synalog type: synalogrecord848101342
drop type if exists synalogrecord848101342 cascade; create type synalogrecord848101342 as struct(a text, v numeric);
WITH t_1_V AS (SELECT * FROM (
  
    SELECT
      'x' AS g,
      'a' AS n,
      1 AS s
   UNION ALL
  
    SELECT
      'x' AS g,
      'b' AS n,
      2 AS s
   UNION ALL
  
    SELECT
      'y' AS g,
      'c' AS n,
      9 AS s
   UNION ALL
  
    SELECT
      'y' AS g,
      'd' AS n,
      4 AS s
  
) AS UNUSED_TABLE_NAME  )
SELECT
  V.g AS g,
  argmin(V.n, V.s) AS w
FROM
  t_1_V AS V
GROUP BY V.g ORDER BY g;