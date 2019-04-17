open BatBig_int
type blockstore = Block.t Store.t
type t = {head : Block.t; state : State.t; total_diff : big_int}

let head t = t.head

let state t = t.state

(* [check_hash block] checks that the hash of the block is below its total difficulty. *)
let check_hash block = parent_hash block

let total_diff t = t.total_diff

(* [validate t block] checks that [block] is a valid block to attach to the
 * head of fork [t]. *)
let validate t block =
  Block.next_difficulty (head t) = Block.difficulty block
  && check_hash block
  && Block.height block = Block.height (head t) + 1
  && Block.parent_hash block = Block.hash (head t)

(* TODO: use actual interfaces for state and block when they are written. *)
let apply t block store =
  if validate t block then
    Store.put store block;
  Some {head = block; state = State.update state block; total_diff = t.total_diff + Block.difficulty block}
else None
