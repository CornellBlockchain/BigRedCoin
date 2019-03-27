type blockstore = Block.t Store.t
type t = {head : Block.t; state : State.t; total_diff : int}

let head t = t.head

let state t = t.state

(* [validate t block] checks that [block] is a valid block to attach to the 
 * head of fork [t] *)
let validate t block = failwith "unimplimented"

let apply t block store = 
  if validate t block 
  then 
    Store.put store block;
    Some {head = block; state = State.update state block; total_diff = t.total_diff + Block.difficulty block}
  else None
