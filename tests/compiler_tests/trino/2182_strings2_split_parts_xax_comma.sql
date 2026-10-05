SELECT
  x_1 AS part
FROM
  UNNEST(SPLIT(',a,', ',')) as pushkin(x_1)
GROUP BY 1 ORDER BY part;