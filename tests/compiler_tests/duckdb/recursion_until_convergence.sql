-- Initializing DuckDB environment.
create schema if not exists synalog_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists synalogrecord893574736 cascade; create type synalogrecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH RECURSIVE t_0_Test_RecursiveCte AS (SELECT * FROM (
  SELECT * FROM (
    
      SELECT
        0 AS y
     UNION ALL
    
      SELECT
        ((x_13.unnested_pod) + (1)) AS y
      FROM
        (select unnest(Range(10)) as unnested_pod) as x_13
      WHERE
        (1 = 0) AND
        (x_13.unnested_pod = 0)
     UNION ALL
    
      SELECT
        ((x_25.unnested_pod) + (1)) AS y
      FROM
        (select unnest(Range(10)) as unnested_pod) as x_25, (select unnest(Range(10)) as unnested_pod) as x_29
      WHERE
        (1 = 0) AND
        (x_25.unnested_pod IS NOT DISTINCT FROM ((x_29.unnested_pod) + (1))) AND
        (x_29.unnested_pod = 0)
     UNION ALL
    
      SELECT
        ((x_41.unnested_pod) + (1)) AS y
      FROM
        (select unnest(Range(10)) as unnested_pod) as x_41, (select unnest(Range(10)) as unnested_pod) as x_47, (select unnest(Range(10)) as unnested_pod) as x_51
      WHERE
        (1 = 0) AND
        (x_41.unnested_pod IS NOT DISTINCT FROM ((x_47.unnested_pod) + (1))) AND
        (x_47.unnested_pod IS NOT DISTINCT FROM ((x_51.unnested_pod) + (1))) AND
        (x_51.unnested_pod = 0)
    
  ) AS UNUSED_TABLE_NAME  
) AS UNUSED_TABLE_NAME
UNION
SELECT
  ((x_57.unnested_pod) + (1)) AS y
FROM
  t_0_Test_RecursiveCte AS t_14_Test_RecursiveCte, (select unnest(Range(10)) as unnested_pod) as x_57
WHERE
  (t_14_Test_RecursiveCte.y IS NOT DISTINCT FROM x_57.unnested_pod))
SELECT
  Test_RecursiveCte.y AS y
FROM
  t_0_Test_RecursiveCte AS Test_RecursiveCte
GROUP BY Test_RecursiveCte.y;