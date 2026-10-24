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
WITH t_0_Scores AS (SELECT * FROM (
  
    SELECT
      'Alice' AS col0,
      95 AS col1
   UNION ALL
  
    SELECT
      'Bob' AS col0,
      87 AS col1
   UNION ALL
  
    SELECT
      'Charlie' AS col0,
      92 AS col1
   UNION ALL
  
    SELECT
      'Diana' AS col0,
      88 AS col1
   UNION ALL
  
    SELECT
      'Eve' AS col0,
      91 AS col1
   UNION ALL
  
    SELECT
      'Frank' AS col0,
      85 AS col1
   UNION ALL
  
    SELECT
      'Grace' AS col0,
      93 AS col1
   UNION ALL
  
    SELECT
      'Henry' AS col0,
      89 AS col1
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Scores.col0 AS name,
  Scores.col1 AS score
FROM
  t_0_Scores AS Scores ORDER BY score desc LIMIT 3;