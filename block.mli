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




