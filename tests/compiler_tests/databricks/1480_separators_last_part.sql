WITH t_0_E AS (SELECT * FROM VALUES
  ("ada", "ada@analytical.org"),
  ("ken", "ken@bell-labs.com")
AS UNUSED_TABLE_NAME(name, email))
SELECT
  E.name AS name,
  (CASE WHEN ((ARRAY_SIZE(SPLIT(E.email, REGEXP_REPLACE(".", '([^a-zA-Z0-9])', '\\\\$1')))) - (1)) < 0 THEN NULL ELSE ELEMENT_AT(SPLIT(E.email, REGEXP_REPLACE(".", '([^a-zA-Z0-9])', '\\\\$1')), CAST(((ARRAY_SIZE(SPLIT(E.email, REGEXP_REPLACE(".", '([^a-zA-Z0-9])', '\\\\$1')))) - (1)) AS INT) + 1) END) AS tld
FROM
  t_0_E AS E ORDER BY name NULLS LAST;