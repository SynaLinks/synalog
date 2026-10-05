SELECT
  JSON_ARRAY_LENGTH((SELECT
  JSON_GROUP_ARRAY(MagicalEntangle(x_5.value, x_3.value)) AS logica_value
FROM
  JSON_EACH(JSON_ARRAY(0)) as x_3, JSON_EACH(JSON_ARRAY(1, 2, 3)) as x_5)) AS n;