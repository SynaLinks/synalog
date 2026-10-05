WITH t_0_Uses AS (SELECT * FROM VALUES
  ("bike", "frame", 1),
  ("bike", "wheel", 2),
  ("wheel", "rim", 1),
  ("wheel", "spoke", 32),
  ("wheel", "hub", 1),
  ("hub", "bearing", 2),
  ("frame", "tube", 3),
  ("scooter", "wheel", 2),
  ("scooter", "deck", 1)
AS UNUSED_TABLE_NAME(part, component, qty))
SELECT
  Uses.component AS component,
  Uses.qty AS qty
FROM
  t_0_Uses AS Uses
WHERE
  (Uses.part = "bike") ORDER BY component NULLS LAST;