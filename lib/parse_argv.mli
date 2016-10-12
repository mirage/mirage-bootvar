type error = [ `Msg of string ]
val parse : string -> (string list, error) result
