[@@@ocaml.warning "-27-30-39"]

type blockmsg_mutable = {
  mutable protocl_version : int32;
  mutable network_id : int32;
  mutable total_difficulty : int32;
  mutable last_block_hash : string;
  mutable last_block_num : int32;
  mutable gen_block_hash : string;
}

let default_blockmsg_mutable () : blockmsg_mutable = {
  protocl_version = 0l;
  network_id = 0l;
  total_difficulty = 0l;
  last_block_hash = "";
  last_block_num = 0l;
  gen_block_hash = "";
}


let rec decode_blockmsg d =
  let v = default_blockmsg_mutable () in
  let continue__= ref true in
  while !continue__ do
    match Pbrt.Decoder.key d with
    | None -> (
    ); continue__ := false
    | Some (1, Pbrt.Varint) -> begin
      v.protocl_version <- Pbrt.Decoder.int32_as_varint d;
    end
    | Some (1, pk) -> 
      Pbrt.Decoder.unexpected_payload "Message(blockmsg), field(1)" pk
    | Some (2, Pbrt.Varint) -> begin
      v.network_id <- Pbrt.Decoder.int32_as_varint d;
    end
    | Some (2, pk) -> 
      Pbrt.Decoder.unexpected_payload "Message(blockmsg), field(2)" pk
    | Some (3, Pbrt.Varint) -> begin
      v.total_difficulty <- Pbrt.Decoder.int32_as_varint d;
    end
    | Some (3, pk) -> 
      Pbrt.Decoder.unexpected_payload "Message(blockmsg), field(3)" pk
    | Some (4, Pbrt.Bytes) -> begin
      v.last_block_hash <- Pbrt.Decoder.string d;
    end
    | Some (4, pk) -> 
      Pbrt.Decoder.unexpected_payload "Message(blockmsg), field(4)" pk
    | Some (5, Pbrt.Varint) -> begin
      v.last_block_num <- Pbrt.Decoder.int32_as_varint d;
    end
    | Some (5, pk) -> 
      Pbrt.Decoder.unexpected_payload "Message(blockmsg), field(5)" pk
    | Some (6, Pbrt.Bytes) -> begin
      v.gen_block_hash <- Pbrt.Decoder.string d;
    end
    | Some (6, pk) -> 
      Pbrt.Decoder.unexpected_payload "Message(blockmsg), field(6)" pk
    | Some (_, payload_kind) -> Pbrt.Decoder.skip d payload_kind
  done;
  ({
    Messages_types.protocl_version = v.protocl_version;
    Messages_types.network_id = v.network_id;
    Messages_types.total_difficulty = v.total_difficulty;
    Messages_types.last_block_hash = v.last_block_hash;
    Messages_types.last_block_num = v.last_block_num;
    Messages_types.gen_block_hash = v.gen_block_hash;
  } : Messages_types.blockmsg)

let rec encode_blockmsg (v:Messages_types.blockmsg) encoder = 
  Pbrt.Encoder.key (1, Pbrt.Varint) encoder; 
  Pbrt.Encoder.int32_as_varint v.Messages_types.protocl_version encoder;
  Pbrt.Encoder.key (2, Pbrt.Varint) encoder; 
  Pbrt.Encoder.int32_as_varint v.Messages_types.network_id encoder;
  Pbrt.Encoder.key (3, Pbrt.Varint) encoder; 
  Pbrt.Encoder.int32_as_varint v.Messages_types.total_difficulty encoder;
  Pbrt.Encoder.key (4, Pbrt.Bytes) encoder; 
  Pbrt.Encoder.string v.Messages_types.last_block_hash encoder;
  Pbrt.Encoder.key (5, Pbrt.Varint) encoder; 
  Pbrt.Encoder.int32_as_varint v.Messages_types.last_block_num encoder;
  Pbrt.Encoder.key (6, Pbrt.Bytes) encoder; 
  Pbrt.Encoder.string v.Messages_types.gen_block_hash encoder;
  ()
