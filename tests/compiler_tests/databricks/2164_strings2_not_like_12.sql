WITH t_1_W AS (SELECT * FROM VALUES
  ("a_c"),
  ("abc"),
  ("50%"),
  ("500"),
  ("x\\y"),
  (""),
  ("Ab"),
  ("a%c"),
  ("aXc"),
  ("ac"),
  ("hello world"),
  ("_x")
AS UNUSED_TABLE_NAME(w))
SELECT
  t_0_W.w AS w
FROM
  t_1_W AS t_0_W
WHERE
  ((CAST(t_0_W.w AS STRING) LIKE "%" ESCAPE '\\') = false);
