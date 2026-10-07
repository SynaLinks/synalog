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
      (CAST(A.x AS DOUBLE) / NULLIF(2, 0)) AS v
    FROM
      t_1_A AS A
   UNION ALL
  
    SELECT
      B.x AS x,
      ((B.x) * (2)) AS v
    FROM
      t_2_B AS B
  
) AS UNUSED_TABLE_NAME  )
SELECT
  U.x AS x,
  U.v AS v
FROM
  t_0_U AS U ORDER BY x, v;