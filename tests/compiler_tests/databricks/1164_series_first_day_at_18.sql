WITH t_0_Reading AS (SELECT * FROM VALUES
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
  MIN(Reading.day) AS d
FROM
  t_0_Reading AS Reading
WHERE
  (Reading.value >= 18);
