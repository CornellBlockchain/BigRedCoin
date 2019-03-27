module type Hashable = sig
  type t

  val hash : t -> string

  val serialize : t -> string

  val deserialize : string -> t
end 
module type S = sig

  type t

  type value

  val put : t -> value -> unit Lwt.t

  val get : t -> string -> value Lwt.t

  val get_opt : t -> string -> value option Lwt.t 

  val create : string -> t

  val mem : t -> string -> bool Lwt.t 

  val remove : t -> string -> unit Lwt.t

end 
module Make(Value : Hashable) = struct

  type t = LevelDB.db * Lwt_mutex.t ref
  type value = Value.t

  let create dir = LevelDB.open_db dir, ref (Lwt_mutex.create ())

  let put (db, mutex) v = 
    Lwt_mutex.with_lock !mutex (fun () -> 
      let f (db, v) = LevelDB.put db (Value.hash v) (Value.serialize v) in
      Lwt_preemptive.detach f (db, v)
    )

  let get (db, mutex) v = 
    Lwt_mutex.with_lock !mutex (fun () ->
      let f (db, v) = Value.deserialize (LevelDB.get_exn db v) in
      Lwt_preemptive.detach f (db, v)
    )

  let get_opt (db, mutex) v = 
    Lwt_mutex.with_lock !mutex (fun () ->
      let f (db, v) =
        match LevelDB.get db v with 
        | None -> None
        | Some s -> Some (Value.deserialize s) in
      Lwt_preemptive.detach f (db, v)
    )

  let mem (db, mutex) v = 
    Lwt_mutex.with_lock !mutex (fun () ->
      let f (db, v) = LevelDB.mem db v in
      Lwt_preemptive.detach f (db, v)
    )

  let remove (db, mutex) v =
    Lwt_mutex.with_lock !mutex (fun () ->
      let f (db, v) = LevelDB.delete db v in
      Lwt_preemptive.detach f (db, v)
    )

end