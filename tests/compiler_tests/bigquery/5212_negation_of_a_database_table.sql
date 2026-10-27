SELECT
  providers.npi AS npi
FROM
  providers
WHERE
  ((SELECT
    MIN(1) AS synalog_value
  FROM
    ground_truth
  WHERE
    (providers.npi IS NOT DISTINCT FROM ground_truth.npi) AND
    (providers.scheme IS NOT DISTINCT FROM ground_truth.scheme)) IS NULL);