type header = {
  parent_hash : hash; 
  beneficiary : address;
  root : hash;
  difficulty : hash;
  height : int;
  timestamp : int;
  nonce : int;
}

type t = {
  header : header;
  transactions : Transaction.t list
}

let difficulty t = t.header.difficulty

let beneficiary t = t.header.beneficiary

let height t = t.header.height
