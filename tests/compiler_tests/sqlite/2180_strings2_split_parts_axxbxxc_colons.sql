SELECT
  x_1.value AS part
FROM
  JSON_EACH(SPLIT('a::b::c', '::')) as x_1
GROUP BY x_1.value ORDER BY part;