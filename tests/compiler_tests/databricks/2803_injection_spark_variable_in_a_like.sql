WITH t_0_V AS (SELECT * FROM VALUES
  (1, "\u0024{a}b"),
  (2, "b")
AS UNUSED_TABLE_NAME(id, s))
SELECT
  V.id AS id
FROM
  t_0_V AS V
WHERE
  (CAST(V.s AS STRING) LIKE "\u0024{a}%" ESCAPE '\\');