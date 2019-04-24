include Block
include BatBig_int
let MINE_ITER = 1024
let MAX_BLOCK_BYTES = 4

let mine_start template_pipe valid_block_pipe =
  

let mine template_pipe valid_block_pipe block count =
  if count = 0
  then
    let len = Bytes.create MAX_BLOCK_BYTES in
    input template_pipe len 0 MAX_BLOCK_BYTES;
    let getl = Bytes.get len in
    let block_len = (Char.code (getl 0)) << 24 + (Char.code (getl 1)) << 16 
                    + (Char.code (getl 2)) << 8 + (Char.code (getl 3)) in
    if block_len = 0 then
      mine template_pipe valid_block_pipe block MINE_ITER
    else
      let block_buf = Bytes.create block_len in
      input template_pipe len 0 block_len;
      match Block.deserialize (to_string block_buf) with
      | b -> mine template_pipe valid_block_pipe b MINE_ITER
      | _ -> mine template_pipe valid_block_pipe block MINE_ITER

  else
    if Block.hash block < Block.difficulty block 
    then block
    else mine template_ppe valid_block_pipe 
              {block with header = {header with nonce = Block.nonce block + 1}} (conut - 1)
