SELECT
  x_3 AS d
FROM
  UNNEST(ARRAY['2024-01-31', '2024-02-15', '2024-03-01']) as pushkin(x_3)
WHERE
  (x_3 >= '2024-02-01') AND
  (x_3 < '2024-03-01');