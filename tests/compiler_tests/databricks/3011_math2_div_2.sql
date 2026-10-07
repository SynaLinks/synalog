WITH t_1_V AS (SELECT * FROM VALUES
  (1, 7),
  (2, -7),
  (3, 2.5E0),
  (4, -2.5E0),
  (5, 0),
  (6, 3),
  (7, 0.125E0),
  (8, 1000000),
  (9, -0.75E0),
  (10, 12.345E0)
AS UNUSED_TABLE_NAME(id, x))
SELECT
  t_0_V.id AS id,
  CAST((CASE WHEN ((t_0_V.x) < 0) <> ((2) < 0) THEN CEIL(CAST(t_0_V.x AS DOUBLE) / NULLIF(2, 0)) ELSE FLOOR(CAST(t_0_V.x AS DOUBLE) / NULLIF(2, 0)) END) AS BIGINT) AS v
FROM
  t_1_V AS t_0_V
WHERE
  (FLOOR(t_0_V.x) = t_0_V.x) ORDER BY id NULLS LAST;