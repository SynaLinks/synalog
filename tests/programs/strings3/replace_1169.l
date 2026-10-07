# Every 'a' in 'aaa' replaced by 'bb', as text.
# Expect: rows Q = [('bbbbbb',)]
Q(s: Replace('aaa', 'a', "bb"));
