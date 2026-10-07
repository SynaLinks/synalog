# Test: @Limit with a descending order, then a page of it. (from tests/programs/directives/21_limit_desc_page.l)

V(x:) :- x in [1, 2, 3, 4, 5];
@OrderBy(Top, "x DESC");
@Limit(Top, 3);
Top(x:) :- V(x:);
