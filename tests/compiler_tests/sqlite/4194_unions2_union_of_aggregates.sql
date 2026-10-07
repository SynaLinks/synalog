WITH t_2_A AS (SELECT * FROM (
  
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
t_3_B AS (SELECT * FROM (
  
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
t_1_S_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      'a' AS src,
      A.x AS t
    FROM
      t_2_A AS A
   UNION ALL
  
    SELECT
      'b' AS src,
      B.x AS t
    FROM
      t_3_B AS B
  
) AS UNUSED_TABLE_NAME  ),
t_0_S AS (SELECT
  S_MultBodyAggAux.src AS src,
  SUM(S_MultBodyAggAux.t) AS t
FROM
  t_1_S_MultBodyAggAux AS S_MultBodyAggAux
GROUP BY S_MultBodyAggAux.src)
SELECT
  S.src AS src,
  S.t AS t
FROM
  t_0_S AS S ORDER BY src;