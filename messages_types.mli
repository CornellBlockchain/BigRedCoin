(** messages.proto Types *)



(** {2 Types} *)

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


(** {2 Default values} *)

val default_blockmsg : 
  ?total_difficulty:int32 ->
  ?last_block_hash:string ->
  ?last_block_num:int32 ->
  ?gen_block_hash:string ->
  unit ->
  blockmsg
(** [default_blockmsg ()] is the default value for type [blockmsg] *)

val default_tx_msg : 
  ?to_:string ->
  ?from:string ->
  ?amount:int32 ->
  ?value:int32 ->
  ?data:string ->
  unit ->
  tx_msg
(** [default_tx_msg ()] is the default value for type [tx_msg] *)

val default_transactions : 
  ?transactions:tx_msg list ->
  unit ->
  transactions
(** [default_transactions ()] is the default value for type [transactions] *)

val default_ping : 
  ?from:string ->
  ?to_:string ->
  unit ->
  ping
(** [default_ping ()] is the default value for type [ping] *)

val default_pong : 
  ?to_:string ->
  ?ping_hash:string ->
  unit ->
  pong
(** [default_pong ()] is the default value for type [pong] *)

val default_find_node : 
  ?target:string ->
  unit ->
  find_node
(** [default_find_node ()] is the default value for type [find_node] *)

val default_neighbors : 
  ?nodes:int32 list ->
  unit ->
  neighbors
(** [default_neighbors ()] is the default value for type [neighbors] *)

val default_msg : unit -> msg
(** [default_msg ()] is the default value for type [msg] *)
