SELECT
  x_1 AS part
FROM
  UNNEST(SPLIT("1|2|3", "|")) as x_1
GROUP BY part ORDER BY part;