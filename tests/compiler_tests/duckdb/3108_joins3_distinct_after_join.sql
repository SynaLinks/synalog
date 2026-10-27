-- Initializing DuckDB environment.
create schema if not exists synalog_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists synalogrecord893574736 cascade; create type synalogrecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_1_A AS (SELECT * FROM (
  
    SELECT
      1 AS k
   UNION ALL
  
    SELECT
      1 AS k
  
) AS UNUSED_TABLE_NAME  ),
t_2_B AS (SELECT * FROM (
  
    SELECT
      1 AS k
   UNION ALL
  
    SELECT
      1 AS k
  
) AS UNUSED_TABLE_NAME  ),
t_0_J AS (SELECT
  A.k AS k
FROM
  t_1_A AS A, t_2_B AS B
WHERE
  (B.k IS NOT DISTINCT FROM A.k)
GROUP BY A.k)
SELECT
  SUM(1) AS n
FROM
  t_0_J AS J;