(** messages.proto Types *)



(** {2 Types} *)

type blockmsg = {
  protocl_version : int32;
  network_id : int32;
  total_difficulty : int32;
  last_block_hash : string;
  last_block_num : int32;
  gen_block_hash : string;
}


(** {2 Default values} *)

val default_blockmsg : 
  ?protocl_version:int32 ->
  ?network_id:int32 ->
  ?total_difficulty:int32 ->
  ?last_block_hash:string ->
  ?last_block_num:int32 ->
  ?gen_block_hash:string ->
  unit ->
  blockmsg
(** [default_blockmsg ()] is the default value for type [blockmsg] *)
