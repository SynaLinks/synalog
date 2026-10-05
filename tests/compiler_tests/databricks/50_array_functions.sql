WITH t_1_Lists AS (SELECT * FROM VALUES
  (1, ARRAY(1, 2), ARRAY(3, 4)),
  (2, ARRAY(5), ARRAY(6, 7, 8))
AS UNUSED_TABLE_NAME(id, a, b)),
t_0_Concatenated AS (SELECT
  Lists.id AS id,
  ARRAY_SIZE(CONCAT(Lists.a, Lists.b)) AS total_size,
  ELEMENT_AT(CONCAT(Lists.a, Lists.b), 0 + 1) AS head
FROM
  t_1_Lists AS Lists ORDER BY id NULLS LAST)
SELECT
  Concatenated.id AS id,
  Concatenated.total_size AS total_size,
  Concatenated.head AS head
FROM
  t_0_Concatenated AS Concatenated ORDER BY id NULLS LAST;