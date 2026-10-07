WITH t_3_C AS (SELECT * FROM VALUES
  (1, "c"),
  (2, "d")
AS UNUSED_TABLE_NAME(k, c))
SELECT
  t_2_C.k AS k,
  "a" AS a,
  "b" AS b,
  t_2_C.c AS c
FROM
  t_3_C AS t_2_C
WHERE
  (1 = t_2_C.k);