type header
type transaction
type t

(* [hast b] is the hash of block [b] *)
val hash : t -> string

(* [serialize b] is the stringification of [b] *)
val serialize : t -> string

(* [serialize str] is destringification of [str] into a block *)
val deserialize : string -> t

(* [difficulty t] is the difficulty of the block [t]. *)
val difficulty: t -> big_int

(* [beneficiary t] is the beneficiary of the mining rewards of the block [t]. *)
val beneficiary: t -> string

(* [height t] is the height of the block [t]. *)
val height: t -> int

(* [transactions t] is a list of the transactions contained in block [t]*)
val transactions: t -> transaction list

(* [trx_sender_address tr] is the sender address of transaction [tr]*)
val trx_sender_address: transaction -> string

(* [trx_reciever_address tr] is the reciever address of transaction [tr]*)
val trx_reciever_address: t -> string

(* [trx_amount_sent tr] is the amount set in transaction [tr]*)
val trx_amount_sent: t -> int

(* [root b] is the hash of the root node contained in block [b]*)
val root: t -> int

(* [timestamp b] is the hash of the root node contained in block [b]*)
val timestamp: t -> int

(* [nonce b] is the nonce of block [b] *)
val nonce: t -> int