WITH t_0_V AS (SELECT * FROM VALUES
  (1, "\u0024{a}"),
  (2, "")
AS UNUSED_TABLE_NAME(id, s))
SELECT
  V.id AS id
FROM
  t_0_V AS V
WHERE
  (V.s = "\u0024{a}");