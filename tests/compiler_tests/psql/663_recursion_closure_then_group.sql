-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists synalog_home;
-- Empty synalog type: synalogrecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'synalogrecord893574736') then create type synalogrecord893574736 as (nirvana numeric); end if; END $$;

WITH RECURSIVE t_4_E AS (SELECT * FROM (
  
    SELECT
      'a' AS a,
      'b' AS b
   UNION ALL
  
    SELECT
      'b' AS a,
      'c' AS b
  
) AS UNUSED_TABLE_NAME  ),
t_3_P_RecursiveCte AS (SELECT * FROM (
  SELECT * FROM (
    
      SELECT
        E.a AS s,
        E.b AS t,
        0 AS synalog_step
      FROM
        t_4_E AS E
     UNION ALL
    
      SELECT
        t_7_E.a AS s,
        t_5_E.b AS t,
        ((0) + (1)) AS synalog_step
      FROM
        t_4_E AS t_7_E, t_4_E AS t_5_E
      WHERE
        (0 < 5) AND
        (1 = 0) AND
        (COALESCE(t_5_E.a, '') = COALESCE(t_7_E.b, '') AND (t_5_E.a IS NULL) = (t_7_E.b IS NULL))
     UNION ALL
    
      SELECT
        t_13_E.a AS s,
        t_9_E.b AS t,
        ((((0) + (1))) + (1)) AS synalog_step
      FROM
        t_4_E AS t_13_E, t_4_E AS t_11_E, t_4_E AS t_9_E
      WHERE
        (((0) + (1)) < 5) AND
        (0 < 5) AND
        (1 = 0) AND
        (COALESCE(t_9_E.a, '') = COALESCE(t_11_E.b, '') AND (t_9_E.a IS NULL) = (t_11_E.b IS NULL)) AND
        (COALESCE(t_11_E.a, '') = COALESCE(t_13_E.b, '') AND (t_11_E.a IS NULL) = (t_13_E.b IS NULL))
     UNION ALL
    
      SELECT
        t_21_E.a AS s,
        t_15_E.b AS t,
        ((((((0) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_4_E AS t_21_E, t_4_E AS t_19_E, t_4_E AS t_17_E, t_4_E AS t_15_E
      WHERE
        (((((0) + (1))) + (1)) < 5) AND
        (((0) + (1)) < 5) AND
        (0 < 5) AND
        (1 = 0) AND
        (COALESCE(t_15_E.a, '') = COALESCE(t_17_E.b, '') AND (t_15_E.a IS NULL) = (t_17_E.b IS NULL)) AND
        (COALESCE(t_17_E.a, '') = COALESCE(t_19_E.b, '') AND (t_17_E.a IS NULL) = (t_19_E.b IS NULL)) AND
        (COALESCE(t_19_E.a, '') = COALESCE(t_21_E.b, '') AND (t_19_E.a IS NULL) = (t_21_E.b IS NULL))
     UNION ALL
    
      SELECT
        t_31_E.a AS s,
        t_23_E.b AS t,
        ((((((((0) + (1))) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_4_E AS t_31_E, t_4_E AS t_29_E, t_4_E AS t_27_E, t_4_E AS t_25_E, t_4_E AS t_23_E
      WHERE
        (((((((0) + (1))) + (1))) + (1)) < 5) AND
        (((((0) + (1))) + (1)) < 5) AND
        (((0) + (1)) < 5) AND
        (0 < 5) AND
        (1 = 0) AND
        (COALESCE(t_23_E.a, '') = COALESCE(t_25_E.b, '') AND (t_23_E.a IS NULL) = (t_25_E.b IS NULL)) AND
        (COALESCE(t_25_E.a, '') = COALESCE(t_27_E.b, '') AND (t_25_E.a IS NULL) = (t_27_E.b IS NULL)) AND
        (COALESCE(t_27_E.a, '') = COALESCE(t_29_E.b, '') AND (t_27_E.a IS NULL) = (t_29_E.b IS NULL)) AND
        (COALESCE(t_29_E.a, '') = COALESCE(t_31_E.b, '') AND (t_29_E.a IS NULL) = (t_31_E.b IS NULL))
     UNION ALL
    
      SELECT
        t_43_E.a AS s,
        t_33_E.b AS t,
        ((((((((((0) + (1))) + (1))) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_4_E AS t_43_E, t_4_E AS t_41_E, t_4_E AS t_39_E, t_4_E AS t_37_E, t_4_E AS t_35_E, t_4_E AS t_33_E
      WHERE
        (((((((((0) + (1))) + (1))) + (1))) + (1)) < 5) AND
        (((((((0) + (1))) + (1))) + (1)) < 5) AND
        (((((0) + (1))) + (1)) < 5) AND
        (((0) + (1)) < 5) AND
        (0 < 5) AND
        (1 = 0) AND
        (COALESCE(t_33_E.a, '') = COALESCE(t_35_E.b, '') AND (t_33_E.a IS NULL) = (t_35_E.b IS NULL)) AND
        (COALESCE(t_35_E.a, '') = COALESCE(t_37_E.b, '') AND (t_35_E.a IS NULL) = (t_37_E.b IS NULL)) AND
        (COALESCE(t_37_E.a, '') = COALESCE(t_39_E.b, '') AND (t_37_E.a IS NULL) = (t_39_E.b IS NULL)) AND
        (COALESCE(t_39_E.a, '') = COALESCE(t_41_E.b, '') AND (t_39_E.a IS NULL) = (t_41_E.b IS NULL)) AND
        (COALESCE(t_41_E.a, '') = COALESCE(t_43_E.b, '') AND (t_41_E.a IS NULL) = (t_43_E.b IS NULL))
    
  ) AS UNUSED_TABLE_NAME  
) AS UNUSED_TABLE_NAME
UNION
SELECT
  t_44_P_RecursiveCte.s AS s,
  t_45_E.b AS t,
  ((t_44_P_RecursiveCte.synalog_step) + (1)) AS synalog_step
FROM
  t_3_P_RecursiveCte AS t_44_P_RecursiveCte, t_4_E AS t_45_E
WHERE
  (t_44_P_RecursiveCte.synalog_step < 5) AND
  (COALESCE(t_45_E.a, '') = COALESCE(t_44_P_RecursiveCte.t, '') AND (t_45_E.a IS NULL) = (t_44_P_RecursiveCte.t IS NULL))),
t_2_P AS (SELECT
  P_RecursiveCte.s AS s,
  P_RecursiveCte.t AS t
FROM
  t_3_P_RecursiveCte AS P_RecursiveCte
GROUP BY P_RecursiveCte.s, P_RecursiveCte.t),
t_1_L AS (SELECT
  P.s AS s,
  ARRAY_AGG(DISTINCT P.t) AS l
FROM
  t_2_P AS P
GROUP BY P.s)
SELECT
  t_0_L.s AS s,
  CARDINALITY(t_0_L.l) AS n
FROM
  t_1_L AS t_0_L ORDER BY s;