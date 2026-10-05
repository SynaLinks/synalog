SELECT
  x_1.value AS part
FROM
  JSON_EACH(SPLIT('abc', ',')) as x_1
GROUP BY x_1.value;