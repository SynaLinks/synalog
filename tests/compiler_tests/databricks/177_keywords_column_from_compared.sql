WITH t_0_P AS (SELECT * FROM VALUES
  ("2026-01-01"),
  ("2026-02-01")
AS UNUSED_TABLE_NAME(`from`))
SELECT
  P.`from` AS `from`
FROM
  t_0_P AS P
WHERE
  (P.`from` > "2026-01-15");