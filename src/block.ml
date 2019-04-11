type header = {
  parent_hash : string; 
  beneficiary : string;
  root : string;
  difficulty : int;
  height : int;
  timestamp : int;
  nonce : int;
  state_root : string
}

type transaction = {
  sender_address: string;
  receiver_address: string;
  amount_sent: int
}
type t = {
  header : header;
  transactions : transaction list
}

let blockstore = Store.Make (Block.t)

let target_time = 300

let rec time_ancestor (counter : int) (current_block : header)=
  match counter with
  | 0 -> current_block.timestamp
  | n -> time_ancestor (n-1) (Store.get blockstore current_block.parent_hash)

let difficulty t = t.header.difficulty

let beneficiary t = t.header.beneficiary

let height t = t.header.height

let next_difficulty (current_block : header): int = 
  let steps_back = 32 in 
  let avg_time = (((time_ancestor steps_back current_block) - 
                   (current_block.timestamp)) / steps_back) in
  (target_time / avg_time) * (current_block.difficulty)
