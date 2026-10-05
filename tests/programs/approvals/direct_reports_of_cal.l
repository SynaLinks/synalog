# How many requesters cal approves directly.
# Expect: rows N = [(1,)]
ApproverOf(approver: "eva", requester: "dan");
ApproverOf(approver: "dan", requester: "cal");
ApproverOf(approver: "dan", requester: "bea");
ApproverOf(approver: "cal", requester: "ali");
N(n? += 1) distinct :- ApproverOf(approver: "cal");
