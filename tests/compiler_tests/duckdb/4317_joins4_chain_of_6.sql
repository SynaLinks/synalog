-- Initializing DuckDB environment.
create schema if not exists synalog_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists synalogrecord893574736 cascade; create type synalogrecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH RECURSIVE t_3_E AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      'ann' AS n,
      null AS boss,
      10 AS d,
      5000 AS pay
   UNION ALL
  
    SELECT
      2 AS id,
      'bob' AS n,
      1 AS boss,
      10 AS d,
      4000 AS pay
   UNION ALL
  
    SELECT
      3 AS id,
      'cid' AS n,
      1 AS boss,
      20 AS d,
      4200 AS pay
   UNION ALL
  
    SELECT
      4 AS id,
      'dee' AS n,
      2 AS boss,
      10 AS d,
      3000 AS pay
   UNION ALL
  
    SELECT
      5 AS id,
      'eve' AS n,
      3 AS boss,
      20 AS d,
      3100 AS pay
   UNION ALL
  
    SELECT
      6 AS id,
      'fay' AS n,
      3 AS boss,
      null AS d,
      2900 AS pay
   UNION ALL
  
    SELECT
      7 AS id,
      'gus' AS n,
      null AS boss,
      30 AS d,
      6000 AS pay
   UNION ALL
  
    SELECT
      8 AS id,
      'hal' AS n,
      7 AS boss,
      30 AS d,
      2500 AS pay
  
) AS UNUSED_TABLE_NAME  ),
t_1_Up_RecursiveCte AS (SELECT * FROM (
  SELECT * FROM (
    
      SELECT
        t_2_E.boss AS id,
        0 AS synalog_step
      FROM
        t_3_E AS t_2_E
      WHERE
        (t_2_E.id = 6)
     UNION ALL
    
      SELECT
        t_4_E.boss AS id,
        ((0) + (1)) AS synalog_step
      FROM
        t_3_E AS t_6_E, t_3_E AS t_4_E
      WHERE
        (0 < 10) AND
        (1 = 0) AND
        (t_6_E.id = 6) AND
        (t_4_E.id IS NOT DISTINCT FROM t_6_E.boss)
     UNION ALL
    
      SELECT
        t_8_E.boss AS id,
        ((((0) + (1))) + (1)) AS synalog_step
      FROM
        t_3_E AS t_12_E, t_3_E AS t_10_E, t_3_E AS t_8_E
      WHERE
        (((0) + (1)) < 10) AND
        (0 < 10) AND
        (1 = 0) AND
        (t_8_E.id IS NOT DISTINCT FROM t_10_E.boss) AND
        (t_12_E.id = 6) AND
        (t_10_E.id IS NOT DISTINCT FROM t_12_E.boss)
     UNION ALL
    
      SELECT
        t_14_E.boss AS id,
        ((((((0) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_3_E AS t_20_E, t_3_E AS t_18_E, t_3_E AS t_16_E, t_3_E AS t_14_E
      WHERE
        (((((0) + (1))) + (1)) < 10) AND
        (((0) + (1)) < 10) AND
        (0 < 10) AND
        (1 = 0) AND
        (t_14_E.id IS NOT DISTINCT FROM t_16_E.boss) AND
        (t_16_E.id IS NOT DISTINCT FROM t_18_E.boss) AND
        (t_20_E.id = 6) AND
        (t_18_E.id IS NOT DISTINCT FROM t_20_E.boss)
    
  ) AS UNUSED_TABLE_NAME  
) AS UNUSED_TABLE_NAME
UNION
SELECT
  t_22_E.boss AS id,
  ((t_21_Up_RecursiveCte.synalog_step) + (1)) AS synalog_step
FROM
  t_1_Up_RecursiveCte AS t_21_Up_RecursiveCte, t_3_E AS t_22_E
WHERE
  (t_21_Up_RecursiveCte.synalog_step < 10) AND
  (t_22_E.id IS NOT DISTINCT FROM t_21_Up_RecursiveCte.id)),
t_0_Up AS (SELECT
  Up_RecursiveCte.id AS id
FROM
  t_1_Up_RecursiveCte AS Up_RecursiveCte
GROUP BY Up_RecursiveCte.id)
SELECT
  E.n AS n
FROM
  t_0_Up AS Up, t_3_E AS E
WHERE
  (E.id IS NOT DISTINCT FROM Up.id) ORDER BY n;