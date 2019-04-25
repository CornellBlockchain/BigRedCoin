include Block
include BatBig_int
let MINE_ITER = 1024
let MAX_BLOCK_BYTES = 4


(* [block_size [b_zer] is the number of bytes in the serializated block b_ser *)
let block_size (b_ser : string) : string =
  let string_len = List.length b_ser in 
  let char_1 = (string_len mod 256) in
  let char_2 = (string_len lsr 8) mod 256 in
  let char_3 = (string_len lsr 16) mod 256 in
  let char_4 = (string_len lsr 24) mod 256 in
  (String.make 1 (Char.chr char_4)) ^ (String.make 1 (Char.chr char_3))
  ^ (String.make 1 (Char.chr char_2)) ^ (String.make 1 (Char.chr char_1))

let mine template_pipe valid_block_pipe block count =
  if count = 0
  then
    let len = Bytes.create MAX_BLOCK_BYTES in
    input template_pipe len 0 MAX_BLOCK_BYTES;
    let getl = Bytes.get len in
    let block_len = (Char.code (getl 0)) lsl 24 + (Char.code (getl 1)) lsl 16 
                    + (Char.code (getl 2)) lsl 8 + (Char.code (getl 3)) in
    if block_len = 0 then
      mine template_pipe valid_block_pipe block MINE_ITER
    else
      let block_buf = Bytes.create block_len in
      let bytes_read = input template_pipe block_buf 0 block_len in
      if bytes_read < block_len then failwith "Attempted to read malformed block"
      else
        match Block.deserialize (to_string block_buf) with
        | b -> mine template_pipe valid_block_pipe b MINE_ITER
        | _ -> mine template_pipe valid_block_pipe block MINE_ITER
  else
  if Block.hash block < Block.difficulty block 
  then (let block_serialized = Block.serialize block in
        let bsize = block_size block in 
        (* concat block size string and serialized string and push*)
        output_string valid_block_pipe (bsize ^ block_serialized);
       )

  else mine template_ppe valid_block_pipe 
      {block with header = {header with nonce = Block.nonce block + 1}} (conut - 1)
