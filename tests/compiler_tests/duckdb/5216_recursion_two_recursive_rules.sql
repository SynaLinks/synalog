-- Initializing DuckDB environment.
create schema if not exists synalog_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists synalogrecord893574736 cascade; create type synalogrecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH RECURSIVE t_3_E AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      4 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      4 AS a,
      5 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_R_RecursiveCte_t1 AS (SELECT * FROM (
  
    SELECT
      E.b AS x,
      ((0) + (1)) AS synalog_step
    FROM
      t_3_E AS E
    WHERE
      (0 < 2) AND
      (1 = 0) AND
      (E.a = 1)
   UNION ALL
  
    SELECT
      t_5_E.a AS x,
      ((0) + (1)) AS synalog_step
    FROM
      t_3_E AS t_5_E
    WHERE
      (0 < 2) AND
      (1 = 0) AND
      (t_5_E.b = 1)
  
) AS UNUSED_TABLE_NAME  ),
t_7_R_RecursiveCte_t2 AS (SELECT * FROM (
  
    SELECT
      t_9_E.b AS x,
      ((t_8_R_RecursiveCte_t1.synalog_step) + (1)) AS synalog_step
    FROM
      t_1_R_RecursiveCte_t1 AS t_8_R_RecursiveCte_t1, t_3_E AS t_9_E
    WHERE
      (t_8_R_RecursiveCte_t1.synalog_step < 2) AND
      (t_9_E.a IS NOT DISTINCT FROM t_8_R_RecursiveCte_t1.x)
   UNION ALL
  
    SELECT
      t_17_E.a AS x,
      ((t_16_R_RecursiveCte_t1.synalog_step) + (1)) AS synalog_step
    FROM
      t_1_R_RecursiveCte_t1 AS t_16_R_RecursiveCte_t1, t_3_E AS t_17_E
    WHERE
      (t_16_R_RecursiveCte_t1.synalog_step < 2) AND
      (t_17_E.b IS NOT DISTINCT FROM t_16_R_RecursiveCte_t1.x)
  
) AS UNUSED_TABLE_NAME  ),
t_18_R_RecursiveCte_t3 AS (SELECT * FROM (
  
    SELECT
      t_20_E.b AS x,
      ((t_19_R_RecursiveCte_t2.synalog_step) + (1)) AS synalog_step
    FROM
      t_7_R_RecursiveCte_t2 AS t_19_R_RecursiveCte_t2, t_3_E AS t_20_E
    WHERE
      (t_19_R_RecursiveCte_t2.synalog_step < 2) AND
      (t_20_E.a IS NOT DISTINCT FROM t_19_R_RecursiveCte_t2.x)
   UNION ALL
  
    SELECT
      t_26_E.a AS x,
      ((t_25_R_RecursiveCte_t2.synalog_step) + (1)) AS synalog_step
    FROM
      t_7_R_RecursiveCte_t2 AS t_25_R_RecursiveCte_t2, t_3_E AS t_26_E
    WHERE
      (t_25_R_RecursiveCte_t2.synalog_step < 2) AND
      (t_26_E.b IS NOT DISTINCT FROM t_25_R_RecursiveCte_t2.x)
  
) AS UNUSED_TABLE_NAME  ),
t_0_R_RecursiveCte AS (SELECT * FROM (
  SELECT * FROM (
    
      SELECT
        1 AS x,
        0 AS synalog_step
     UNION ALL
    
      SELECT
        R_RecursiveCte_t1.x AS x,
        R_RecursiveCte_t1.synalog_step AS synalog_step
      FROM
        t_1_R_RecursiveCte_t1 AS R_RecursiveCte_t1
     UNION ALL
    
      SELECT
        R_RecursiveCte_t2.x AS x,
        R_RecursiveCte_t2.synalog_step AS synalog_step
      FROM
        t_7_R_RecursiveCte_t2 AS R_RecursiveCte_t2
     UNION ALL
    
      SELECT
        R_RecursiveCte_t3.x AS x,
        R_RecursiveCte_t3.synalog_step AS synalog_step
      FROM
        t_18_R_RecursiveCte_t3 AS R_RecursiveCte_t3
    
  ) AS UNUSED_TABLE_NAME  
) AS UNUSED_TABLE_NAME
UNION
(
SELECT
  t_28_E.b AS x,
  ((t_27_R_RecursiveCte.synalog_step) + (1)) AS synalog_step
FROM
  t_0_R_RecursiveCte AS t_27_R_RecursiveCte, t_3_E AS t_28_E
WHERE
  (t_27_R_RecursiveCte.synalog_step < 2) AND
  (t_28_E.a IS NOT DISTINCT FROM t_27_R_RecursiveCte.x)
UNION ALL
SELECT
  t_30_E.a AS x,
  ((t_29_R_RecursiveCte.synalog_step) + (1)) AS synalog_step
FROM
  t_0_R_RecursiveCte AS t_29_R_RecursiveCte, t_3_E AS t_30_E
WHERE
  (t_29_R_RecursiveCte.synalog_step < 2) AND
  (t_30_E.b IS NOT DISTINCT FROM t_29_R_RecursiveCte.x)
))
SELECT
  R_RecursiveCte.x AS x
FROM
  t_0_R_RecursiveCte AS R_RecursiveCte
GROUP BY R_RecursiveCte.x ORDER BY x;