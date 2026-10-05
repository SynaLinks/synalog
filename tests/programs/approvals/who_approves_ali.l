# Who can approve ali's request now, delegating for people away.
# Expect: rows W = [('cal',)]
ApproverOf(approver: "eva", requester: "dan");
ApproverOf(approver: "dan", requester: "cal");
ApproverOf(approver: "dan", requester: "bea");
ApproverOf(approver: "cal", requester: "ali");
Away(person: "dan");
DelegatesTo(person: "dan", delegate: "fay");
Effective(approver:, requester:) distinct :- ApproverOf(approver:, requester:), ~Away(person: approver) |
  ApproverOf(approver: a, requester:), Away(person: a), DelegatesTo(person: a, delegate: approver);
@OrderBy(W, "approver");
W(approver:) distinct :- Effective(approver:, requester: "ali");
