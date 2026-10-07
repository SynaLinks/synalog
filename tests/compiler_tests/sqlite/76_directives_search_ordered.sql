SELECT
  x_1.value AS name
FROM
  JSON_EACH(JSON_ARRAY('rome', 'paris', 'oslo')) as x_1 ORDER BY name;