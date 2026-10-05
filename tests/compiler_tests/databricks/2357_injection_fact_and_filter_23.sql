WITH t_0_V AS (SELECT * FROM VALUES
  (1, "0x27 OR 1"),
  (2, "plain")
AS UNUSED_TABLE_NAME(id, s))
SELECT
  V.id AS id
FROM
  t_0_V AS V
WHERE
  (V.s = "0x27 OR 1");
