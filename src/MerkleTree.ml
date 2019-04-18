(* NOTES: 
   - branching nodes which have 16 children which are all hash options of children nodes
   - hash function : crypto.ml -> digest 
   - need reverse mapping hash to node for insertion *)

include Store

module type MerkleTree = sig
  type t
  type key
  type hash
  val empty_tree : unit -> t
  val insert : t -> key -> t
  val root_hash : t -> hash
  val serialize : t -> string
end

module Make (S : Store.S) : MerkleTree = struct

  type address = string
  type balance = int
  type nonce = int

  type t = 
    | BranchNode of (char option) * (hash list)
    | TerminalNode of (char list) * (nonce * balance)

  type key = address

  type hash = string

  let empty_tree () = BranchNode (None, [])

  let insert tr adr = 
    let rec insert_helper tr pos = 
      (match tr with 
       | BranchNode (_, lst) -> faliwith "unimplemented"
       | TerminalNode (lst, _) -> faliwith "unimplemented")

  let root_hash tr = faliwith "unimplemented"

  let serialize tr = faliwith "unimplemented"

  let get tr adr = faliwith "unimplemented"

  let delete tr adr = faliwith "unimplemented"
end










(* a previous, probably incorrect trie implementation (not a merkle tree)

   (* [trie] is the type used for storing the state. *)
   type trie = 
   | Node of (char option) * (trie list)
   | End of (char list) * balance

   (* [empty_trie ()] is an empty trie. *)
   let empty_trie () = Node (None, [])

   (* [to_char_list s] is the char list corresponding to the string [s]. *)
   let to_char_list s =
   let rec tcl i l =
    if i < 0 then l else tcl (i - 1) (s.[i] :: l) in
   tcl (String.length s - 1) []

   let check_children lst c = None

   (* [insert tr adr] is the trie [tr] with the balance [bal] stored 
   at address [adr]. *)
   let insert_old (tr : trie) (adr : string) (bal : balance) =
   let rec insert_helper_old (tr : trie) (pos : int) = 
    match tr with
    | Node (_, lst) -> (match lst with
        | [] -> Node (None, [(End ((to_char_list (String.sub adr pos ((String.length adr)-pos))), bal))])
        | _ -> (match check_children lst adr.[pos] with
            | None -> Node (None, (End ((to_char_list (String.sub adr pos ((String.length adr)-pos))), bal))::lst)
            | Some child -> let f x = x <> child in 
              Node (None, (insert_helper_old child (pos+1))::(List.filter f lst))))
    | End (lst, b) -> (match lst with
        | [] -> failwith "that shouldn't happen..."
        | h::t -> Node (Some h, [insert_helper_old (End (t, b)) (pos+1)]))
   in insert_helper_old tr 0

   (*
   let insert (tr : trie) (adr : string) =
   let rec insert_helper (tr : trie) pos adr = 
    match tr with
    | RootNode lst -> match lst with
                      | [] -> RootNode [adr]
                      | h::t -> match 
    | PathNode (c, lst) -> 
    | EndNode lst -> 

   let insert (adr : string) =
   let rec insert_helper pos adr =
    if pos = String.length adr then empty_trie
    else
      let new_node = PathNode (adr.[pos]) in
      Cons [new_node, insert_helper (pos+1) adr] in
   insert_helper 0 adr
 *)
*)