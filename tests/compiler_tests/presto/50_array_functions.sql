WITH t_1_Lists AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      ARRAY[1, 2] AS a,
      ARRAY[3, 4] AS b
   UNION ALL
  
    SELECT
      2 AS id,
      ARRAY[5] AS a,
      ARRAY[6, 7, 8] AS b
  
) AS UNUSED_TABLE_NAME  ),
t_0_Concatenated AS (SELECT
  Lists.id AS id,
  CARDINALITY(Lists.a || Lists.b) AS total_size,
  ELEMENT_AT(Lists.a || Lists.b, 0 + 1) AS head
FROM
  t_1_Lists AS Lists ORDER BY id)
SELECT
  Concatenated.id AS id,
  Concatenated.total_size AS total_size,
  Concatenated.head AS head
FROM
  t_0_Concatenated AS Concatenated ORDER BY id;