type blockstore
type t

val head : t -> Block.t
val apply t -> Block.t -> t
val state t -> State.t
