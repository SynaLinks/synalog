SELECT
  x_1.value AS part
FROM
  JSON_EACH(SPLIT('1|2|3', '|')) as x_1
GROUP BY x_1.value ORDER BY part;