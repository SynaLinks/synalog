WITH t_1_W AS (SELECT * FROM VALUES
  ("alpha"),
  ("beta"),
  ("gamma"),
  ("delta"),
  ("epsilon")
AS UNUSED_TABLE_NAME(w))
SELECT
  t_0_W.w AS w
FROM
  t_1_W AS t_0_W ORDER BY w NULLS LAST;