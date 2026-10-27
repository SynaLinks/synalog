-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists synalog_home;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

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
        (COALESCE(t_4_E.a, 0) = COALESCE(t_6_E.b, 0) AND (t_4_E.a IS NULL) = (t_6_E.b IS NULL))
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
        (COALESCE(t_8_E.a, 0) = COALESCE(t_10_E.b, 0) AND (t_8_E.a IS NULL) = (t_10_E.b IS NULL)) AND
        (COALESCE(t_10_E.a, 0) = COALESCE(t_12_E.b, 0) AND (t_10_E.a IS NULL) = (t_12_E.b IS NULL))
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
        (COALESCE(t_14_E.a, 0) = COALESCE(t_16_E.b, 0) AND (t_14_E.a IS NULL) = (t_16_E.b IS NULL)) AND
        (COALESCE(t_16_E.a, 0) = COALESCE(t_18_E.b, 0) AND (t_16_E.a IS NULL) = (t_18_E.b IS NULL)) AND
        (COALESCE(t_18_E.a, 0) = COALESCE(t_20_E.b, 0) AND (t_18_E.a IS NULL) = (t_20_E.b IS NULL))
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
        (COALESCE(t_22_E.a, 0) = COALESCE(t_24_E.b, 0) AND (t_22_E.a IS NULL) = (t_24_E.b IS NULL)) AND
        (COALESCE(t_24_E.a, 0) = COALESCE(t_26_E.b, 0) AND (t_24_E.a IS NULL) = (t_26_E.b IS NULL)) AND
        (COALESCE(t_26_E.a, 0) = COALESCE(t_28_E.b, 0) AND (t_26_E.a IS NULL) = (t_28_E.b IS NULL)) AND
        (COALESCE(t_28_E.a, 0) = COALESCE(t_30_E.b, 0) AND (t_28_E.a IS NULL) = (t_30_E.b IS NULL))
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
        (COALESCE(t_32_E.a, 0) = COALESCE(t_34_E.b, 0) AND (t_32_E.a IS NULL) = (t_34_E.b IS NULL)) AND
        (COALESCE(t_34_E.a, 0) = COALESCE(t_36_E.b, 0) AND (t_34_E.a IS NULL) = (t_36_E.b IS NULL)) AND
        (COALESCE(t_36_E.a, 0) = COALESCE(t_38_E.b, 0) AND (t_36_E.a IS NULL) = (t_38_E.b IS NULL)) AND
        (COALESCE(t_38_E.a, 0) = COALESCE(t_40_E.b, 0) AND (t_38_E.a IS NULL) = (t_40_E.b IS NULL)) AND
        (COALESCE(t_40_E.a, 0) = COALESCE(t_42_E.b, 0) AND (t_40_E.a IS NULL) = (t_42_E.b IS NULL))
    
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
  (COALESCE(t_44_E.a, 0) = COALESCE(t_43_P_RecursiveCte.b, 0) AND (t_44_E.a IS NULL) = (t_43_P_RecursiveCte.b IS NULL))),
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
  (COALESCE(t_0_P.a, 0) = COALESCE(P.b, 0) AND (t_0_P.a IS NULL) = (P.b IS NULL));