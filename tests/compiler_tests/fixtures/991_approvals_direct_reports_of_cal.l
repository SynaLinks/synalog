# Test: How many requesters cal approves directly. (from tests/programs/approvals/direct_reports_of_cal.l)

ApproverOf(approver: "eva", requester: "dan");
ApproverOf(approver: "dan", requester: "cal");
ApproverOf(approver: "dan", requester: "bea");
ApproverOf(approver: "cal", requester: "ali");
N(n? += 1) distinct :- ApproverOf(approver: "cal");
