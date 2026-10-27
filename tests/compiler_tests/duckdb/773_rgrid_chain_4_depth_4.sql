-- Initializing DuckDB environment.
create schema if not exists synalog_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists synalogrecord893574736 cascade; create type synalogrecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH RECURSIVE t_0_R_RecursiveCte AS (SELECT * FROM (
  SELECT * FROM (
    
      SELECT
        0 AS x,
        0 AS synalog_step
     UNION ALL
    
      SELECT
        ((x_20.unnested_pod) + (1)) AS x,
        ((0) + (1)) AS synalog_step
      FROM
        (select unnest(Range(4)) as unnested_pod) as x_20
      WHERE
        (0 < 4) AND
        (1 = 0) AND
        (x_20.unnested_pod = 0)
     UNION ALL
    
      SELECT
        ((x_36.unnested_pod) + (1)) AS x,
        ((((0) + (1))) + (1)) AS synalog_step
      FROM
        (select unnest(Range(4)) as unnested_pod) as x_36, (select unnest(Range(4)) as unnested_pod) as x_42
      WHERE
        (((0) + (1)) < 4) AND
        (0 < 4) AND
        (1 = 0) AND
        (x_36.unnested_pod IS NOT DISTINCT FROM ((x_42.unnested_pod) + (1))) AND
        (x_42.unnested_pod = 0)
     UNION ALL
    
      SELECT
        ((x_58.unnested_pod) + (1)) AS x,
        ((((((0) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        (select unnest(Range(4)) as unnested_pod) as x_58, (select unnest(Range(4)) as unnested_pod) as x_65, (select unnest(Range(4)) as unnested_pod) as x_71
      WHERE
        (((((0) + (1))) + (1)) < 4) AND
        (((0) + (1)) < 4) AND
        (0 < 4) AND
        (1 = 0) AND
        (x_58.unnested_pod IS NOT DISTINCT FROM ((x_65.unnested_pod) + (1))) AND
        (x_65.unnested_pod IS NOT DISTINCT FROM ((x_71.unnested_pod) + (1))) AND
        (x_71.unnested_pod = 0)
    
  ) AS UNUSED_TABLE_NAME  
) AS UNUSED_TABLE_NAME
UNION
SELECT
  ((x_78.unnested_pod) + (1)) AS x,
  ((t_14_R_RecursiveCte.synalog_step) + (1)) AS synalog_step
FROM
  t_0_R_RecursiveCte AS t_14_R_RecursiveCte, (select unnest(Range(4)) as unnested_pod) as x_78
WHERE
  (t_14_R_RecursiveCte.synalog_step < 4) AND
  (t_14_R_RecursiveCte.x IS NOT DISTINCT FROM x_78.unnested_pod))
SELECT
  R_RecursiveCte.x AS x
FROM
  t_0_R_RecursiveCte AS R_RecursiveCte
GROUP BY R_RecursiveCte.x ORDER BY x;