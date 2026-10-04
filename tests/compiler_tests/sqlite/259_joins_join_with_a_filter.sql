WITH t_0_B AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      'a' AS v
   UNION ALL
  
    SELECT
      2 AS id,
      'b' AS v
  
) AS UNUSED_TABLE_NAME  )
SELECT
  B.id AS id,
  B.v AS v
FROM
  t_0_B AS B, JSON_EACH(JSON_ARRAY(1, 2)) as x_6
WHERE
  (B.id > 1) AND
  (x_6.value = B.id);