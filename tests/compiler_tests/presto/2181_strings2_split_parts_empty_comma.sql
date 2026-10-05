SELECT
  x_1 AS part
FROM
  UNNEST(SPLIT('', ',')) as pushkin(x_1)
GROUP BY 1;