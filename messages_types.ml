[@@@ocaml.warning "-27-30-39"]


type blockmsg = {
  total_difficulty : int32;
  last_block_hash : string;
  last_block_num : int32;
  gen_block_hash : string;
}

type tx_msg = {
  to_ : string;
  from : string;
  amount : int32;
  value : int32;
  data : string;
}

type transactions = {
  transactions : tx_msg list;
}

type ping = {
  from : string;
  to_ : string;
}

type pong = {
  to_ : string;
  ping_hash : string;
}

type find_node = {
  target : string;
}

type neighbors = {
  nodes : int32 list;
}

type msg =
  | Blockmsg of blockmsg
  | Tx_msg of tx_msg
  | Transactions of transactions
  | Ping of ping
  | Pong of pong
  | Find_node of find_node
  | Neighbors of neighbors

let rec default_blockmsg 
  ?total_difficulty:((total_difficulty:int32) = 0l)
  ?last_block_hash:((last_block_hash:string) = "")
  ?last_block_num:((last_block_num:int32) = 0l)
  ?gen_block_hash:((gen_block_hash:string) = "")
  () : blockmsg  = {
  total_difficulty;
  last_block_hash;
  last_block_num;
  gen_block_hash;
}

let rec default_tx_msg 
  ?to_:((to_:string) = "")
  ?from:((from:string) = "")
  ?amount:((amount:int32) = 0l)
  ?value:((value:int32) = 0l)
  ?data:((data:string) = "")
  () : tx_msg  = {
  to_;
  from;
  amount;
  value;
  data;
}

let rec default_transactions 
  ?transactions:((transactions:tx_msg list) = [])
  () : transactions  = {
  transactions;
}

let rec default_ping 
  ?from:((from:string) = "")
  ?to_:((to_:string) = "")
  () : ping  = {
  from;
  to_;
}

let rec default_pong 
  ?to_:((to_:string) = "")
  ?ping_hash:((ping_hash:string) = "")
  () : pong  = {
  to_;
  ping_hash;
}

let rec default_find_node 
  ?target:((target:string) = "")
  () : find_node  = {
  target;
}

let rec default_neighbors 
  ?nodes:((nodes:int32 list) = [])
  () : neighbors  = {
  nodes;
}

let rec default_msg () : msg = Blockmsg (default_blockmsg ())
