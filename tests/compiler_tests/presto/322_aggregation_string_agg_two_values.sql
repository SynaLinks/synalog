WITH t_2_V AS (SELECT * FROM (
  
    SELECT
      'a' AS s
   UNION ALL
  
    SELECT
      'b' AS s
  
) AS UNUSED_TABLE_NAME  ),
t_1_J AS (SELECT
  (CASE WHEN COUNT(V.s) > 0 THEN ARRAY_JOIN(ARRAY_AGG(CAST(V.s AS VARCHAR)), ',') END) AS j
FROM
  t_2_V AS V)
SELECT
  CARDINALITY(SPLIT(t_0_J.j, ',')) AS parts,
  LENGTH(t_0_J.j) AS length
FROM
  t_1_J AS t_0_J;