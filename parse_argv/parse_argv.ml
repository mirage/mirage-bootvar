(*
 * Copyright (c) mirage-bootvar AUTHORS
 *
 * Permission to use, copy, modify, and distribute this software for any
 * purpose with or without fee is hereby granted, provided that the above
 * copyright notice and this permission notice appear in all copies.
 *
 * THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
 * WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
 * ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
 * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
 * ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
 * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
 *
 *)

(* Split string into whitespace-separated substrings,
   taking into account quoting *)

type state = Quoted_escaped | Quoted | Escaped | Normal

let chars_to_str = function
  | [] -> []
  | chars ->
      let chars = List.rev chars in
      [ String.init (List.length chars) (List.nth chars) ]

let parse s =
  let l = String.length s in
  let rec loop acc curr state idx =
    if idx = l then
      if state = Normal then Ok (List.rev (chars_to_str curr @ acc))
      else Error "bad input line - either escaped or quoted or both"
    else
      match (state, String.unsafe_get s idx) with
      | Normal, ' ' -> loop (chars_to_str curr @ acc) [] state (idx + 1)
      | Escaped, c -> loop acc (c :: curr) Normal (idx + 1)
      | Quoted_escaped, c -> loop acc (c :: curr) Quoted (idx + 1)
      | Quoted, '\\' -> loop acc curr Quoted_escaped (idx + 1)
      | Quoted, '"' -> loop acc curr Normal (idx + 1)
      | Quoted, c -> loop acc (c :: curr) Quoted (idx + 1)
      | Normal, '\\' -> loop acc curr Escaped (idx + 1)
      | Normal, '"' -> loop acc curr Quoted (idx + 1)
      | Normal, c -> loop acc (c :: curr) Normal (idx + 1)
  in
  loop [] [] Normal 0
