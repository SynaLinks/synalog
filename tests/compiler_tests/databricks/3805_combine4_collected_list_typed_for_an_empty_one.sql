WITH t_4_A AS (SELECT * FROM VALUES
  (1),
  (2)
AS UNUSED_TABLE_NAME(x)),
t_3_L AS (SELECT
  "a" AS src,
  (CASE WHEN COUNT(*) = 0 THEN NULL ELSE TRANSFORM(COLLECT_LIST(STRUCT(A.x AS v)), s -> s.v) END) AS l
FROM
  t_4_A AS A
GROUP BY 1),
t_1_All AS (SELECT * FROM (
  
    SELECT
      t_2_L.src AS src,
      t_2_L.l AS l
    FROM
      t_3_L AS t_2_L
   UNION ALL
  
    SELECT
      "b" AS src,
      ARRAY() AS l
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_All.src AS src,
  ARRAY_SIZE(t_0_All.l) AS n
FROM
  t_1_All AS t_0_All ORDER BY src NULLS LAST;