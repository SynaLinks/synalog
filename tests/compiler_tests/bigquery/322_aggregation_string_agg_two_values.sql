WITH t_1_V AS (SELECT * FROM (
  
    SELECT
      "a" AS s
   UNION ALL
  
    SELECT
      "b" AS s
  
) AS UNUSED_TABLE_NAME  ),
t_0_J AS (SELECT
  STRING_AGG(CAST(V.s AS STRING), ',') AS j
FROM
  t_1_V AS V)
SELECT
  ARRAY_LENGTH(SPLIT(J.j, ",")) AS parts,
  LENGTH(J.j) AS length
FROM
  t_0_J AS J;