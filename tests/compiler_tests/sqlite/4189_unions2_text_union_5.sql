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
      SYNALOG_NUMBER_TEXT(A.x) AS s
    FROM
      t_1_A AS A
    WHERE
      (A.x <= 5)
   UNION ALL
  
    SELECT
      ((SYNALOG_NUMBER_TEXT(B.x)) || ('*')) AS s
    FROM
      t_2_B AS B
    WHERE
      (B.x <= 5)
  
) AS UNUSED_TABLE_NAME  )
SELECT
  U.s AS s
FROM
  t_0_U AS U ORDER BY s NULLS LAST;