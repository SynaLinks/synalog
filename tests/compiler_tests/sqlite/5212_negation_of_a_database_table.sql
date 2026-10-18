SELECT
  providers.npi AS npi
FROM
  providers
WHERE
  ((SELECT
    MIN(MagicalEntangle(1, x_10.value)) AS logica_value
  FROM
    ground_truth, JSON_EACH(JSON_ARRAY(0)) as x_10
  WHERE
    (providers.npi = ground_truth.npi) AND
    (providers.scheme = ground_truth.scheme)) IS NULL) AND
  ((SELECT
    MIN(MagicalEntangle(1, x_17.value)) AS logica_value
  FROM
    excluded, JSON_EACH(JSON_ARRAY(0)) as x_17
  WHERE
    (excluded.npi = providers.npi)) IS NULL);