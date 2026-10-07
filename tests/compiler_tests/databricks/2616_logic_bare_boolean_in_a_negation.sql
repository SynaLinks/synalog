WITH t_0_V AS (SELECT * FROM VALUES
  (1, true, "ab"),
  (2, false, "ba"),
  (3, null, null)
AS UNUSED_TABLE_NAME(x, b, s))
SELECT
  V.x AS x
FROM
  t_0_V AS V
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    t_0_V AS t_1_V
  WHERE
    t_1_V.b AND
    (t_1_V.x = V.x)) IS NULL) ORDER BY x NULLS LAST;