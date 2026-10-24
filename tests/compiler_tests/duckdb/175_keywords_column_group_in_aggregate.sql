-- Initializing DuckDB environment.
create schema if not exists synalog_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists synalogrecord893574736 cascade; create type synalogrecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_0_R AS (SELECT * FROM (
  
    SELECT
      'a' AS "group",
      1 AS v
   UNION ALL
  
    SELECT
      'a' AS "group",
      2 AS v
   UNION ALL
  
    SELECT
      'b' AS "group",
      4 AS v
  
) AS UNUSED_TABLE_NAME  )
SELECT
  R."group" AS "group",
  SUM(R.v) AS total
FROM
  t_0_R AS R
GROUP BY R."group" ORDER BY "group";