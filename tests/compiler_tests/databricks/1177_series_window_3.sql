WITH t_2_Reading AS (SELECT * FROM VALUES
  (1, 10),
  (2, 12),
  (3, 11),
  (4, 15),
  (5, 18),
  (6, 18),
  (7, 14),
  (8, 20),
  (9, 25),
  (10, 22),
  (11, 22),
  (12, 30)
AS UNUSED_TABLE_NAME(day, value))
SELECT
  Reading.day AS day,
  ((((Reading.value) + (t_0_Reading.value))) + (t_1_Reading.value)) AS total
FROM
  t_2_Reading AS Reading, t_2_Reading AS t_0_Reading, t_2_Reading AS t_1_Reading
WHERE
  (t_0_Reading.day = ((Reading.day) - (1))) AND
  (t_1_Reading.day = ((Reading.day) - (2))) ORDER BY day NULLS LAST, total NULLS LAST;
