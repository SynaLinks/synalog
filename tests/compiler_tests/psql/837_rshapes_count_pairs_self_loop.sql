-- Initializing PostgreSQL environment.
set client_min_messages to warning;
create schema if not exists logica_home;
-- Empty logica type: logicarecord893574736;
DO $$ BEGIN if not exists (select 'I(am) :- I(think)' from pg_type where typname = 'logicarecord893574736') then create type logicarecord893574736 as (nirvana numeric); end if; END $$;

WITH RECURSIVE t_2_E AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      1 AS b
   UNION ALL
  
    SELECT
      1 AS a,
      2 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_P_RecursiveCte AS (SELECT * FROM (
  SELECT * FROM (
    
      SELECT
        E.a AS a,
        E.b AS b,
        0 AS logica_step
      FROM
        t_2_E AS E
     UNION ALL
    
      SELECT
        t_5_E.a AS a,
        t_3_E.b AS b,
        ((0) + (1)) AS logica_step
      FROM
        t_2_E AS t_5_E, t_2_E AS t_3_E
      WHERE
        (0 < 8) AND
        (1 = 0) AND
        (t_3_E.a = t_5_E.b)
     UNION ALL
    
      SELECT
        t_11_E.a AS a,
        t_7_E.b AS b,
        ((((0) + (1))) + (1)) AS logica_step
      FROM
        t_2_E AS t_11_E, t_2_E AS t_9_E, t_2_E AS t_7_E
      WHERE
        (((0) + (1)) < 8) AND
        (0 < 8) AND
        (1 = 0) AND
        (t_7_E.a = t_9_E.b) AND
        (t_9_E.a = t_11_E.b)
     UNION ALL
    
      SELECT
        t_19_E.a AS a,
        t_13_E.b AS b,
        ((((((0) + (1))) + (1))) + (1)) AS logica_step
      FROM
        t_2_E AS t_19_E, t_2_E AS t_17_E, t_2_E AS t_15_E, t_2_E AS t_13_E
      WHERE
        (((((0) + (1))) + (1)) < 8) AND
        (((0) + (1)) < 8) AND
        (0 < 8) AND
        (1 = 0) AND
        (t_13_E.a = t_15_E.b) AND
        (t_15_E.a = t_17_E.b) AND
        (t_17_E.a = t_19_E.b)
     UNION ALL
    
      SELECT
        t_29_E.a AS a,
        t_21_E.b AS b,
        ((((((((0) + (1))) + (1))) + (1))) + (1)) AS logica_step
      FROM
        t_2_E AS t_29_E, t_2_E AS t_27_E, t_2_E AS t_25_E, t_2_E AS t_23_E, t_2_E AS t_21_E
      WHERE
        (((((((0) + (1))) + (1))) + (1)) < 8) AND
        (((((0) + (1))) + (1)) < 8) AND
        (((0) + (1)) < 8) AND
        (0 < 8) AND
        (1 = 0) AND
        (t_21_E.a = t_23_E.b) AND
        (t_23_E.a = t_25_E.b) AND
        (t_25_E.a = t_27_E.b) AND
        (t_27_E.a = t_29_E.b)
     UNION ALL
    
      SELECT
        t_41_E.a AS a,
        t_31_E.b AS b,
        ((((((((((0) + (1))) + (1))) + (1))) + (1))) + (1)) AS logica_step
      FROM
        t_2_E AS t_41_E, t_2_E AS t_39_E, t_2_E AS t_37_E, t_2_E AS t_35_E, t_2_E AS t_33_E, t_2_E AS t_31_E
      WHERE
        (((((((((0) + (1))) + (1))) + (1))) + (1)) < 8) AND
        (((((((0) + (1))) + (1))) + (1)) < 8) AND
        (((((0) + (1))) + (1)) < 8) AND
        (((0) + (1)) < 8) AND
        (0 < 8) AND
        (1 = 0) AND
        (t_31_E.a = t_33_E.b) AND
        (t_33_E.a = t_35_E.b) AND
        (t_35_E.a = t_37_E.b) AND
        (t_37_E.a = t_39_E.b) AND
        (t_39_E.a = t_41_E.b)
    
  ) AS UNUSED_TABLE_NAME  
) AS UNUSED_TABLE_NAME
UNION
SELECT
  t_42_P_RecursiveCte.a AS a,
  t_43_E.b AS b,
  ((t_42_P_RecursiveCte.logica_step) + (1)) AS logica_step
FROM
  t_1_P_RecursiveCte AS t_42_P_RecursiveCte, t_2_E AS t_43_E
WHERE
  (t_42_P_RecursiveCte.logica_step < 8) AND
  (t_43_E.a = t_42_P_RecursiveCte.b)),
t_0_P AS (SELECT
  P_RecursiveCte.a AS a,
  P_RecursiveCte.b AS b
FROM
  t_1_P_RecursiveCte AS P_RecursiveCte
GROUP BY P_RecursiveCte.a, P_RecursiveCte.b)
SELECT
  SUM(1) AS n
FROM
  t_0_P AS P;