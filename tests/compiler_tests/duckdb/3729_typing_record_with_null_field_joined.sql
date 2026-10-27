-- Initializing DuckDB environment.
create schema if not exists synalog_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists synalogrecord893574736 cascade; create type synalogrecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_0_A AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      {v: null} AS r
   UNION ALL
  
    SELECT
      2 AS k,
      {v: 3} AS r
  
) AS UNUSED_TABLE_NAME  ),
t_1_B AS (SELECT * FROM (
  
    SELECT
      1 AS k
   UNION ALL
  
    SELECT
      2 AS k
  
) AS UNUSED_TABLE_NAME  )
SELECT
  A.k AS k
FROM
  t_0_A AS A, t_1_B AS B
WHERE
  (A.r.v IS null) AND
  (B.k IS NOT DISTINCT FROM A.k);