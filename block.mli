type header
type t

(* [difficulty t] is the difficulty of the block [t]. *)
val difficulty t -> hash

(* [beneficiary t] is the beneficiary of the mining rewards of the block [t]. *)
val beneficiary t -> address

(* [height t] is the height of the block [t]. *)
val height t -> int

