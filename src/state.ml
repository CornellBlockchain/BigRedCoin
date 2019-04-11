(* todo: somethings *)

type t = {
  key : string;
  prev : t
}

let account_store = Store.Make Account.t
let state_store = Store.Make t

let prev_state st = st.prev

let helper_update tx = 
  failwith "todo"

let update_state st block =
  let txs = Block.transactions block in
  failwith "todo"

let hash x = failwith "todo"

let serialize x = failwith "todo"

let deserialize x = failwith "todo"
