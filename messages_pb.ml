[@@@ocaml.warning "-27-30-39"]

type blockmsg_mutable = {
  mutable total_difficulty : int32;
  mutable last_block_hash : string;
  mutable last_block_num : int32;
  mutable gen_block_hash : string;
}

let default_blockmsg_mutable () : blockmsg_mutable = {
  total_difficulty = 0l;
  last_block_hash = "";
  last_block_num = 0l;
  gen_block_hash = "";
}

type tx_msg_mutable = {
  mutable to_ : string;
  mutable from : string;
  mutable amount : int32;
  mutable value : int32;
  mutable data : string;
}

let default_tx_msg_mutable () : tx_msg_mutable = {
  to_ = "";
  from = "";
  amount = 0l;
  value = 0l;
  data = "";
}

type transactions_mutable = {
  mutable transactions : Messages_types.tx_msg list;
}

let default_transactions_mutable () : transactions_mutable = {
  transactions = [];
}

type ping_mutable = {
  mutable from : string;
  mutable to_ : string;
}

let default_ping_mutable () : ping_mutable = {
  from = "";
  to_ = "";
}

type pong_mutable = {
  mutable to_ : string;
  mutable ping_hash : string;
}

let default_pong_mutable () : pong_mutable = {
  to_ = "";
  ping_hash = "";
}

type find_node_mutable = {
  mutable target : string;
}

let default_find_node_mutable () : find_node_mutable = {
  target = "";
}

type neighbors_mutable = {
  mutable nodes : int32 list;
}

let default_neighbors_mutable () : neighbors_mutable = {
  nodes = [];
}


let rec decode_blockmsg d =
  let v = default_blockmsg_mutable () in
  let continue__= ref true in
  while !continue__ do
    match Pbrt.Decoder.key d with
    | None -> (
    ); continue__ := false
    | Some (1, Pbrt.Varint) -> begin
      v.total_difficulty <- Pbrt.Decoder.int32_as_varint d;
    end
    | Some (1, pk) -> 
      Pbrt.Decoder.unexpected_payload "Message(blockmsg), field(1)" pk
    | Some (2, Pbrt.Bytes) -> begin
      v.last_block_hash <- Pbrt.Decoder.string d;
    end
    | Some (2, pk) -> 
      Pbrt.Decoder.unexpected_payload "Message(blockmsg), field(2)" pk
    | Some (3, Pbrt.Varint) -> begin
      v.last_block_num <- Pbrt.Decoder.int32_as_varint d;
    end
    | Some (3, pk) -> 
      Pbrt.Decoder.unexpected_payload "Message(blockmsg), field(3)" pk
    | Some (4, Pbrt.Bytes) -> begin
      v.gen_block_hash <- Pbrt.Decoder.string d;
    end
    | Some (4, pk) -> 
      Pbrt.Decoder.unexpected_payload "Message(blockmsg), field(4)" pk
    | Some (_, payload_kind) -> Pbrt.Decoder.skip d payload_kind
  done;
  ({
    Messages_types.total_difficulty = v.total_difficulty;
    Messages_types.last_block_hash = v.last_block_hash;
    Messages_types.last_block_num = v.last_block_num;
    Messages_types.gen_block_hash = v.gen_block_hash;
  } : Messages_types.blockmsg)

let rec decode_tx_msg d =
  let v = default_tx_msg_mutable () in
  let continue__= ref true in
  while !continue__ do
    match Pbrt.Decoder.key d with
    | None -> (
    ); continue__ := false
    | Some (1, Pbrt.Bytes) -> begin
      v.to_ <- Pbrt.Decoder.string d;
    end
    | Some (1, pk) -> 
      Pbrt.Decoder.unexpected_payload "Message(tx_msg), field(1)" pk
    | Some (2, Pbrt.Bytes) -> begin
      v.from <- Pbrt.Decoder.string d;
    end
    | Some (2, pk) -> 
      Pbrt.Decoder.unexpected_payload "Message(tx_msg), field(2)" pk
    | Some (3, Pbrt.Varint) -> begin
      v.amount <- Pbrt.Decoder.int32_as_varint d;
    end
    | Some (3, pk) -> 
      Pbrt.Decoder.unexpected_payload "Message(tx_msg), field(3)" pk
    | Some (4, Pbrt.Varint) -> begin
      v.value <- Pbrt.Decoder.int32_as_varint d;
    end
    | Some (4, pk) -> 
      Pbrt.Decoder.unexpected_payload "Message(tx_msg), field(4)" pk
    | Some (5, Pbrt.Bytes) -> begin
      v.data <- Pbrt.Decoder.string d;
    end
    | Some (5, pk) -> 
      Pbrt.Decoder.unexpected_payload "Message(tx_msg), field(5)" pk
    | Some (_, payload_kind) -> Pbrt.Decoder.skip d payload_kind
  done;
  ({
    Messages_types.to_ = v.to_;
    Messages_types.from = v.from;
    Messages_types.amount = v.amount;
    Messages_types.value = v.value;
    Messages_types.data = v.data;
  } : Messages_types.tx_msg)

let rec decode_transactions d =
  let v = default_transactions_mutable () in
  let continue__= ref true in
  while !continue__ do
    match Pbrt.Decoder.key d with
    | None -> (
      v.transactions <- List.rev v.transactions;
    ); continue__ := false
    | Some (1, Pbrt.Bytes) -> begin
      v.transactions <- (decode_tx_msg (Pbrt.Decoder.nested d)) :: v.transactions;
    end
    | Some (1, pk) -> 
      Pbrt.Decoder.unexpected_payload "Message(transactions), field(1)" pk
    | Some (_, payload_kind) -> Pbrt.Decoder.skip d payload_kind
  done;
  ({
    Messages_types.transactions = v.transactions;
  } : Messages_types.transactions)

let rec decode_ping d =
  let v = default_ping_mutable () in
  let continue__= ref true in
  while !continue__ do
    match Pbrt.Decoder.key d with
    | None -> (
    ); continue__ := false
    | Some (1, Pbrt.Bytes) -> begin
      v.from <- Pbrt.Decoder.string d;
    end
    | Some (1, pk) -> 
      Pbrt.Decoder.unexpected_payload "Message(ping), field(1)" pk
    | Some (2, Pbrt.Bytes) -> begin
      v.to_ <- Pbrt.Decoder.string d;
    end
    | Some (2, pk) -> 
      Pbrt.Decoder.unexpected_payload "Message(ping), field(2)" pk
    | Some (_, payload_kind) -> Pbrt.Decoder.skip d payload_kind
  done;
  ({
    Messages_types.from = v.from;
    Messages_types.to_ = v.to_;
  } : Messages_types.ping)

let rec decode_pong d =
  let v = default_pong_mutable () in
  let continue__= ref true in
  while !continue__ do
    match Pbrt.Decoder.key d with
    | None -> (
    ); continue__ := false
    | Some (1, Pbrt.Bytes) -> begin
      v.to_ <- Pbrt.Decoder.string d;
    end
    | Some (1, pk) -> 
      Pbrt.Decoder.unexpected_payload "Message(pong), field(1)" pk
    | Some (2, Pbrt.Bytes) -> begin
      v.ping_hash <- Pbrt.Decoder.string d;
    end
    | Some (2, pk) -> 
      Pbrt.Decoder.unexpected_payload "Message(pong), field(2)" pk
    | Some (_, payload_kind) -> Pbrt.Decoder.skip d payload_kind
  done;
  ({
    Messages_types.to_ = v.to_;
    Messages_types.ping_hash = v.ping_hash;
  } : Messages_types.pong)

let rec decode_find_node d =
  let v = default_find_node_mutable () in
  let continue__= ref true in
  while !continue__ do
    match Pbrt.Decoder.key d with
    | None -> (
    ); continue__ := false
    | Some (1, Pbrt.Bytes) -> begin
      v.target <- Pbrt.Decoder.string d;
    end
    | Some (1, pk) -> 
      Pbrt.Decoder.unexpected_payload "Message(find_node), field(1)" pk
    | Some (_, payload_kind) -> Pbrt.Decoder.skip d payload_kind
  done;
  ({
    Messages_types.target = v.target;
  } : Messages_types.find_node)

let rec decode_neighbors d =
  let v = default_neighbors_mutable () in
  let continue__= ref true in
  while !continue__ do
    match Pbrt.Decoder.key d with
    | None -> (
      v.nodes <- List.rev v.nodes;
    ); continue__ := false
    | Some (1, Pbrt.Varint) -> begin
      v.nodes <- (Pbrt.Decoder.int32_as_varint d) :: v.nodes;
    end
    | Some (1, pk) -> 
      Pbrt.Decoder.unexpected_payload "Message(neighbors), field(1)" pk
    | Some (_, payload_kind) -> Pbrt.Decoder.skip d payload_kind
  done;
  ({
    Messages_types.nodes = v.nodes;
  } : Messages_types.neighbors)

let rec decode_msg d = 
  let rec loop () = 
    let ret:Messages_types.msg = match Pbrt.Decoder.key d with
      | None -> Pbrt.Decoder.malformed_variant "msg"
      | Some (1, _) -> Messages_types.Blockmsg (decode_blockmsg (Pbrt.Decoder.nested d))
      | Some (2, _) -> Messages_types.Tx_msg (decode_tx_msg (Pbrt.Decoder.nested d))
      | Some (3, _) -> Messages_types.Transactions (decode_transactions (Pbrt.Decoder.nested d))
      | Some (4, _) -> Messages_types.Ping (decode_ping (Pbrt.Decoder.nested d))
      | Some (5, _) -> Messages_types.Pong (decode_pong (Pbrt.Decoder.nested d))
      | Some (6, _) -> Messages_types.Find_node (decode_find_node (Pbrt.Decoder.nested d))
      | Some (7, _) -> Messages_types.Neighbors (decode_neighbors (Pbrt.Decoder.nested d))
      | Some (n, payload_kind) -> (
        Pbrt.Decoder.skip d payload_kind; 
        loop () 
      )
    in
    ret
  in
  loop ()

let rec encode_blockmsg (v:Messages_types.blockmsg) encoder = 
  Pbrt.Encoder.key (1, Pbrt.Varint) encoder; 
  Pbrt.Encoder.int32_as_varint v.Messages_types.total_difficulty encoder;
  Pbrt.Encoder.key (2, Pbrt.Bytes) encoder; 
  Pbrt.Encoder.string v.Messages_types.last_block_hash encoder;
  Pbrt.Encoder.key (3, Pbrt.Varint) encoder; 
  Pbrt.Encoder.int32_as_varint v.Messages_types.last_block_num encoder;
  Pbrt.Encoder.key (4, Pbrt.Bytes) encoder; 
  Pbrt.Encoder.string v.Messages_types.gen_block_hash encoder;
  ()

let rec encode_tx_msg (v:Messages_types.tx_msg) encoder = 
  Pbrt.Encoder.key (1, Pbrt.Bytes) encoder; 
  Pbrt.Encoder.string v.Messages_types.to_ encoder;
  Pbrt.Encoder.key (2, Pbrt.Bytes) encoder; 
  Pbrt.Encoder.string v.Messages_types.from encoder;
  Pbrt.Encoder.key (3, Pbrt.Varint) encoder; 
  Pbrt.Encoder.int32_as_varint v.Messages_types.amount encoder;
  Pbrt.Encoder.key (4, Pbrt.Varint) encoder; 
  Pbrt.Encoder.int32_as_varint v.Messages_types.value encoder;
  Pbrt.Encoder.key (5, Pbrt.Bytes) encoder; 
  Pbrt.Encoder.string v.Messages_types.data encoder;
  ()

let rec encode_transactions (v:Messages_types.transactions) encoder = 
  List.iter (fun x -> 
    Pbrt.Encoder.key (1, Pbrt.Bytes) encoder; 
    Pbrt.Encoder.nested (encode_tx_msg x) encoder;
  ) v.Messages_types.transactions;
  ()

let rec encode_ping (v:Messages_types.ping) encoder = 
  Pbrt.Encoder.key (1, Pbrt.Bytes) encoder; 
  Pbrt.Encoder.string v.Messages_types.from encoder;
  Pbrt.Encoder.key (2, Pbrt.Bytes) encoder; 
  Pbrt.Encoder.string v.Messages_types.to_ encoder;
  ()

let rec encode_pong (v:Messages_types.pong) encoder = 
  Pbrt.Encoder.key (1, Pbrt.Bytes) encoder; 
  Pbrt.Encoder.string v.Messages_types.to_ encoder;
  Pbrt.Encoder.key (2, Pbrt.Bytes) encoder; 
  Pbrt.Encoder.string v.Messages_types.ping_hash encoder;
  ()

let rec encode_find_node (v:Messages_types.find_node) encoder = 
  Pbrt.Encoder.key (1, Pbrt.Bytes) encoder; 
  Pbrt.Encoder.string v.Messages_types.target encoder;
  ()

let rec encode_neighbors (v:Messages_types.neighbors) encoder = 
  List.iter (fun x -> 
    Pbrt.Encoder.key (1, Pbrt.Varint) encoder; 
    Pbrt.Encoder.int32_as_varint x encoder;
  ) v.Messages_types.nodes;
  ()

let rec encode_msg (v:Messages_types.msg) encoder = 
  begin match v with
  | Messages_types.Blockmsg x ->
    Pbrt.Encoder.key (1, Pbrt.Bytes) encoder; 
    Pbrt.Encoder.nested (encode_blockmsg x) encoder;
  | Messages_types.Tx_msg x ->
    Pbrt.Encoder.key (2, Pbrt.Bytes) encoder; 
    Pbrt.Encoder.nested (encode_tx_msg x) encoder;
  | Messages_types.Transactions x ->
    Pbrt.Encoder.key (3, Pbrt.Bytes) encoder; 
    Pbrt.Encoder.nested (encode_transactions x) encoder;
  | Messages_types.Ping x ->
    Pbrt.Encoder.key (4, Pbrt.Bytes) encoder; 
    Pbrt.Encoder.nested (encode_ping x) encoder;
  | Messages_types.Pong x ->
    Pbrt.Encoder.key (5, Pbrt.Bytes) encoder; 
    Pbrt.Encoder.nested (encode_pong x) encoder;
  | Messages_types.Find_node x ->
    Pbrt.Encoder.key (6, Pbrt.Bytes) encoder; 
    Pbrt.Encoder.nested (encode_find_node x) encoder;
  | Messages_types.Neighbors x ->
    Pbrt.Encoder.key (7, Pbrt.Bytes) encoder; 
    Pbrt.Encoder.nested (encode_neighbors x) encoder;
  end
