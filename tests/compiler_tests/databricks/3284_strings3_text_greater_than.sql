WITH t_0_V AS (SELECT * FROM VALUES
  ("A"),
  ("Z"),
  ("n"),
  ("z"),
  ("m")
AS UNUSED_TABLE_NAME(w))
SELECT
  V.w AS w
FROM
  t_0_V AS V
WHERE
  (V.w > "m") ORDER BY w NULLS LAST;