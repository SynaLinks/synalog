WITH t_1_Events AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      '2026-05-26' AS created
   UNION ALL
  
    SELECT
      2 AS id,
      '2025-01-01' AS created
  
) AS UNUSED_TABLE_NAME  ),
t_0_ThisYear AS (SELECT
  Events.id AS id
FROM
  t_1_Events AS Events, CurrentDate
WHERE
  (SUBSTR(Events.created, 1, 4) = SUBSTR(CurrentDate.date, 1, 4)) ORDER BY id)
SELECT
  ThisYear.id AS id
FROM
  t_0_ThisYear AS ThisYear ORDER BY id;