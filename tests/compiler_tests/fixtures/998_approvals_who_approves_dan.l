# Test: Who can approve dan's request now, delegating for people away. (from tests/programs/approvals/who_approves_dan.l)

ApproverOf(approver: "eva", requester: "dan");
ApproverOf(approver: "dan", requester: "cal");
ApproverOf(approver: "dan", requester: "bea");
ApproverOf(approver: "cal", requester: "ali");
Away(person: "dan");
DelegatesTo(person: "dan", delegate: "fay");
Effective(approver:, requester:) distinct :- ApproverOf(approver:, requester:), ~Away(person: approver) |
  ApproverOf(approver: a, requester:), Away(person: a), DelegatesTo(person: a, delegate: approver);
@OrderBy(W, "approver");
W(approver:) distinct :- Effective(approver:, requester: "dan");
