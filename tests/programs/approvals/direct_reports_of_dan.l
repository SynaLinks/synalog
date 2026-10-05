# How many requesters dan approves directly.
# Expect: rows N = [(2,)]
ApproverOf(approver: "eva", requester: "dan");
ApproverOf(approver: "dan", requester: "cal");
ApproverOf(approver: "dan", requester: "bea");
ApproverOf(approver: "cal", requester: "ali");
N(n? += 1) distinct :- ApproverOf(approver: "dan");
