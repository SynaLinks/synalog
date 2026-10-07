WITH t_0_Rate AS (SELECT * FROM VALUES
  ("ab", 2),
  ("hello", 5),
  ("x", 10)
AS UNUSED_TABLE_NAME(s, r))
SELECT
  Rate.r AS v
FROM
  t_0_Rate AS Rate
WHERE
  ("nope" = Rate.s);