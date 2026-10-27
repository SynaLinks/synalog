-- Initializing DuckDB environment.
create schema if not exists synalog_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists synalogrecord893574736 cascade; create type synalogrecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_1_A AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      10 AS pid,
      8 AS hours
   UNION ALL
  
    SELECT
      1 AS id,
      11 AS pid,
      4 AS hours
   UNION ALL
  
    SELECT
      2 AS id,
      10 AS pid,
      12 AS hours
   UNION ALL
  
    SELECT
      3 AS id,
      12 AS pid,
      20 AS hours
   UNION ALL
  
    SELECT
      3 AS id,
      14 AS pid,
      2 AS hours
   UNION ALL
  
    SELECT
      4 AS id,
      12 AS pid,
      6 AS hours
   UNION ALL
  
    SELECT
      6 AS id,
      11 AS pid,
      15 AS hours
   UNION ALL
  
    SELECT
      5 AS id,
      13 AS pid,
      1 AS hours
  
) AS UNUSED_TABLE_NAME  ),
t_0_Projects AS (SELECT
  A.id AS id,
  ARRAY_AGG(A.pid) AS l
FROM
  t_1_A AS A
GROUP BY A.id),
t_2_Proj AS (SELECT * FROM (
  
    SELECT
      10 AS pid,
      'red' AS team,
      300 AS budget
   UNION ALL
  
    SELECT
      11 AS pid,
      'red' AS team,
      1200 AS budget
   UNION ALL
  
    SELECT
      12 AS pid,
      'blue' AS team,
      800 AS budget
   UNION ALL
  
    SELECT
      13 AS pid,
      'green' AS team,
      50 AS budget
   UNION ALL
  
    SELECT
      14 AS pid,
      'blue' AS team,
      90 AS budget
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Projects.id AS id,
  SUM(1) AS n
FROM
  t_0_Projects AS Projects, t_2_Proj AS Proj, (select unnest(Projects.l) as unnested_pod) as x_4
WHERE
  (Proj.pid IS NOT DISTINCT FROM x_4.unnested_pod)
GROUP BY Projects.id ORDER BY id, n;