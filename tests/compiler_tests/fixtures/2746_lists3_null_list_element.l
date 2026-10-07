# Test: An element of a null list is null. (from tests/programs/lists3/null_list_element.l)

V(l: null);
Q(e: Element(l, 0)) :- V(l:);
