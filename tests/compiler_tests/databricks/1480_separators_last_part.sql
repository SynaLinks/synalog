WITH t_0_E AS (SELECT * FROM VALUES
  ("ada", "ada@analytical.org"),
  ("ken", "ken@bell-labs.com")
AS UNUSED_TABLE_NAME(name, email))
SELECT
  E.name AS name,
  ELEMENT_AT(SPLIT(E.email, REGEXP_REPLACE(".", '([^a-zA-Z0-9])', '\\\\$1')), ((ARRAY_SIZE(SPLIT(E.email, REGEXP_REPLACE(".", '([^a-zA-Z0-9])', '\\\\$1')))) - (1)) + 1) AS tld
FROM
  t_0_E AS E ORDER BY name NULLS LAST;
