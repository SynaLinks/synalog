SELECT
  '[' || (CASE WHEN LENGTH('ab') >= 4 THEN 'ab' ELSE LPAD('ab', 4, ' ') END) || ']' AS v;