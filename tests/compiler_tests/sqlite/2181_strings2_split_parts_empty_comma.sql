SELECT
  x_1.value AS part
FROM
  JSON_EACH(SPLIT('', ',')) as x_1
GROUP BY x_1.value;