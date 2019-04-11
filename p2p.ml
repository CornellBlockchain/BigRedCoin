type peer = {
  address : Unix.sockaddr;
  timestamp : float;
  public_key : string;
}

type state = {
  mutable peers : peer list;
}

let state = {peers = []}

let connect peer = 
  let file_desc = Unix.socket PF_INET SOCK_STREAM 0 in
  Unix.connect file_desc peer.address

let _ =
  let (msg : Messages_types.blockmsg) = {
    total_difficulty = Int32.of_int 1;
    last_block_hash = "2";
    last_block_num = Int32.of_int 3;
    gen_block_hash = "4"} in
  let encoder = Pbrt.Encoder.create () in
  Messages_pb.encode_blockmsg msg encoder;
  let b = Pbrt.Encoder.to_bytes encoder in
  print_endline (Bytes.to_string b) 