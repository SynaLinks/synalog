WITH t_1_V AS (SELECT * FROM (
  
    SELECT
      'a' AS s
   UNION ALL
  
    SELECT
      'b' AS s
  
) AS UNUSED_TABLE_NAME  ),
t_0_J AS (SELECT
  GROUP_CONCAT(V.s) AS j
FROM
  t_1_V AS V)
SELECT
  JSON_ARRAY_LENGTH(SPLIT(J.j, ',')) AS parts,
  LENGTH(J.j) AS length
FROM
  t_0_J AS J;