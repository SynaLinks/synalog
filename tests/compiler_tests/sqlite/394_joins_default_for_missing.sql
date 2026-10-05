SELECT * FROM (
  
    SELECT
      x_6.value AS k,
      'one' AS n
    FROM
      JSON_EACH(JSON_ARRAY(1, 2)) as x_6
    WHERE
      (1 = x_6.value)
   UNION ALL
  
    SELECT
      x_3.value AS k,
      'none' AS n
    FROM
      JSON_EACH(JSON_ARRAY(1, 2)) as x_3
    WHERE
      ((SELECT
        MIN(MagicalEntangle(1, x_6.value)) AS logica_value
      FROM
        JSON_EACH(JSON_ARRAY(0)) as x_6
      WHERE
        (x_3.value = 1)) IS NULL)
  
) AS UNUSED_TABLE_NAME  ORDER BY k ;