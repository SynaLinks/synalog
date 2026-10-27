-- Initializing DuckDB environment.
create schema if not exists synalog_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists synalogrecord893574736 cascade; create type synalogrecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH RECURSIVE t_1_E AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      1 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      4 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      4 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_0_P_RecursiveCte AS (SELECT * FROM (
  SELECT * FROM (
    
      SELECT
        E.a AS a,
        E.b AS b,
        0 AS synalog_step
      FROM
        t_1_E AS E
     UNION ALL
    
      SELECT
        t_4_E.a AS a,
        t_2_E.b AS b,
        ((0) + (1)) AS synalog_step
      FROM
        t_1_E AS t_4_E, t_1_E AS t_2_E
      WHERE
        (0 < 8) AND
        (1 = 0) AND
        (t_2_E.a IS NOT DISTINCT FROM t_4_E.b)
     UNION ALL
    
      SELECT
        t_10_E.a AS a,
        t_6_E.b AS b,
        ((((0) + (1))) + (1)) AS synalog_step
      FROM
        t_1_E AS t_10_E, t_1_E AS t_8_E, t_1_E AS t_6_E
      WHERE
        (((0) + (1)) < 8) AND
        (0 < 8) AND
        (1 = 0) AND
        (t_6_E.a IS NOT DISTINCT FROM t_8_E.b) AND
        (t_8_E.a IS NOT DISTINCT FROM t_10_E.b)
     UNION ALL
    
      SELECT
        t_18_E.a AS a,
        t_12_E.b AS b,
        ((((((0) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_1_E AS t_18_E, t_1_E AS t_16_E, t_1_E AS t_14_E, t_1_E AS t_12_E
      WHERE
        (((((0) + (1))) + (1)) < 8) AND
        (((0) + (1)) < 8) AND
        (0 < 8) AND
        (1 = 0) AND
        (t_12_E.a IS NOT DISTINCT FROM t_14_E.b) AND
        (t_14_E.a IS NOT DISTINCT FROM t_16_E.b) AND
        (t_16_E.a IS NOT DISTINCT FROM t_18_E.b)
     UNION ALL
    
      SELECT
        t_28_E.a AS a,
        t_20_E.b AS b,
        ((((((((0) + (1))) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_1_E AS t_28_E, t_1_E AS t_26_E, t_1_E AS t_24_E, t_1_E AS t_22_E, t_1_E AS t_20_E
      WHERE
        (((((((0) + (1))) + (1))) + (1)) < 8) AND
        (((((0) + (1))) + (1)) < 8) AND
        (((0) + (1)) < 8) AND
        (0 < 8) AND
        (1 = 0) AND
        (t_20_E.a IS NOT DISTINCT FROM t_22_E.b) AND
        (t_22_E.a IS NOT DISTINCT FROM t_24_E.b) AND
        (t_24_E.a IS NOT DISTINCT FROM t_26_E.b) AND
        (t_26_E.a IS NOT DISTINCT FROM t_28_E.b)
     UNION ALL
    
      SELECT
        t_40_E.a AS a,
        t_30_E.b AS b,
        ((((((((((0) + (1))) + (1))) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_1_E AS t_40_E, t_1_E AS t_38_E, t_1_E AS t_36_E, t_1_E AS t_34_E, t_1_E AS t_32_E, t_1_E AS t_30_E
      WHERE
        (((((((((0) + (1))) + (1))) + (1))) + (1)) < 8) AND
        (((((((0) + (1))) + (1))) + (1)) < 8) AND
        (((((0) + (1))) + (1)) < 8) AND
        (((0) + (1)) < 8) AND
        (0 < 8) AND
        (1 = 0) AND
        (t_30_E.a IS NOT DISTINCT FROM t_32_E.b) AND
        (t_32_E.a IS NOT DISTINCT FROM t_34_E.b) AND
        (t_34_E.a IS NOT DISTINCT FROM t_36_E.b) AND
        (t_36_E.a IS NOT DISTINCT FROM t_38_E.b) AND
        (t_38_E.a IS NOT DISTINCT FROM t_40_E.b)
    
  ) AS UNUSED_TABLE_NAME  
) AS UNUSED_TABLE_NAME
UNION
SELECT
  t_41_P_RecursiveCte.a AS a,
  t_42_E.b AS b,
  ((t_41_P_RecursiveCte.synalog_step) + (1)) AS synalog_step
FROM
  t_0_P_RecursiveCte AS t_41_P_RecursiveCte, t_1_E AS t_42_E
WHERE
  (t_41_P_RecursiveCte.synalog_step < 8) AND
  (t_42_E.a IS NOT DISTINCT FROM t_41_P_RecursiveCte.b))
SELECT
  P_RecursiveCte.a AS a,
  P_RecursiveCte.b AS b
FROM
  t_0_P_RecursiveCte AS P_RecursiveCte
GROUP BY P_RecursiveCte.a, P_RecursiveCte.b ORDER BY a, b;