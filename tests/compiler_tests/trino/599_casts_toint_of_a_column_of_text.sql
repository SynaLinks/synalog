SELECT
  SUM(CAST(x_2 AS BIGINT)) AS t
FROM
  UNNEST(ARRAY['5', '10']) as pushkin(x_2);