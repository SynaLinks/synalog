SELECT
  '[' || (CASE WHEN LENGTH('ab') >= 4 THEN 'ab' ELSE RPAD('ab', 4, ' ') END) || ']' AS v;