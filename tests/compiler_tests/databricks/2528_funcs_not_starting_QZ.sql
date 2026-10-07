WITH t_0_C AS (SELECT * FROM VALUES
  (1, "AB-001", "north", 12.5E0),
  (2, "AB-017", "south", -3.75E0),
  (3, "XY-200", "north", 0.0E0),
  (4, "XY-031", "east", 7.0E0),
  (5, "QZ-999", "south", -12.25E0),
  (6, "AB-120", "east", 99.9E0)
AS UNUSED_TABLE_NAME(id, code, zone, x))
SELECT
  C.id AS id
FROM
  t_0_C AS C
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    (SELECT 'singleton' as s) as unused_singleton
  WHERE
    (SUBSTR(C.code, 1, LENGTH("QZ")) = "QZ")) IS NULL) ORDER BY id NULLS LAST;