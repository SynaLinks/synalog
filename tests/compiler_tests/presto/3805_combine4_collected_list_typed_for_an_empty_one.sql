WITH t_4_A AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      2 AS x
  
) AS UNUSED_TABLE_NAME  ),
t_3_L AS (SELECT
  'a' AS src,
  ARRAY_AGG(A.x) AS l
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
      'b' AS src,
      ARRAY[] AS l
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_All.src AS src,
  CARDINALITY(t_0_All.l) AS n
FROM
  t_1_All AS t_0_All ORDER BY src;