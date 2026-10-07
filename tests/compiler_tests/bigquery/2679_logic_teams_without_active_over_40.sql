WITH t_2_Person AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      "Ann" AS name,
      "red" AS team,
      34 AS age,
      true AS active
   UNION ALL
  
    SELECT
      2 AS id,
      "Bob" AS name,
      "red" AS team,
      null AS age,
      false AS active
   UNION ALL
  
    SELECT
      3 AS id,
      "Cid" AS name,
      "blue" AS team,
      52 AS age,
      true AS active
   UNION ALL
  
    SELECT
      4 AS id,
      "Dee" AS name,
      "blue" AS team,
      23 AS age,
      false AS active
   UNION ALL
  
    SELECT
      5 AS id,
      "Eve" AS name,
      "green" AS team,
      41 AS age,
      null AS active
   UNION ALL
  
    SELECT
      6 AS id,
      "Fay" AS name,
      "red" AS team,
      19 AS age,
      true AS active
   UNION ALL
  
    SELECT
      7 AS id,
      "Gus" AS name,
      "gold" AS team,
      60 AS age,
      false AS active
  
) AS UNUSED_TABLE_NAME  ),
t_1_Team AS (SELECT
  Person.team AS team
FROM
  t_2_Person AS Person
GROUP BY team),
t_3_Senior AS (SELECT
  t_4_Person.team AS team
FROM
  t_2_Person AS t_4_Person
WHERE
  t_4_Person.active AND
  (t_4_Person.age > 40)
GROUP BY team)
SELECT
  t_0_Team.team AS team
FROM
  t_1_Team AS t_0_Team
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    t_3_Senior AS Senior
  WHERE
    (Senior.team = t_0_Team.team)) IS NULL) ORDER BY team NULLS LAST;