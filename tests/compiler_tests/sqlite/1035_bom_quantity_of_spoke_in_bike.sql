WITH RECURSIVE t_2_Uses AS (SELECT * FROM (
  
    SELECT
      'bike' AS part,
      'frame' AS component,
      1 AS qty
   UNION ALL
  
    SELECT
      'bike' AS part,
      'wheel' AS component,
      2 AS qty
   UNION ALL
  
    SELECT
      'wheel' AS part,
      'rim' AS component,
      1 AS qty
   UNION ALL
  
    SELECT
      'wheel' AS part,
      'spoke' AS component,
      32 AS qty
   UNION ALL
  
    SELECT
      'wheel' AS part,
      'hub' AS component,
      1 AS qty
   UNION ALL
  
    SELECT
      'hub' AS part,
      'bearing' AS component,
      2 AS qty
   UNION ALL
  
    SELECT
      'frame' AS part,
      'tube' AS component,
      3 AS qty
   UNION ALL
  
    SELECT
      'scooter' AS part,
      'wheel' AS component,
      2 AS qty
   UNION ALL
  
    SELECT
      'scooter' AS part,
      'deck' AS component,
      1 AS qty
  
) AS UNUSED_TABLE_NAME  ),
t_1_Need_RecursiveCte AS (SELECT * FROM (
  SELECT * FROM (
    
      SELECT
        Uses.part AS part,
        Uses.component AS component,
        Uses.component AS path_id,
        Uses.qty AS n,
        0 AS synalog_step
      FROM
        t_2_Uses AS Uses
     UNION ALL
    
      SELECT
        t_5_Uses.part AS part,
        t_3_Uses.component AS component,
        ((((t_5_Uses.component) || ('/'))) || (t_3_Uses.component)) AS path_id,
        ((t_5_Uses.qty) * (t_3_Uses.qty)) AS n,
        ((0) + (1)) AS synalog_step
      FROM
        t_2_Uses AS t_5_Uses, t_2_Uses AS t_3_Uses
      WHERE
        (0 < 6) AND
        (1 = 0) AND
        (t_3_Uses.part IS t_5_Uses.component)
     UNION ALL
    
      SELECT
        t_11_Uses.part AS part,
        t_7_Uses.component AS component,
        ((((((((t_11_Uses.component) || ('/'))) || (t_9_Uses.component))) || ('/'))) || (t_7_Uses.component)) AS path_id,
        ((((t_11_Uses.qty) * (t_9_Uses.qty))) * (t_7_Uses.qty)) AS n,
        ((((0) + (1))) + (1)) AS synalog_step
      FROM
        t_2_Uses AS t_11_Uses, t_2_Uses AS t_9_Uses, t_2_Uses AS t_7_Uses
      WHERE
        (((0) + (1)) < 6) AND
        (0 < 6) AND
        (1 = 0) AND
        (t_7_Uses.part IS t_9_Uses.component) AND
        (t_9_Uses.part IS t_11_Uses.component)
     UNION ALL
    
      SELECT
        t_19_Uses.part AS part,
        t_13_Uses.component AS component,
        ((((((((((((t_19_Uses.component) || ('/'))) || (t_17_Uses.component))) || ('/'))) || (t_15_Uses.component))) || ('/'))) || (t_13_Uses.component)) AS path_id,
        ((((((t_19_Uses.qty) * (t_17_Uses.qty))) * (t_15_Uses.qty))) * (t_13_Uses.qty)) AS n,
        ((((((0) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_2_Uses AS t_19_Uses, t_2_Uses AS t_17_Uses, t_2_Uses AS t_15_Uses, t_2_Uses AS t_13_Uses
      WHERE
        (((((0) + (1))) + (1)) < 6) AND
        (((0) + (1)) < 6) AND
        (0 < 6) AND
        (1 = 0) AND
        (t_13_Uses.part IS t_15_Uses.component) AND
        (t_15_Uses.part IS t_17_Uses.component) AND
        (t_17_Uses.part IS t_19_Uses.component)
     UNION ALL
    
      SELECT
        t_29_Uses.part AS part,
        t_21_Uses.component AS component,
        ((((((((((((((((t_29_Uses.component) || ('/'))) || (t_27_Uses.component))) || ('/'))) || (t_25_Uses.component))) || ('/'))) || (t_23_Uses.component))) || ('/'))) || (t_21_Uses.component)) AS path_id,
        ((((((((t_29_Uses.qty) * (t_27_Uses.qty))) * (t_25_Uses.qty))) * (t_23_Uses.qty))) * (t_21_Uses.qty)) AS n,
        ((((((((0) + (1))) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_2_Uses AS t_29_Uses, t_2_Uses AS t_27_Uses, t_2_Uses AS t_25_Uses, t_2_Uses AS t_23_Uses, t_2_Uses AS t_21_Uses
      WHERE
        (((((((0) + (1))) + (1))) + (1)) < 6) AND
        (((((0) + (1))) + (1)) < 6) AND
        (((0) + (1)) < 6) AND
        (0 < 6) AND
        (1 = 0) AND
        (t_21_Uses.part IS t_23_Uses.component) AND
        (t_23_Uses.part IS t_25_Uses.component) AND
        (t_25_Uses.part IS t_27_Uses.component) AND
        (t_27_Uses.part IS t_29_Uses.component)
     UNION ALL
    
      SELECT
        t_41_Uses.part AS part,
        t_31_Uses.component AS component,
        ((((((((((((((((((((t_41_Uses.component) || ('/'))) || (t_39_Uses.component))) || ('/'))) || (t_37_Uses.component))) || ('/'))) || (t_35_Uses.component))) || ('/'))) || (t_33_Uses.component))) || ('/'))) || (t_31_Uses.component)) AS path_id,
        ((((((((((t_41_Uses.qty) * (t_39_Uses.qty))) * (t_37_Uses.qty))) * (t_35_Uses.qty))) * (t_33_Uses.qty))) * (t_31_Uses.qty)) AS n,
        ((((((((((0) + (1))) + (1))) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_2_Uses AS t_41_Uses, t_2_Uses AS t_39_Uses, t_2_Uses AS t_37_Uses, t_2_Uses AS t_35_Uses, t_2_Uses AS t_33_Uses, t_2_Uses AS t_31_Uses
      WHERE
        (((((((((0) + (1))) + (1))) + (1))) + (1)) < 6) AND
        (((((((0) + (1))) + (1))) + (1)) < 6) AND
        (((((0) + (1))) + (1)) < 6) AND
        (((0) + (1)) < 6) AND
        (0 < 6) AND
        (1 = 0) AND
        (t_31_Uses.part IS t_33_Uses.component) AND
        (t_33_Uses.part IS t_35_Uses.component) AND
        (t_35_Uses.part IS t_37_Uses.component) AND
        (t_37_Uses.part IS t_39_Uses.component) AND
        (t_39_Uses.part IS t_41_Uses.component)
     UNION ALL
    
      SELECT
        t_55_Uses.part AS part,
        t_43_Uses.component AS component,
        ((((((((((((((((((((((((t_55_Uses.component) || ('/'))) || (t_53_Uses.component))) || ('/'))) || (t_51_Uses.component))) || ('/'))) || (t_49_Uses.component))) || ('/'))) || (t_47_Uses.component))) || ('/'))) || (t_45_Uses.component))) || ('/'))) || (t_43_Uses.component)) AS path_id,
        ((((((((((((t_55_Uses.qty) * (t_53_Uses.qty))) * (t_51_Uses.qty))) * (t_49_Uses.qty))) * (t_47_Uses.qty))) * (t_45_Uses.qty))) * (t_43_Uses.qty)) AS n,
        ((((((((((((0) + (1))) + (1))) + (1))) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_2_Uses AS t_55_Uses, t_2_Uses AS t_53_Uses, t_2_Uses AS t_51_Uses, t_2_Uses AS t_49_Uses, t_2_Uses AS t_47_Uses, t_2_Uses AS t_45_Uses, t_2_Uses AS t_43_Uses
      WHERE
        (((((((((((0) + (1))) + (1))) + (1))) + (1))) + (1)) < 6) AND
        (((((((((0) + (1))) + (1))) + (1))) + (1)) < 6) AND
        (((((((0) + (1))) + (1))) + (1)) < 6) AND
        (((((0) + (1))) + (1)) < 6) AND
        (((0) + (1)) < 6) AND
        (0 < 6) AND
        (1 = 0) AND
        (t_43_Uses.part IS t_45_Uses.component) AND
        (t_45_Uses.part IS t_47_Uses.component) AND
        (t_47_Uses.part IS t_49_Uses.component) AND
        (t_49_Uses.part IS t_51_Uses.component) AND
        (t_51_Uses.part IS t_53_Uses.component) AND
        (t_53_Uses.part IS t_55_Uses.component)
     UNION ALL
    
      SELECT
        t_71_Uses.part AS part,
        t_57_Uses.component AS component,
        ((((((((((((((((((((((((((((t_71_Uses.component) || ('/'))) || (t_69_Uses.component))) || ('/'))) || (t_67_Uses.component))) || ('/'))) || (t_65_Uses.component))) || ('/'))) || (t_63_Uses.component))) || ('/'))) || (t_61_Uses.component))) || ('/'))) || (t_59_Uses.component))) || ('/'))) || (t_57_Uses.component)) AS path_id,
        ((((((((((((((t_71_Uses.qty) * (t_69_Uses.qty))) * (t_67_Uses.qty))) * (t_65_Uses.qty))) * (t_63_Uses.qty))) * (t_61_Uses.qty))) * (t_59_Uses.qty))) * (t_57_Uses.qty)) AS n,
        ((x_553.value) + (1)) AS synalog_step
      FROM
        t_2_Uses AS t_71_Uses, t_2_Uses AS t_69_Uses, t_2_Uses AS t_67_Uses, t_2_Uses AS t_65_Uses, t_2_Uses AS t_63_Uses, t_2_Uses AS t_61_Uses, t_2_Uses AS t_59_Uses, t_2_Uses AS t_57_Uses, JSON_EACH(JSON_ARRAY(((((((((((((0) + (1))) + (1))) + (1))) + (1))) + (1))) + (1)))) as x_553
      WHERE
        (x_553.value < 6) AND
        (((((((((((0) + (1))) + (1))) + (1))) + (1))) + (1)) < 6) AND
        (((((((((0) + (1))) + (1))) + (1))) + (1)) < 6) AND
        (((((((0) + (1))) + (1))) + (1)) < 6) AND
        (((((0) + (1))) + (1)) < 6) AND
        (((0) + (1)) < 6) AND
        (0 < 6) AND
        (1 = 0) AND
        (t_57_Uses.part IS t_59_Uses.component) AND
        (t_59_Uses.part IS t_61_Uses.component) AND
        (t_61_Uses.part IS t_63_Uses.component) AND
        (t_63_Uses.part IS t_65_Uses.component) AND
        (t_65_Uses.part IS t_67_Uses.component) AND
        (t_67_Uses.part IS t_69_Uses.component) AND
        (t_69_Uses.part IS t_71_Uses.component)
     UNION ALL
    
      SELECT
        t_89_Uses.part AS part,
        t_73_Uses.component AS component,
        ((((((((((((((((((((((((((((((((t_89_Uses.component) || ('/'))) || (t_87_Uses.component))) || ('/'))) || (t_85_Uses.component))) || ('/'))) || (t_83_Uses.component))) || ('/'))) || (t_81_Uses.component))) || ('/'))) || (t_79_Uses.component))) || ('/'))) || (t_77_Uses.component))) || ('/'))) || (t_75_Uses.component))) || ('/'))) || (t_73_Uses.component)) AS path_id,
        ((((((((((((((((t_89_Uses.qty) * (t_87_Uses.qty))) * (t_85_Uses.qty))) * (t_83_Uses.qty))) * (t_81_Uses.qty))) * (t_79_Uses.qty))) * (t_77_Uses.qty))) * (t_75_Uses.qty))) * (t_73_Uses.qty)) AS n,
        ((((x_677.value) + (1))) + (1)) AS synalog_step
      FROM
        t_2_Uses AS t_89_Uses, t_2_Uses AS t_87_Uses, t_2_Uses AS t_85_Uses, t_2_Uses AS t_83_Uses, t_2_Uses AS t_81_Uses, t_2_Uses AS t_79_Uses, t_2_Uses AS t_77_Uses, t_2_Uses AS t_75_Uses, t_2_Uses AS t_73_Uses, JSON_EACH(JSON_ARRAY(((((((((((((0) + (1))) + (1))) + (1))) + (1))) + (1))) + (1)))) as x_677
      WHERE
        (((x_677.value) + (1)) < 6) AND
        (x_677.value < 6) AND
        (((((((((((0) + (1))) + (1))) + (1))) + (1))) + (1)) < 6) AND
        (((((((((0) + (1))) + (1))) + (1))) + (1)) < 6) AND
        (((((((0) + (1))) + (1))) + (1)) < 6) AND
        (((((0) + (1))) + (1)) < 6) AND
        (((0) + (1)) < 6) AND
        (0 < 6) AND
        (1 = 0) AND
        (t_73_Uses.part IS t_75_Uses.component) AND
        (t_75_Uses.part IS t_77_Uses.component) AND
        (t_77_Uses.part IS t_79_Uses.component) AND
        (t_79_Uses.part IS t_81_Uses.component) AND
        (t_81_Uses.part IS t_83_Uses.component) AND
        (t_83_Uses.part IS t_85_Uses.component) AND
        (t_85_Uses.part IS t_87_Uses.component) AND
        (t_87_Uses.part IS t_89_Uses.component)
     UNION ALL
    
      SELECT
        t_109_Uses.part AS part,
        t_91_Uses.component AS component,
        ((((((((((((((((((((((((((((((((((((t_109_Uses.component) || ('/'))) || (t_107_Uses.component))) || ('/'))) || (t_105_Uses.component))) || ('/'))) || (t_103_Uses.component))) || ('/'))) || (t_101_Uses.component))) || ('/'))) || (t_99_Uses.component))) || ('/'))) || (t_97_Uses.component))) || ('/'))) || (t_95_Uses.component))) || ('/'))) || (t_93_Uses.component))) || ('/'))) || (t_91_Uses.component)) AS path_id,
        ((((((((((((((((((t_109_Uses.qty) * (t_107_Uses.qty))) * (t_105_Uses.qty))) * (t_103_Uses.qty))) * (t_101_Uses.qty))) * (t_99_Uses.qty))) * (t_97_Uses.qty))) * (t_95_Uses.qty))) * (t_93_Uses.qty))) * (t_91_Uses.qty)) AS n,
        ((((((x_813.value) + (1))) + (1))) + (1)) AS synalog_step
      FROM
        t_2_Uses AS t_109_Uses, t_2_Uses AS t_107_Uses, t_2_Uses AS t_105_Uses, t_2_Uses AS t_103_Uses, t_2_Uses AS t_101_Uses, t_2_Uses AS t_99_Uses, t_2_Uses AS t_97_Uses, t_2_Uses AS t_95_Uses, t_2_Uses AS t_93_Uses, t_2_Uses AS t_91_Uses, JSON_EACH(JSON_ARRAY(((((((((((((0) + (1))) + (1))) + (1))) + (1))) + (1))) + (1)))) as x_813
      WHERE
        (((((x_813.value) + (1))) + (1)) < 6) AND
        (((x_813.value) + (1)) < 6) AND
        (x_813.value < 6) AND
        (((((((((((0) + (1))) + (1))) + (1))) + (1))) + (1)) < 6) AND
        (((((((((0) + (1))) + (1))) + (1))) + (1)) < 6) AND
        (((((((0) + (1))) + (1))) + (1)) < 6) AND
        (((((0) + (1))) + (1)) < 6) AND
        (((0) + (1)) < 6) AND
        (0 < 6) AND
        (1 = 0) AND
        (t_91_Uses.part IS t_93_Uses.component) AND
        (t_93_Uses.part IS t_95_Uses.component) AND
        (t_95_Uses.part IS t_97_Uses.component) AND
        (t_97_Uses.part IS t_99_Uses.component) AND
        (t_99_Uses.part IS t_101_Uses.component) AND
        (t_101_Uses.part IS t_103_Uses.component) AND
        (t_103_Uses.part IS t_105_Uses.component) AND
        (t_105_Uses.part IS t_107_Uses.component) AND
        (t_107_Uses.part IS t_109_Uses.component)
    
  ) AS UNUSED_TABLE_NAME  
) AS UNUSED_TABLE_NAME
UNION
SELECT
  t_110_Need_RecursiveCte.part AS part,
  t_111_Uses.component AS component,
  ((((t_110_Need_RecursiveCte.path_id) || ('/'))) || (t_111_Uses.component)) AS path_id,
  ((t_110_Need_RecursiveCte.n) * (t_111_Uses.qty)) AS n,
  ((t_110_Need_RecursiveCte.synalog_step) + (1)) AS synalog_step
FROM
  t_1_Need_RecursiveCte AS t_110_Need_RecursiveCte, t_2_Uses AS t_111_Uses
WHERE
  (t_110_Need_RecursiveCte.synalog_step < 6) AND
  (t_111_Uses.part IS t_110_Need_RecursiveCte.component)),
t_0_Need AS (SELECT
  Need_RecursiveCte.part AS part,
  Need_RecursiveCte.component AS component,
  Need_RecursiveCte.path_id AS path_id,
  Need_RecursiveCte.n AS n
FROM
  t_1_Need_RecursiveCte AS Need_RecursiveCte
GROUP BY Need_RecursiveCte.part, Need_RecursiveCte.component, Need_RecursiveCte.path_id, Need_RecursiveCte.n)
SELECT
  SUM(Need.n) AS q
FROM
  t_0_Need AS Need
WHERE
  (Need.part = 'bike') AND
  (Need.component = 'spoke');