(** messages.proto Binary Encoding *)


(** {2 Protobuf Encoding} *)

val encode_blockmsg : Messages_types.blockmsg -> Pbrt.Encoder.t -> unit
(** [encode_blockmsg v encoder] encodes [v] with the given [encoder] *)

val encode_tx_msg : Messages_types.tx_msg -> Pbrt.Encoder.t -> unit
(** [encode_tx_msg v encoder] encodes [v] with the given [encoder] *)

val encode_transactions : Messages_types.transactions -> Pbrt.Encoder.t -> unit
(** [encode_transactions v encoder] encodes [v] with the given [encoder] *)

val encode_ping : Messages_types.ping -> Pbrt.Encoder.t -> unit
(** [encode_ping v encoder] encodes [v] with the given [encoder] *)

val encode_pong : Messages_types.pong -> Pbrt.Encoder.t -> unit
(** [encode_pong v encoder] encodes [v] with the given [encoder] *)

val encode_find_node : Messages_types.find_node -> Pbrt.Encoder.t -> unit
(** [encode_find_node v encoder] encodes [v] with the given [encoder] *)

val encode_neighbors : Messages_types.neighbors -> Pbrt.Encoder.t -> unit
(** [encode_neighbors v encoder] encodes [v] with the given [encoder] *)

val encode_msg : Messages_types.msg -> Pbrt.Encoder.t -> unit
(** [encode_msg v encoder] encodes [v] with the given [encoder] *)


(** {2 Protobuf Decoding} *)

val decode_blockmsg : Pbrt.Decoder.t -> Messages_types.blockmsg
(** [decode_blockmsg decoder] decodes a [blockmsg] value from [decoder] *)

val decode_tx_msg : Pbrt.Decoder.t -> Messages_types.tx_msg
(** [decode_tx_msg decoder] decodes a [tx_msg] value from [decoder] *)

val decode_transactions : Pbrt.Decoder.t -> Messages_types.transactions
(** [decode_transactions decoder] decodes a [transactions] value from [decoder] *)

val decode_ping : Pbrt.Decoder.t -> Messages_types.ping
(** [decode_ping decoder] decodes a [ping] value from [decoder] *)

val decode_pong : Pbrt.Decoder.t -> Messages_types.pong
(** [decode_pong decoder] decodes a [pong] value from [decoder] *)

val decode_find_node : Pbrt.Decoder.t -> Messages_types.find_node
(** [decode_find_node decoder] decodes a [find_node] value from [decoder] *)

val decode_neighbors : Pbrt.Decoder.t -> Messages_types.neighbors
(** [decode_neighbors decoder] decodes a [neighbors] value from [decoder] *)

val decode_msg : Pbrt.Decoder.t -> Messages_types.msg
(** [decode_msg decoder] decodes a [msg] value from [decoder] *)
