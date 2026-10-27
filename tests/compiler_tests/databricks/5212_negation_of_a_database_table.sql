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
    (providers.npi <=> ground_truth.npi) AND
    (providers.scheme <=> ground_truth.scheme)) IS NULL);