WITH t_2_NotA AS (SELECT
  x_13 AS x
FROM
  UNNEST(TRANSFORM(ARRAY[1, 2], synalog_e -> ROW(synalog_e))) as pushkin(x_13)
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    (SELECT 'singleton' as s) as unused_singleton
  WHERE
    (x_13 = 1)) IS NULL)),
t_0_NotNotA AS (SELECT
  x_8 AS x
FROM
  UNNEST(TRANSFORM(ARRAY[1, 2], synalog_e -> ROW(synalog_e))) as pushkin(x_8)
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    t_2_NotA AS NotA
  WHERE
    (NotA.x = x_8)) IS NULL))
SELECT
  x_3 AS x
FROM
  UNNEST(TRANSFORM(ARRAY[1, 2], synalog_e -> ROW(synalog_e))) as pushkin(x_3)
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    t_0_NotNotA AS NotNotA
  WHERE
    (NotNotA.x = x_3)) IS NULL);