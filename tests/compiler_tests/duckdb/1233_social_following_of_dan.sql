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
WITH t_0_Follows AS (SELECT * FROM (
  
    SELECT
      'ann' AS a,
      'bob' AS b
   UNION ALL
  
    SELECT
      'bob' AS a,
      'ann' AS b
   UNION ALL
  
    SELECT
      'ann' AS a,
      'cat' AS b
   UNION ALL
  
    SELECT
      'cat' AS a,
      'dan' AS b
   UNION ALL
  
    SELECT
      'dan' AS a,
      'cat' AS b
   UNION ALL
  
    SELECT
      'bob' AS a,
      'cat' AS b
   UNION ALL
  
    SELECT
      'eve' AS a,
      'ann' AS b
   UNION ALL
  
    SELECT
      'eve' AS a,
      'bob' AS b
   UNION ALL
  
    SELECT
      'eve' AS a,
      'cat' AS b
   UNION ALL
  
    SELECT
      'dan' AS a,
      'eve' AS b
   UNION ALL
  
    SELECT
      'fay' AS a,
      'cat' AS b
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Follows.b AS b
FROM
  t_0_Follows AS Follows
WHERE
  (Follows.a = 'dan') ORDER BY b;