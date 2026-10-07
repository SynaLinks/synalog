# Requesters with nobody to approve them now, delegates counted.
# Expect: rows U = []
ApproverOf(approver: "eva", requester: "dan");
ApproverOf(approver: "dan", requester: "cal");
ApproverOf(approver: "dan", requester: "bea");
ApproverOf(approver: "cal", requester: "ali");
Away(person: "dan");
DelegatesTo(person: "dan", delegate: "fay");
Effective(approver:, requester:) distinct :- ApproverOf(approver:, requester:), ~Away(person: approver) |
  ApproverOf(approver: a, requester:), Away(person: a), DelegatesTo(person: a, delegate: approver);
Requester(requester:) distinct :- ApproverOf(requester:);
@OrderBy(U, "requester");
U(requester:) :- Requester(requester:), ~Effective(requester:);
