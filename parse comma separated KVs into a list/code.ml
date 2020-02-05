(*split on comma and store in list*)
let rec func kvlist line_sep =
let kvpairlist = (match line_sep with
| p::p_lst -> (let pair = String.split_on_char(',') p in
        let a = (match pair with | k::v::[] -> (k,v) | _ -> ("","")) in
          func (a::kvlist) p_lst)
| _ -> kvlist) in
(* print_string ("\nkvpairlist length in rec func: " ); print_int (List.length kvpairlist); *)
kvpairlist


(*first split on \n then split on , and store in list*)
let benchmark inputbuf =
  let line_sep = String.split_on_char('\n') inputbuf in
  print_string ("\nno. of entries: " ); print_int (List.length line_sep);
  let kvpairlist = func [] line_sep in			(*func can be renamed to helper*)
  kvpairlist

(* let rec fprint kvpairlist = 
match kvpairlist with
|h::t -> let k, v = h in
        print_string ("\nkey =" ^ k); print_string ("value =" ^ v) ;
        fprint t
| _ -> () *)

let readfile fileloc = 
let buf = Buffer.create 4096 in
try
    while true do
      let line = input_line fileloc in
      Buffer.add_string buf line;
      Buffer.add_char buf '\n'
    done;
    assert false (* This is never executed
                    (always raise Assert_failure). *)
  with
    End_of_file -> Buffer.contents buf

(* starting function *)
(*path is the path to file which contains input data as key and value separated by rows (see below)*)
let kvpairfun path = 
  let contentbuf = readfile (open_in path) in 
  let kvpairlist = benchmark contentbuf in
(* print_string ("\nkvpairlist length in main:" );print_int (List.length kvpairlist);
fprint kvpairlist *)
kvpairlist


(*sample input:
k1,v1
k2,v2
k3,v3

sample output:
[(k1,v1),(k2,v2),(k3,v3)]

use Unix.gettimeofday() to get time in ms
*)

