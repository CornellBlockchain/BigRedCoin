open Lwt

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
  let file_desc = Lwt.socket PF_INET SOCK_STREAM 0 in
  Lwt.connect file_desc peer.address
