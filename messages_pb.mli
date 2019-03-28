(** messages.proto Binary Encoding *)


(** {2 Protobuf Encoding} *)

val encode_blockmsg : Messages_types.blockmsg -> Pbrt.Encoder.t -> unit
(** [encode_blockmsg v encoder] encodes [v] with the given [encoder] *)


(** {2 Protobuf Decoding} *)

val decode_blockmsg : Pbrt.Decoder.t -> Messages_types.blockmsg
(** [decode_blockmsg decoder] decodes a [blockmsg] value from [decoder] *)
