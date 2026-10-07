WITH t_0_V AS (SELECT * FROM VALUES
  (1, 5, "a"),
  (2, -3, null),
  (3, 0, "c"),
  (4, null, "d"),
  (5, 12, null),
  (6, 7, "f")
AS UNUSED_TABLE_NAME(k, x, s))
SELECT
  V.k AS k
FROM
  t_0_V AS V
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    t_0_V AS t_1_V
  WHERE
    (CASE WHEN (t_1_V.x > 7) THEN true ELSE false END = true) AND
    (V.k = t_1_V.k)) IS NULL) ORDER BY k NULLS LAST;