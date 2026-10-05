WITH t_6_Uses AS (SELECT * FROM (
  
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
t_3_Down_MultBodyAggAux_recursive_head_f1 AS (SELECT * FROM (
  
    SELECT
      t_5_Uses.component AS component
    FROM
      t_6_Uses AS t_5_Uses
    WHERE
      (t_5_Uses.part = 'bike')
  
) AS UNUSED_TABLE_NAME  ),
t_2_Down_r0 AS (SELECT
  Down_MultBodyAggAux_recursive_head_f1.component AS component
FROM
  t_3_Down_MultBodyAggAux_recursive_head_f1 AS Down_MultBodyAggAux_recursive_head_f1
GROUP BY Down_MultBodyAggAux_recursive_head_f1.component),
t_1_Down_MultBodyAggAux_recursive_head_f2 AS (SELECT * FROM (
  
    SELECT
      Uses.component AS component
    FROM
      t_2_Down_r0 AS Down_r0, t_6_Uses AS Uses
    WHERE
      (Uses.part = Down_r0.component)
   UNION ALL
  
    SELECT
      t_7_Uses.component AS component
    FROM
      t_6_Uses AS t_7_Uses
    WHERE
      (t_7_Uses.part = 'bike')
  
) AS UNUSED_TABLE_NAME  ),
t_0_Down AS (SELECT
  Down_MultBodyAggAux_recursive_head_f2.component AS component
FROM
  t_1_Down_MultBodyAggAux_recursive_head_f2 AS Down_MultBodyAggAux_recursive_head_f2
GROUP BY Down_MultBodyAggAux_recursive_head_f2.component)
SELECT
  Down.component AS component
FROM
  t_0_Down AS Down
GROUP BY Down.component ORDER BY component;