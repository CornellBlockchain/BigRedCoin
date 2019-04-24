open BatBig_int
open Sexplib
type header = {
  parent_hash : string;
  beneficiary : string;
  root : string;
  difficulty : big_int;
  height : int;
  timestamp : int;
  nonce : int;
  state_root : string
} with sexp

type transaction = {
  sender_address: string;
  receiver_address: string;
  amount_sent: int
} with sexp
type t = {
  header : header;
  transactions : transaction list
} with sexp

let parent_hash t = t.header.parent_hash

let blockstore = Store.Make (Block.t)

let target_time = 300

let rec time_ancestor (counter : int) (current_block : header)=
  match counter with
  | 0 -> current_block.timestamp
  | n -> time_ancestor (n-1) (Store.get blockstore current_block.parent_hash)

let difficulty t = t.header.difficulty

let beneficiary t = t.header.beneficiary

let height t = t.header.height

let next_difficulty (current_block : header): big_int =
  let steps_back = 32 in
  let avg_time = (((time_ancestor steps_back current_block) -
                   (current_block.timestamp)) / steps_back) in
  mult_int_big_int (target_time / avg_time) (current_block.difficulty)

let  transactions b = b.transactions

let trx_sender_address tr = tr.sender_address

let trx_reciever_address tr = tr.receiver_address

let trx_amount_sent tr = tr.amount_sent

let root b = b.header.root

let timestamp b = b.header.timestamp

(* [serialize b] is the stringification of [b] *)
let serialize b = Sexp.to_string b

(* [serialize str] is destringification of [str] into a block *)
let deserialize str = Sexp.of_string str

(* [hast b] is the hash of block [b] *)
let hash b = Crypto.digest(serialize(b))