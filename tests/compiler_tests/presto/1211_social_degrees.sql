WITH t_1_Follows AS (SELECT * FROM (
  
    SELECT
      'ann' AS a,
      'bob' AS b
   UNION ALL
  
    SELECT
      'bob' AS a,
      'ann' AS b
   UNION ALL
  
    SELECT
      'ann' AS a,
      'cat' AS b
   UNION ALL
  
    SELECT
      'cat' AS a,
      'dan' AS b
   UNION ALL
  
    SELECT
      'dan' AS a,
      'cat' AS b
   UNION ALL
  
    SELECT
      'bob' AS a,
      'cat' AS b
   UNION ALL
  
    SELECT
      'eve' AS a,
      'ann' AS b
   UNION ALL
  
    SELECT
      'eve' AS a,
      'bob' AS b
   UNION ALL
  
    SELECT
      'eve' AS a,
      'cat' AS b
   UNION ALL
  
    SELECT
      'dan' AS a,
      'eve' AS b
   UNION ALL
  
    SELECT
      'fay' AS a,
      'cat' AS b
  
) AS UNUSED_TABLE_NAME  ),
t_0_D_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      Follows.b AS u,
      1 AS followers,
      0 AS following
    FROM
      t_1_Follows AS Follows
   UNION ALL
  
    SELECT
      t_2_Follows.a AS u,
      0 AS followers,
      1 AS following
    FROM
      t_1_Follows AS t_2_Follows
  
) AS UNUSED_TABLE_NAME  )
SELECT
  D_MultBodyAggAux.u AS u,
  SUM(D_MultBodyAggAux.followers) AS followers,
  SUM(D_MultBodyAggAux.following) AS following
FROM
  t_0_D_MultBodyAggAux AS D_MultBodyAggAux
GROUP BY 1 ORDER BY u, followers, following;