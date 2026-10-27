-- Initializing DuckDB environment.
create schema if not exists synalog_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists synalogrecord893574736 cascade; create type synalogrecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_0_Pr AS (SELECT * FROM (
  
    SELECT
      100 AS pid,
      10 AS dept
   UNION ALL
  
    SELECT
      101 AS pid,
      10 AS dept
   UNION ALL
  
    SELECT
      102 AS pid,
      20 AS dept
   UNION ALL
  
    SELECT
      103 AS pid,
      50 AS dept
  
) AS UNUSED_TABLE_NAME  ),
t_1_D AS (SELECT * FROM (
  
    SELECT
      10 AS dept,
      'eng' AS dname,
      'paris' AS city
   UNION ALL
  
    SELECT
      20 AS dept,
      'ops' AS dname,
      'lyon' AS city
   UNION ALL
  
    SELECT
      40 AS dept,
      'hr' AS dname,
      'nice' AS city
   UNION ALL
  
    SELECT
      null AS dept,
      'temp' AS dname,
      'lyon' AS city
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Pr.pid AS pid
FROM
  t_0_Pr AS Pr
WHERE
  ((SELECT
    MIN((CASE WHEN x_5.unnested_pod = 0 THEN 1 ELSE NULL END)) AS synalog_value
  FROM
    t_1_D AS D, (select unnest([0]) as unnested_pod) as x_5
  WHERE
    (D.dept IS NOT DISTINCT FROM Pr.dept)) IS NULL);