WITH t_1_V AS (SELECT * FROM VALUES
  (1, 3, "ab"),
  (2, -4, "hello"),
  (3, 0, ""),
  (4, null, "x"),
  (5, 12, null),
  (6, 7, "seven")
AS UNUSED_TABLE_NAME(k, x, s))
SELECT
  (CASE WHEN 0 IS NULL OR (CASE WHEN ((t_0_V.x) * (t_0_V.x)) IS NULL OR 10 IS NULL THEN NULL ELSE LEAST(((t_0_V.x) * (t_0_V.x)), 10) END) IS NULL THEN NULL ELSE GREATEST(0, (CASE WHEN ((t_0_V.x) * (t_0_V.x)) IS NULL OR 10 IS NULL THEN NULL ELSE LEAST(((t_0_V.x) * (t_0_V.x)), 10) END)) END) AS v
FROM
  t_1_V AS t_0_V
WHERE
  (t_0_V.k = 2);