SELECT * FROM (
  
    SELECT
      x_6 AS k,
      'one' AS n
    FROM
      UNNEST(TRANSFORM(ARRAY[1, 2], synalog_e -> ROW(synalog_e))) as pushkin(x_6)
    WHERE
      (1 = x_6)
   UNION ALL
  
    SELECT
      x_3 AS k,
      'none' AS n
    FROM
      UNNEST(TRANSFORM(ARRAY[1, 2], synalog_e -> ROW(synalog_e))) as pushkin(x_3)
    WHERE
      ((SELECT
        MIN(1) AS logica_value
      FROM
        (SELECT 'singleton' as s) as unused_singleton
      WHERE
        (x_3 = 1)) IS NULL)
  
) AS UNUSED_TABLE_NAME  ORDER BY k ;