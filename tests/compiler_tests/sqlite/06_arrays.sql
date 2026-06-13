SELECT
  x_9.value AS c,
  (IN_LIST(x_9.value, JSON_ARRAY('red', 'blue', 'yellow'))) AS is_primary
FROM
  JSON_EACH(JSON_ARRAY('red', 'green', 'blue')) as x_9 ORDER BY c;