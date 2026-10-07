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
t_0_U AS (SELECT * FROM (
  
    SELECT
      A.x AS x,
      "a" AS src
    FROM
      t_1_A AS A
    WHERE
      (A.x > 5)
   UNION ALL
  
    SELECT
      B.x AS x,
      "b" AS src
    FROM
      t_2_B AS B
    WHERE
      (B.x > 5)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  U.x AS x,
  U.src AS src
FROM
  t_0_U AS U ORDER BY x, src;