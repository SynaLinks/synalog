WITH t_1_A AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      2 AS x
   UNION ALL
  
    SELECT
      3 AS x
   UNION ALL
  
    SELECT
      4 AS x
   UNION ALL
  
    SELECT
      5 AS x
   UNION ALL
  
    SELECT
      6 AS x
  
) AS UNUSED_TABLE_NAME  ),
t_2_B AS (SELECT * FROM (
  
    SELECT
      4 AS x
   UNION ALL
  
    SELECT
      5 AS x
   UNION ALL
  
    SELECT
      6 AS x
   UNION ALL
  
    SELECT
      7 AS x
   UNION ALL
  
    SELECT
      8 AS x
  
) AS UNUSED_TABLE_NAME  ),
t_3_C AS (SELECT * FROM (
  
    SELECT
      2 AS x
   UNION ALL
  
    SELECT
      7 AS x
   UNION ALL
  
    SELECT
      9 AS x
  
) AS UNUSED_TABLE_NAME  ),
t_0_U AS (SELECT * FROM (
  
    SELECT
      A.x AS x,
      'a' AS src
    FROM
      t_1_A AS A
    WHERE
      (A.x > 8)
   UNION ALL
  
    SELECT
      B.x AS x,
      'b' AS src
    FROM
      t_2_B AS B
    WHERE
      (B.x > 8)
   UNION ALL
  
    SELECT
      C.x AS x,
      'c' AS src
    FROM
      t_3_C AS C
    WHERE
      (C.x > 8)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  U.src AS src,
  SUM(U.x) AS s
FROM
  t_0_U AS U
GROUP BY 1 ORDER BY src;