-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists synalog_home;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

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
      3 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      4 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_0_P_RecursiveCte AS (SELECT * FROM (
  SELECT * FROM (
    
      SELECT
        E.b AS n,
        1 AS l,
        0 AS synalog_step
      FROM
        t_1_E AS E
      WHERE
        (E.a = 1)
     UNION ALL
    
      SELECT
        t_2_E.b AS n,
        ((1) + (1)) AS l,
        ((0) + (1)) AS synalog_step
      FROM
        t_1_E AS t_4_E, t_1_E AS t_2_E
      WHERE
        (1 < 3) AND
        (0 < 5) AND
        (1 = 0) AND
        (t_4_E.a = 1) AND
        (COALESCE(t_2_E.a, 0) = COALESCE(t_4_E.b, 0) AND (t_2_E.a IS NULL) = (t_4_E.b IS NULL))
     UNION ALL
    
      SELECT
        t_6_E.b AS n,
        ((((1) + (1))) + (1)) AS l,
        ((((0) + (1))) + (1)) AS synalog_step
      FROM
        t_1_E AS t_10_E, t_1_E AS t_8_E, t_1_E AS t_6_E
      WHERE
        (((1) + (1)) < 3) AND
        (((0) + (1)) < 5) AND
        (1 < 3) AND
        (0 < 5) AND
        (1 = 0) AND
        (COALESCE(t_6_E.a, 0) = COALESCE(t_8_E.b, 0) AND (t_6_E.a IS NULL) = (t_8_E.b IS NULL)) AND
        (t_10_E.a = 1) AND
        (COALESCE(t_8_E.a, 0) = COALESCE(t_10_E.b, 0) AND (t_8_E.a IS NULL) = (t_10_E.b IS NULL))
     UNION ALL
    
      SELECT
        t_12_E.b AS n,
        ((((((1) + (1))) + (1))) + (1)) AS l,
        ((((((0) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_1_E AS t_18_E, t_1_E AS t_16_E, t_1_E AS t_14_E, t_1_E AS t_12_E
      WHERE
        (((((1) + (1))) + (1)) < 3) AND
        (((((0) + (1))) + (1)) < 5) AND
        (((1) + (1)) < 3) AND
        (((0) + (1)) < 5) AND
        (1 < 3) AND
        (0 < 5) AND
        (1 = 0) AND
        (COALESCE(t_12_E.a, 0) = COALESCE(t_14_E.b, 0) AND (t_12_E.a IS NULL) = (t_14_E.b IS NULL)) AND
        (COALESCE(t_14_E.a, 0) = COALESCE(t_16_E.b, 0) AND (t_14_E.a IS NULL) = (t_16_E.b IS NULL)) AND
        (t_18_E.a = 1) AND
        (COALESCE(t_16_E.a, 0) = COALESCE(t_18_E.b, 0) AND (t_16_E.a IS NULL) = (t_18_E.b IS NULL))
     UNION ALL
    
      SELECT
        t_20_E.b AS n,
        ((((((((1) + (1))) + (1))) + (1))) + (1)) AS l,
        ((((((((0) + (1))) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_1_E AS t_28_E, t_1_E AS t_26_E, t_1_E AS t_24_E, t_1_E AS t_22_E, t_1_E AS t_20_E
      WHERE
        (((((((1) + (1))) + (1))) + (1)) < 3) AND
        (((((((0) + (1))) + (1))) + (1)) < 5) AND
        (((((1) + (1))) + (1)) < 3) AND
        (((((0) + (1))) + (1)) < 5) AND
        (((1) + (1)) < 3) AND
        (((0) + (1)) < 5) AND
        (1 < 3) AND
        (0 < 5) AND
        (1 = 0) AND
        (COALESCE(t_20_E.a, 0) = COALESCE(t_22_E.b, 0) AND (t_20_E.a IS NULL) = (t_22_E.b IS NULL)) AND
        (COALESCE(t_22_E.a, 0) = COALESCE(t_24_E.b, 0) AND (t_22_E.a IS NULL) = (t_24_E.b IS NULL)) AND
        (COALESCE(t_24_E.a, 0) = COALESCE(t_26_E.b, 0) AND (t_24_E.a IS NULL) = (t_26_E.b IS NULL)) AND
        (t_28_E.a = 1) AND
        (COALESCE(t_26_E.a, 0) = COALESCE(t_28_E.b, 0) AND (t_26_E.a IS NULL) = (t_28_E.b IS NULL))
     UNION ALL
    
      SELECT
        t_30_E.b AS n,
        ((((((((((1) + (1))) + (1))) + (1))) + (1))) + (1)) AS l,
        ((((((((((0) + (1))) + (1))) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_1_E AS t_40_E, t_1_E AS t_38_E, t_1_E AS t_36_E, t_1_E AS t_34_E, t_1_E AS t_32_E, t_1_E AS t_30_E
      WHERE
        (((((((((1) + (1))) + (1))) + (1))) + (1)) < 3) AND
        (((((((((0) + (1))) + (1))) + (1))) + (1)) < 5) AND
        (((((((1) + (1))) + (1))) + (1)) < 3) AND
        (((((((0) + (1))) + (1))) + (1)) < 5) AND
        (((((1) + (1))) + (1)) < 3) AND
        (((((0) + (1))) + (1)) < 5) AND
        (((1) + (1)) < 3) AND
        (((0) + (1)) < 5) AND
        (1 < 3) AND
        (0 < 5) AND
        (1 = 0) AND
        (COALESCE(t_30_E.a, 0) = COALESCE(t_32_E.b, 0) AND (t_30_E.a IS NULL) = (t_32_E.b IS NULL)) AND
        (COALESCE(t_32_E.a, 0) = COALESCE(t_34_E.b, 0) AND (t_32_E.a IS NULL) = (t_34_E.b IS NULL)) AND
        (COALESCE(t_34_E.a, 0) = COALESCE(t_36_E.b, 0) AND (t_34_E.a IS NULL) = (t_36_E.b IS NULL)) AND
        (COALESCE(t_36_E.a, 0) = COALESCE(t_38_E.b, 0) AND (t_36_E.a IS NULL) = (t_38_E.b IS NULL)) AND
        (t_40_E.a = 1) AND
        (COALESCE(t_38_E.a, 0) = COALESCE(t_40_E.b, 0) AND (t_38_E.a IS NULL) = (t_40_E.b IS NULL))
    
  ) AS UNUSED_TABLE_NAME  
) AS UNUSED_TABLE_NAME
UNION
SELECT
  t_42_E.b AS n,
  ((t_41_P_RecursiveCte.l) + (1)) AS l,
  ((t_41_P_RecursiveCte.synalog_step) + (1)) AS synalog_step
FROM
  t_0_P_RecursiveCte AS t_41_P_RecursiveCte, t_1_E AS t_42_E
WHERE
  (t_41_P_RecursiveCte.l < 3) AND
  (t_41_P_RecursiveCte.synalog_step < 5) AND
  (COALESCE(t_42_E.a, 0) = COALESCE(t_41_P_RecursiveCte.n, 0) AND (t_42_E.a IS NULL) = (t_41_P_RecursiveCte.n IS NULL)))
SELECT
  P_RecursiveCte.n AS n,
  P_RecursiveCte.l AS l
FROM
  t_0_P_RecursiveCte AS P_RecursiveCte
GROUP BY P_RecursiveCte.n, P_RecursiveCte.l ORDER BY n, l;