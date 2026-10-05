SELECT
  UPPER(x_4) AS u
FROM
  UNNEST(ARRAY["a", "b"]) as x_4 ORDER BY u;