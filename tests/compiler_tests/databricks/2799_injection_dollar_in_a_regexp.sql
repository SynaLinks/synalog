WITH t_0_V AS (SELECT * FROM VALUES
  (1, "ab"),
  (2, "ba")
AS UNUSED_TABLE_NAME(id, s))
SELECT
  V.id AS id
FROM
  t_0_V AS V
WHERE
  (V.s RLIKE "b\u0024");