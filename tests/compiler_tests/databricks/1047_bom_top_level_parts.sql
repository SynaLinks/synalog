WITH t_3_Uses AS (SELECT * FROM VALUES
  ("bike", "frame", 1),
  ("bike", "wheel", 2),
  ("wheel", "rim", 1),
  ("wheel", "spoke", 32),
  ("wheel", "hub", 1),
  ("hub", "bearing", 2),
  ("frame", "tube", 3),
  ("scooter", "wheel", 2),
  ("scooter", "deck", 1)
AS UNUSED_TABLE_NAME(part, component, qty)),
t_2_Part_MultBodyAggAux AS (SELECT * FROM (
  
    SELECT
      Uses.part AS part
    FROM
      t_3_Uses AS Uses
   UNION ALL
  
    SELECT
      t_4_Uses.component AS part
    FROM
      t_3_Uses AS t_4_Uses
  
) AS UNUSED_TABLE_NAME  ),
t_1_Part AS (SELECT
  Part_MultBodyAggAux.part AS part
FROM
  t_2_Part_MultBodyAggAux AS Part_MultBodyAggAux
GROUP BY 1)
SELECT
  t_0_Part.part AS part
FROM
  t_1_Part AS t_0_Part
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    t_3_Uses AS t_5_Uses
  WHERE
    (t_5_Uses.component = t_0_Part.part)) IS NULL) ORDER BY part NULLS LAST;