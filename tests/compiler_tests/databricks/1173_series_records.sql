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
AS UNUSED_TABLE_NAME(day, value)),
t_1_Beaten AS (SELECT
  t_2_Reading.day AS day
FROM
  t_0_Reading AS t_2_Reading, t_0_Reading AS t_3_Reading
WHERE
  (t_3_Reading.day < t_2_Reading.day) AND
  (t_3_Reading.value >= t_2_Reading.value)
GROUP BY 1)
SELECT
  Reading.day AS day
FROM
  t_0_Reading AS Reading
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    t_1_Beaten AS Beaten
  WHERE
    (Beaten.day = Reading.day)) IS NULL) ORDER BY day NULLS LAST;
