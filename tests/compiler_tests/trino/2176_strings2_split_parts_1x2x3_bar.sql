SELECT
  x_1 AS part
FROM
  UNNEST(SPLIT('1|2|3', '|')) as pushkin(x_1)
GROUP BY 1 ORDER BY part;