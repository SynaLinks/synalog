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
WITH t_0_Person AS (SELECT * FROM (
  
    SELECT
      'John' AS col0,
      'Doe' AS col1
   UNION ALL
  
    SELECT
      'Jane' AS col0,
      'Smith' AS col1
   UNION ALL
  
    SELECT
      'Bob' AS col0,
      '' AS col1
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Person.col0 AS first,
  Person.col1 AS last,
  ((((Person.col0) || (' '))) || (Person.col1)) AS full_name
FROM
  t_0_Person AS Person ORDER BY full_name;