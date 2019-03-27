module type Hashable = sig
  type t

  (* [hash t] is the hash of [t]. *) 
  val hash : t -> string

  (* [serialize t] is a serialized representation of [t]. *)
  val serialize : t -> string

  (* [deserialize s] is the instance of this data structure obtained by
   * deserializing [s]. Throws an exception if there is no such structure. *)
  val deserialize : string -> t

end

module type S = sig
  (* [t] is the type representaing a database. *)
  type t

  (* A hashable value for use in the database. *)
  type value

  (* [put t b] takes in a database [t] and a value [b], and writes the block to
   * the database. *)
  val put : t -> value -> unit Lwt.t

  (* [get t s] takes in a database [t] and the SHA-256 hash [s] of an value, and
   * returns the value with that hash. Throws an exception if the value isn't
   * present. *)
  val get : t -> string -> value Lwt.t

  (* [get t s] takes in a database [t] and the SHA-256 hash [s] of a value,
   * returns the an option for value with that hash. *)
  val get_opt : t -> string -> value option Lwt.t
      
  (* [create s] makes an object representing the database from the location of the
   * database [s]. *)
  val create : string -> t

  (* [mem t s] is true if the value with SHA-256 [s] is in the database [t], and
   * false otherwise. *)
  val mem : t -> string -> bool Lwt.t

  (* [remove t s] removes the value with hash [s] from the database [t]. *)
  val remove : t -> string -> unit Lwt.t

end

(* Make a database module with values of type [Value]. *)
module Make(Value : Hashable) : S with type value = Value.t