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
        (t_5_E.a IS t_7_E.b)
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
        (t_9_E.a IS t_11_E.b) AND
        (t_11_E.a IS t_13_E.b)
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
        (t_15_E.a IS t_17_E.b) AND
        (t_17_E.a IS t_19_E.b) AND
        (t_19_E.a IS t_21_E.b)
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
        (t_23_E.a IS t_25_E.b) AND
        (t_25_E.a IS t_27_E.b) AND
        (t_27_E.a IS t_29_E.b) AND
        (t_29_E.a IS t_31_E.b)
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
        (t_33_E.a IS t_35_E.b) AND
        (t_35_E.a IS t_37_E.b) AND
        (t_37_E.a IS t_39_E.b) AND
        (t_39_E.a IS t_41_E.b) AND
        (t_41_E.a IS t_43_E.b)
    
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
  (t_45_E.a IS t_44_P_RecursiveCte.t)),
t_2_P AS (SELECT
  P_RecursiveCte.s AS s,
  P_RecursiveCte.t AS t
FROM
  t_3_P_RecursiveCte AS P_RecursiveCte
GROUP BY P_RecursiveCte.s, P_RecursiveCte.t),
t_1_L AS (SELECT
  P.s AS s,
  DistinctListAgg(P.t) AS l
FROM
  t_2_P AS P
GROUP BY P.s)
SELECT
  t_0_L.s AS s,
  JSON_ARRAY_LENGTH(t_0_L.l) AS n
FROM
  t_1_L AS t_0_L ORDER BY s NULLS LAST;