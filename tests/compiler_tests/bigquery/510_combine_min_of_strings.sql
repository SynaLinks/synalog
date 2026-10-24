SELECT
  (SELECT
  MIN(x_5) AS synalog_value
FROM
  UNNEST(ARRAY["bee", "ant", "cat"]) as x_5) AS m;