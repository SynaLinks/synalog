# Everyone above ali in the approval chain.
# Expect: rows A = [('cal',), ('dan',), ('eva',)]
ApproverOf(approver: "eva", requester: "dan");
ApproverOf(approver: "dan", requester: "cal");
ApproverOf(approver: "dan", requester: "bea");
ApproverOf(approver: "cal", requester: "ali");
@Recursive(Above, 6);
Above(approver:, requester:) distinct :- ApproverOf(approver:, requester:);
Above(approver: b, requester:) distinct :- Above(approver: a, requester:), ApproverOf(approver: b, requester: a);
@OrderBy(A, "approver");
A(approver:) distinct :- Above(approver:, requester: "ali");
