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
      2 AS a,
      3 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_2_P_RecursiveCte AS (SELECT * FROM (
  SELECT * FROM (
    
      SELECT
        E.a AS a,
        E.b AS b,
        0 AS synalog_step
      FROM
        t_3_E AS E
     UNION ALL
    
      SELECT
        t_6_E.a AS a,
        t_4_E.b AS b,
        ((0) + (1)) AS synalog_step
      FROM
        t_3_E AS t_6_E, t_3_E AS t_4_E
      WHERE
        (0 < 5) AND
        (1 = 0) AND
        (t_4_E.a IS NOT DISTINCT FROM t_6_E.b)
     UNION ALL
    
      SELECT
        t_12_E.a AS a,
        t_8_E.b AS b,
        ((((0) + (1))) + (1)) AS synalog_step
      FROM
        t_3_E AS t_12_E, t_3_E AS t_10_E, t_3_E AS t_8_E
      WHERE
        (((0) + (1)) < 5) AND
        (0 < 5) AND
        (1 = 0) AND
        (t_8_E.a IS NOT DISTINCT FROM t_10_E.b) AND
        (t_10_E.a IS NOT DISTINCT FROM t_12_E.b)
     UNION ALL
    
      SELECT
        t_20_E.a AS a,
        t_14_E.b AS b,
        ((((((0) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_3_E AS t_20_E, t_3_E AS t_18_E, t_3_E AS t_16_E, t_3_E AS t_14_E
      WHERE
        (((((0) + (1))) + (1)) < 5) AND
        (((0) + (1)) < 5) AND
        (0 < 5) AND
        (1 = 0) AND
        (t_14_E.a IS NOT DISTINCT FROM t_16_E.b) AND
        (t_16_E.a IS NOT DISTINCT FROM t_18_E.b) AND
        (t_18_E.a IS NOT DISTINCT FROM t_20_E.b)
     UNION ALL
    
      SELECT
        t_30_E.a AS a,
        t_22_E.b AS b,
        ((((((((0) + (1))) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_3_E AS t_30_E, t_3_E AS t_28_E, t_3_E AS t_26_E, t_3_E AS t_24_E, t_3_E AS t_22_E
      WHERE
        (((((((0) + (1))) + (1))) + (1)) < 5) AND
        (((((0) + (1))) + (1)) < 5) AND
        (((0) + (1)) < 5) AND
        (0 < 5) AND
        (1 = 0) AND
        (t_22_E.a IS NOT DISTINCT FROM t_24_E.b) AND
        (t_24_E.a IS NOT DISTINCT FROM t_26_E.b) AND
        (t_26_E.a IS NOT DISTINCT FROM t_28_E.b) AND
        (t_28_E.a IS NOT DISTINCT FROM t_30_E.b)
     UNION ALL
    
      SELECT
        t_42_E.a AS a,
        t_32_E.b AS b,
        ((((((((((0) + (1))) + (1))) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_3_E AS t_42_E, t_3_E AS t_40_E, t_3_E AS t_38_E, t_3_E AS t_36_E, t_3_E AS t_34_E, t_3_E AS t_32_E
      WHERE
        (((((((((0) + (1))) + (1))) + (1))) + (1)) < 5) AND
        (((((((0) + (1))) + (1))) + (1)) < 5) AND
        (((((0) + (1))) + (1)) < 5) AND
        (((0) + (1)) < 5) AND
        (0 < 5) AND
        (1 = 0) AND
        (t_32_E.a IS NOT DISTINCT FROM t_34_E.b) AND
        (t_34_E.a IS NOT DISTINCT FROM t_36_E.b) AND
        (t_36_E.a IS NOT DISTINCT FROM t_38_E.b) AND
        (t_38_E.a IS NOT DISTINCT FROM t_40_E.b) AND
        (t_40_E.a IS NOT DISTINCT FROM t_42_E.b)
    
  ) AS UNUSED_TABLE_NAME  
) AS UNUSED_TABLE_NAME
UNION
SELECT
  t_43_P_RecursiveCte.a AS a,
  t_44_E.b AS b,
  ((t_43_P_RecursiveCte.synalog_step) + (1)) AS synalog_step
FROM
  t_2_P_RecursiveCte AS t_43_P_RecursiveCte, t_3_E AS t_44_E
WHERE
  (t_43_P_RecursiveCte.synalog_step < 5) AND
  (t_44_E.a IS NOT DISTINCT FROM t_43_P_RecursiveCte.b)),
t_1_P AS (SELECT
  P_RecursiveCte.a AS a,
  P_RecursiveCte.b AS b
FROM
  t_2_P_RecursiveCte AS P_RecursiveCte
GROUP BY P_RecursiveCte.a, P_RecursiveCte.b)
SELECT
  P.a AS a,
  t_0_P.b AS c
FROM
  t_1_P AS P, t_1_P AS t_0_P
WHERE
  (t_0_P.a IS NOT DISTINCT FROM P.b);