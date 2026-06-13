WITH t_1_Lists AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      JSON_ARRAY(1, 2) AS a,
      JSON_ARRAY(3, 4) AS b
   UNION ALL
  
    SELECT
      2 AS id,
      JSON_ARRAY(5) AS a,
      JSON_ARRAY(6, 7, 8) AS b
  
) AS UNUSED_TABLE_NAME  ),
t_0_Concatenated AS (SELECT
  Lists.id AS id,
  JSON_ARRAY_LENGTH(ARRAY_CONCAT(Lists.a, Lists.b)) AS total_size,
  JSON_EXTRACT(ARRAY_CONCAT(Lists.a, Lists.b), '$[' || 0 || ']') AS head
FROM
  t_1_Lists AS Lists ORDER BY id)
SELECT
  Concatenated.id AS id,
  Concatenated.total_size AS total_size,
  Concatenated.head AS head
FROM
  t_0_Concatenated AS Concatenated ORDER BY id;