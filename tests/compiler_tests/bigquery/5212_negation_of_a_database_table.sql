SELECT
  providers.npi AS npi
FROM
  providers
WHERE
  ((SELECT
    MIN(1) AS logica_value
  FROM
    ground_truth
  WHERE
    (providers.npi = ground_truth.npi) AND
    (providers.scheme = ground_truth.scheme)) IS NULL) AND
  ((SELECT
    MIN(1) AS logica_value
  FROM
    excluded
  WHERE
    (excluded.npi = providers.npi)) IS NULL);