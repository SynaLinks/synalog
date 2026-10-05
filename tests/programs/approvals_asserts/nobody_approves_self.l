# Nobody approves their own requests, at any level.
# Expect: holds Above.not_self
ApproverOf(approver: "eva", requester: "dan");
ApproverOf(approver: "dan", requester: "cal");
ApproverOf(approver: "dan", requester: "bea");
ApproverOf(approver: "cal", requester: "ali");
@Recursive(Above, 6);
Above(approver:, requester:) distinct :- ApproverOf(approver:, requester:);
Above(approver: b, requester:) distinct :- Above(approver: a, requester:), ApproverOf(approver: b, requester: a);
@Assert(Above, not_self: "∀ x, ¬ Above x x");
