SELECT
  x_3 AS x
FROM
  UNNEST(ARRAY[0, 1]) as pushkin(x_3)
WHERE
  (CAST(ROW(x_3) AS ROW(a double)) = CAST(ROW(x_3) AS ROW(a double))) ORDER BY x;
