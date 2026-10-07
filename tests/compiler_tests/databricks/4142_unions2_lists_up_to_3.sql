WITH t_5_A AS (SELECT * FROM VALUES
  (1),
  (2),
  (3),
  (4),
  (5),
  (6)
AS UNUSED_TABLE_NAME(x)),
t_6_B AS (SELECT * FROM VALUES
  (4),
  (5),
  (6),
  (7),
  (8)
AS UNUSED_TABLE_NAME(x)),
t_4_L_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      "a" AS src,
      A.x AS l
    FROM
      t_5_A AS A
    WHERE
      (A.x <= 3)
   UNION ALL
  
    SELECT
      "b" AS src,
      B.x AS l
    FROM
      t_6_B AS B
    WHERE
      (B.x <= 3)
  
) AS UNUSED_TABLE_NAME  ),
t_3_L AS (SELECT
  L_MultBodyAggAux.src AS src,
  (CASE WHEN COUNT(*) = 0 THEN NULL ELSE TRANSFORM(COLLECT_LIST(STRUCT(L_MultBodyAggAux.l AS v)), s -> s.v) END) AS l
FROM
  t_4_L_MultBodyAggAux AS L_MultBodyAggAux
GROUP BY 1),
t_7_M AS (SELECT * FROM VALUES
  ("a", ARRAY()),
  ("b", ARRAY())
AS UNUSED_TABLE_NAME(src, l)),
t_1_All AS (SELECT * FROM (
  
    SELECT
      t_2_L.src AS src,
      t_2_L.l AS l
    FROM
      t_3_L AS t_2_L
   UNION ALL
  
    SELECT
      M.src AS src,
      M.l AS l
    FROM
      t_7_M AS M
    WHERE
      ((SELECT
        MIN(1) AS logica_value
      FROM
        t_3_L AS t_8_L
      WHERE
        (t_8_L.src = M.src)) IS NULL)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_All.src AS src,
  ARRAY_SIZE(t_0_All.l) AS n
FROM
  t_1_All AS t_0_All ORDER BY src NULLS LAST;