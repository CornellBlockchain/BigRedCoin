(*open some networking module*)

(** Represents frontier of current known network, as well as other state *)
type t
type peer

(**block list *)
type BL 

(**Protocol model: choose peer randomly, then sync it, delegating various functions to sync various parts.*)

(**Functions for peer discovery *)
val choose_peer: t -> peer

val establish_connection : t -> peer -> ()

val sync : t -> peer -> ()


(** Block gossip stuff (syncing subsumed by this) *)
val blocks_in_range: int -> int -> BL

(**Creates fork possibilities*)
val collect_forks : BL -> ()

(** Transaction Gossip Stuff, transactions sent all at once*)
val send_txs : t -> ()

(**Probably has something to do with specifics of networking *)
val assimilate_txs : t -> ()