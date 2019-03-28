(** [heavier_fork f1 f2] is f1 if f1 has a greater total difficulty than f2,
    f2 otherwise.*)
val heavier_fork: Fork.t -> Fork.t -> Fork.t

