[@@@ocaml.warning "-27-30-39"]


type blockmsg = {
  protocl_version : int32;
  network_id : int32;
  total_difficulty : int32;
  last_block_hash : string;
  last_block_num : int32;
  gen_block_hash : string;
}

let rec default_blockmsg 
  ?protocl_version:((protocl_version:int32) = 0l)
  ?network_id:((network_id:int32) = 0l)
  ?total_difficulty:((total_difficulty:int32) = 0l)
  ?last_block_hash:((last_block_hash:string) = "")
  ?last_block_num:((last_block_num:int32) = 0l)
  ?gen_block_hash:((gen_block_hash:string) = "")
  () : blockmsg  = {
  protocl_version;
  network_id;
  total_difficulty;
  last_block_hash;
  last_block_num;
  gen_block_hash;
}
