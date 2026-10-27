WITH RECURSIVE t_2_Edge AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      2 AS b
   UNION ALL
  
    SELECT
      2 AS a,
      3 AS b
   UNION ALL
  
    SELECT
      3 AS a,
      4 AS b
   UNION ALL
  
    SELECT
      4 AS a,
      5 AS b
  
) AS UNUSED_TABLE_NAME  ),
t_1_Path_RecursiveCte AS (SELECT * FROM (
  SELECT * FROM (
    
      SELECT
        Edge.a AS a,
        Edge.b AS b,
        1 AS n,
        0 AS synalog_step
      FROM
        t_2_Edge AS Edge
     UNION ALL
    
      SELECT
        t_5_Edge.a AS a,
        t_3_Edge.b AS b,
        ((1) + (1)) AS n,
        ((0) + (1)) AS synalog_step
      FROM
        t_2_Edge AS t_5_Edge, t_2_Edge AS t_3_Edge
      WHERE
        (1 < 3) AND
        (0 < 30) AND
        (1 = 0) AND
        (t_3_Edge.a IS t_5_Edge.b)
     UNION ALL
    
      SELECT
        t_11_Edge.a AS a,
        t_7_Edge.b AS b,
        ((((1) + (1))) + (1)) AS n,
        ((((0) + (1))) + (1)) AS synalog_step
      FROM
        t_2_Edge AS t_11_Edge, t_2_Edge AS t_9_Edge, t_2_Edge AS t_7_Edge
      WHERE
        (((1) + (1)) < 3) AND
        (((0) + (1)) < 30) AND
        (1 < 3) AND
        (0 < 30) AND
        (1 = 0) AND
        (t_7_Edge.a IS t_9_Edge.b) AND
        (t_9_Edge.a IS t_11_Edge.b)
     UNION ALL
    
      SELECT
        t_19_Edge.a AS a,
        t_13_Edge.b AS b,
        ((((((1) + (1))) + (1))) + (1)) AS n,
        ((((((0) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_2_Edge AS t_19_Edge, t_2_Edge AS t_17_Edge, t_2_Edge AS t_15_Edge, t_2_Edge AS t_13_Edge
      WHERE
        (((((1) + (1))) + (1)) < 3) AND
        (((((0) + (1))) + (1)) < 30) AND
        (((1) + (1)) < 3) AND
        (((0) + (1)) < 30) AND
        (1 < 3) AND
        (0 < 30) AND
        (1 = 0) AND
        (t_13_Edge.a IS t_15_Edge.b) AND
        (t_15_Edge.a IS t_17_Edge.b) AND
        (t_17_Edge.a IS t_19_Edge.b)
     UNION ALL
    
      SELECT
        t_29_Edge.a AS a,
        t_21_Edge.b AS b,
        ((((((((1) + (1))) + (1))) + (1))) + (1)) AS n,
        ((((((((0) + (1))) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_2_Edge AS t_29_Edge, t_2_Edge AS t_27_Edge, t_2_Edge AS t_25_Edge, t_2_Edge AS t_23_Edge, t_2_Edge AS t_21_Edge
      WHERE
        (((((((1) + (1))) + (1))) + (1)) < 3) AND
        (((((((0) + (1))) + (1))) + (1)) < 30) AND
        (((((1) + (1))) + (1)) < 3) AND
        (((((0) + (1))) + (1)) < 30) AND
        (((1) + (1)) < 3) AND
        (((0) + (1)) < 30) AND
        (1 < 3) AND
        (0 < 30) AND
        (1 = 0) AND
        (t_21_Edge.a IS t_23_Edge.b) AND
        (t_23_Edge.a IS t_25_Edge.b) AND
        (t_25_Edge.a IS t_27_Edge.b) AND
        (t_27_Edge.a IS t_29_Edge.b)
     UNION ALL
    
      SELECT
        t_41_Edge.a AS a,
        t_31_Edge.b AS b,
        ((((((((((1) + (1))) + (1))) + (1))) + (1))) + (1)) AS n,
        ((((((((((0) + (1))) + (1))) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_2_Edge AS t_41_Edge, t_2_Edge AS t_39_Edge, t_2_Edge AS t_37_Edge, t_2_Edge AS t_35_Edge, t_2_Edge AS t_33_Edge, t_2_Edge AS t_31_Edge
      WHERE
        (((((((((1) + (1))) + (1))) + (1))) + (1)) < 3) AND
        (((((((((0) + (1))) + (1))) + (1))) + (1)) < 30) AND
        (((((((1) + (1))) + (1))) + (1)) < 3) AND
        (((((((0) + (1))) + (1))) + (1)) < 30) AND
        (((((1) + (1))) + (1)) < 3) AND
        (((((0) + (1))) + (1)) < 30) AND
        (((1) + (1)) < 3) AND
        (((0) + (1)) < 30) AND
        (1 < 3) AND
        (0 < 30) AND
        (1 = 0) AND
        (t_31_Edge.a IS t_33_Edge.b) AND
        (t_33_Edge.a IS t_35_Edge.b) AND
        (t_35_Edge.a IS t_37_Edge.b) AND
        (t_37_Edge.a IS t_39_Edge.b) AND
        (t_39_Edge.a IS t_41_Edge.b)
     UNION ALL
    
      SELECT
        t_55_Edge.a AS a,
        t_43_Edge.b AS b,
        ((((((((((((1) + (1))) + (1))) + (1))) + (1))) + (1))) + (1)) AS n,
        ((((((((((((0) + (1))) + (1))) + (1))) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_2_Edge AS t_55_Edge, t_2_Edge AS t_53_Edge, t_2_Edge AS t_51_Edge, t_2_Edge AS t_49_Edge, t_2_Edge AS t_47_Edge, t_2_Edge AS t_45_Edge, t_2_Edge AS t_43_Edge
      WHERE
        (((((((((((1) + (1))) + (1))) + (1))) + (1))) + (1)) < 3) AND
        (((((((((((0) + (1))) + (1))) + (1))) + (1))) + (1)) < 30) AND
        (((((((((1) + (1))) + (1))) + (1))) + (1)) < 3) AND
        (((((((((0) + (1))) + (1))) + (1))) + (1)) < 30) AND
        (((((((1) + (1))) + (1))) + (1)) < 3) AND
        (((((((0) + (1))) + (1))) + (1)) < 30) AND
        (((((1) + (1))) + (1)) < 3) AND
        (((((0) + (1))) + (1)) < 30) AND
        (((1) + (1)) < 3) AND
        (((0) + (1)) < 30) AND
        (1 < 3) AND
        (0 < 30) AND
        (1 = 0) AND
        (t_43_Edge.a IS t_45_Edge.b) AND
        (t_45_Edge.a IS t_47_Edge.b) AND
        (t_47_Edge.a IS t_49_Edge.b) AND
        (t_49_Edge.a IS t_51_Edge.b) AND
        (t_51_Edge.a IS t_53_Edge.b) AND
        (t_53_Edge.a IS t_55_Edge.b)
     UNION ALL
    
      SELECT
        t_71_Edge.a AS a,
        t_57_Edge.b AS b,
        ((x_384.value) + (1)) AS n,
        ((x_385.value) + (1)) AS synalog_step
      FROM
        t_2_Edge AS t_71_Edge, t_2_Edge AS t_69_Edge, t_2_Edge AS t_67_Edge, t_2_Edge AS t_65_Edge, t_2_Edge AS t_63_Edge, t_2_Edge AS t_61_Edge, t_2_Edge AS t_59_Edge, t_2_Edge AS t_57_Edge, JSON_EACH(JSON_ARRAY(((((((((((((1) + (1))) + (1))) + (1))) + (1))) + (1))) + (1)))) as x_384, JSON_EACH(JSON_ARRAY(((((((((((((0) + (1))) + (1))) + (1))) + (1))) + (1))) + (1)))) as x_385
      WHERE
        (x_384.value < 3) AND
        (x_385.value < 30) AND
        (((((((((((1) + (1))) + (1))) + (1))) + (1))) + (1)) < 3) AND
        (((((((((((0) + (1))) + (1))) + (1))) + (1))) + (1)) < 30) AND
        (((((((((1) + (1))) + (1))) + (1))) + (1)) < 3) AND
        (((((((((0) + (1))) + (1))) + (1))) + (1)) < 30) AND
        (((((((1) + (1))) + (1))) + (1)) < 3) AND
        (((((((0) + (1))) + (1))) + (1)) < 30) AND
        (((((1) + (1))) + (1)) < 3) AND
        (((((0) + (1))) + (1)) < 30) AND
        (((1) + (1)) < 3) AND
        (((0) + (1)) < 30) AND
        (1 < 3) AND
        (0 < 30) AND
        (1 = 0) AND
        (t_57_Edge.a IS t_59_Edge.b) AND
        (t_59_Edge.a IS t_61_Edge.b) AND
        (t_61_Edge.a IS t_63_Edge.b) AND
        (t_63_Edge.a IS t_65_Edge.b) AND
        (t_65_Edge.a IS t_67_Edge.b) AND
        (t_67_Edge.a IS t_69_Edge.b) AND
        (t_69_Edge.a IS t_71_Edge.b)
    
  ) AS UNUSED_TABLE_NAME  
) AS UNUSED_TABLE_NAME
UNION
SELECT
  t_72_Path_RecursiveCte.a AS a,
  t_73_Edge.b AS b,
  ((t_72_Path_RecursiveCte.n) + (1)) AS n,
  ((t_72_Path_RecursiveCte.synalog_step) + (1)) AS synalog_step
FROM
  t_1_Path_RecursiveCte AS t_72_Path_RecursiveCte, t_2_Edge AS t_73_Edge
WHERE
  (t_72_Path_RecursiveCte.n < 3) AND
  (t_72_Path_RecursiveCte.synalog_step < 30) AND
  (t_73_Edge.a IS t_72_Path_RecursiveCte.b)),
t_0_Path AS (SELECT
  Path_RecursiveCte.a AS a,
  Path_RecursiveCte.b AS b,
  Path_RecursiveCte.n AS n
FROM
  t_1_Path_RecursiveCte AS Path_RecursiveCte
GROUP BY Path_RecursiveCte.a, Path_RecursiveCte.b, Path_RecursiveCte.n)
SELECT
  Path.n AS n
FROM
  t_0_Path AS Path
GROUP BY Path.n ORDER BY n NULLS LAST;