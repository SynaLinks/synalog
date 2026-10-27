WITH RECURSIVE t_2_ParentOf AS (SELECT * FROM (
  
    SELECT
      1 AS parent_id,
      2 AS child_id
   UNION ALL
  
    SELECT
      2 AS parent_id,
      3 AS child_id
   UNION ALL
  
    SELECT
      3 AS parent_id,
      1 AS child_id
   UNION ALL
  
    SELECT
      3 AS parent_id,
      4 AS child_id
  
) AS UNUSED_TABLE_NAME  ),
t_1_Anc_RecursiveCte AS (SELECT * FROM (
  SELECT * FROM (
    
      SELECT
        ParentOf.parent_id AS a,
        ParentOf.child_id AS d,
        0 AS synalog_step
      FROM
        t_2_ParentOf AS ParentOf
     UNION ALL
    
      SELECT
        t_5_ParentOf.parent_id AS a,
        t_3_ParentOf.child_id AS d,
        ((0) + (1)) AS synalog_step
      FROM
        t_2_ParentOf AS t_5_ParentOf, t_2_ParentOf AS t_3_ParentOf
      WHERE
        (0 < 8) AND
        (1 = 0) AND
        (t_3_ParentOf.parent_id IS t_5_ParentOf.child_id)
     UNION ALL
    
      SELECT
        t_11_ParentOf.parent_id AS a,
        t_7_ParentOf.child_id AS d,
        ((((0) + (1))) + (1)) AS synalog_step
      FROM
        t_2_ParentOf AS t_11_ParentOf, t_2_ParentOf AS t_9_ParentOf, t_2_ParentOf AS t_7_ParentOf
      WHERE
        (((0) + (1)) < 8) AND
        (0 < 8) AND
        (1 = 0) AND
        (t_7_ParentOf.parent_id IS t_9_ParentOf.child_id) AND
        (t_9_ParentOf.parent_id IS t_11_ParentOf.child_id)
     UNION ALL
    
      SELECT
        t_19_ParentOf.parent_id AS a,
        t_13_ParentOf.child_id AS d,
        ((((((0) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_2_ParentOf AS t_19_ParentOf, t_2_ParentOf AS t_17_ParentOf, t_2_ParentOf AS t_15_ParentOf, t_2_ParentOf AS t_13_ParentOf
      WHERE
        (((((0) + (1))) + (1)) < 8) AND
        (((0) + (1)) < 8) AND
        (0 < 8) AND
        (1 = 0) AND
        (t_13_ParentOf.parent_id IS t_15_ParentOf.child_id) AND
        (t_15_ParentOf.parent_id IS t_17_ParentOf.child_id) AND
        (t_17_ParentOf.parent_id IS t_19_ParentOf.child_id)
     UNION ALL
    
      SELECT
        t_29_ParentOf.parent_id AS a,
        t_21_ParentOf.child_id AS d,
        ((((((((0) + (1))) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_2_ParentOf AS t_29_ParentOf, t_2_ParentOf AS t_27_ParentOf, t_2_ParentOf AS t_25_ParentOf, t_2_ParentOf AS t_23_ParentOf, t_2_ParentOf AS t_21_ParentOf
      WHERE
        (((((((0) + (1))) + (1))) + (1)) < 8) AND
        (((((0) + (1))) + (1)) < 8) AND
        (((0) + (1)) < 8) AND
        (0 < 8) AND
        (1 = 0) AND
        (t_21_ParentOf.parent_id IS t_23_ParentOf.child_id) AND
        (t_23_ParentOf.parent_id IS t_25_ParentOf.child_id) AND
        (t_25_ParentOf.parent_id IS t_27_ParentOf.child_id) AND
        (t_27_ParentOf.parent_id IS t_29_ParentOf.child_id)
     UNION ALL
    
      SELECT
        t_41_ParentOf.parent_id AS a,
        t_31_ParentOf.child_id AS d,
        ((((((((((0) + (1))) + (1))) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_2_ParentOf AS t_41_ParentOf, t_2_ParentOf AS t_39_ParentOf, t_2_ParentOf AS t_37_ParentOf, t_2_ParentOf AS t_35_ParentOf, t_2_ParentOf AS t_33_ParentOf, t_2_ParentOf AS t_31_ParentOf
      WHERE
        (((((((((0) + (1))) + (1))) + (1))) + (1)) < 8) AND
        (((((((0) + (1))) + (1))) + (1)) < 8) AND
        (((((0) + (1))) + (1)) < 8) AND
        (((0) + (1)) < 8) AND
        (0 < 8) AND
        (1 = 0) AND
        (t_31_ParentOf.parent_id IS t_33_ParentOf.child_id) AND
        (t_33_ParentOf.parent_id IS t_35_ParentOf.child_id) AND
        (t_35_ParentOf.parent_id IS t_37_ParentOf.child_id) AND
        (t_37_ParentOf.parent_id IS t_39_ParentOf.child_id) AND
        (t_39_ParentOf.parent_id IS t_41_ParentOf.child_id)
    
  ) AS UNUSED_TABLE_NAME  
) AS UNUSED_TABLE_NAME
UNION
SELECT
  t_42_Anc_RecursiveCte.a AS a,
  t_43_ParentOf.child_id AS d,
  ((t_42_Anc_RecursiveCte.synalog_step) + (1)) AS synalog_step
FROM
  t_1_Anc_RecursiveCte AS t_42_Anc_RecursiveCte, t_2_ParentOf AS t_43_ParentOf
WHERE
  (t_42_Anc_RecursiveCte.synalog_step < 8) AND
  (t_43_ParentOf.parent_id IS t_42_Anc_RecursiveCte.d)),
t_0_Anc AS (SELECT
  Anc_RecursiveCte.a AS a,
  Anc_RecursiveCte.d AS d
FROM
  t_1_Anc_RecursiveCte AS Anc_RecursiveCte
GROUP BY Anc_RecursiveCte.a, Anc_RecursiveCte.d)
SELECT
  Anc.a AS n
FROM
  t_0_Anc AS Anc
WHERE
  (Anc.d IS Anc.a)
GROUP BY Anc.a ORDER BY n NULLS LAST;