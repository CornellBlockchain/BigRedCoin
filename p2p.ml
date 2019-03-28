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
  let (msg : Messages_types.temp) = {name = Int32.of_int 100000000} in
  let encoder = Pbrt.Encoder.create () in
  Messages_pb.encode_temp msg encoder;
  let b = Pbrt.Encoder.to_bytes encoder in
  print_endline (Bytes.to_string b) 