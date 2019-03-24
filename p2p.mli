type peer (* [TODO] *)

val push_transaction : Transaction.t -> unit Lwt.t

val transactions : Transaction.t Lwt.stream

val push_block: Block.t -> unit Lwt.t

val blocks : Block.t Lwt.stream

val peers: unit -> peer list

