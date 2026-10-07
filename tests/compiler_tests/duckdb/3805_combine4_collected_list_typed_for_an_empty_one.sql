-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_4_A AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      2 AS x
  
) AS UNUSED_TABLE_NAME  ),
t_3_L AS (SELECT
  'a' AS src,
  ARRAY_AGG(A.x) AS l
FROM
  t_4_A AS A
GROUP BY ('a' || '')),
t_1_All AS (SELECT * FROM (
  
    SELECT
      t_2_L.src AS src,
      t_2_L.l AS l
    FROM
      t_3_L AS t_2_L
   UNION ALL
  
    SELECT
      'b' AS src,
      [] AS l
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_All.src AS src,
  LEN(t_0_All.l) AS n
FROM
  t_1_All AS t_0_All ORDER BY src;