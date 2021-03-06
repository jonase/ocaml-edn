let parse lexbuf =
  Edn_parser.prog Read.read lexbuf |> function
  | Some v -> v
  | None -> raise End_of_file

let from_string s =
  parse (Lexing.from_string s)

let from_channel ch =
  parse (Lexing.from_channel ch)

let stream_from_channel ch =
  let lexbuf = Lexing.from_channel ch in
  let f _ = Edn_parser.prog Read.read lexbuf in
  Stream.from f
