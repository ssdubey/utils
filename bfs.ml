let rec process_children children queue visited = 
	match children with
	|[] ->	queue
	|h::t -> 
		(if (List.exists (fun x -> x = h) visited) 
		then 
		(process_children t queue visited) 
		else 
		(Queue.add h queue; 
		process_children t queue visited))


let rec traverse graph queue visited =
	if (Queue.is_empty queue) then
	(
		()
	)else(
		let cur = Queue.pop queue in 
		let visited = cur :: visited in 
		print_int cur;
		let childrenOpt = Hashtbl.find_opt graph cur in 
        match childrenOpt with 
        (*|Some children -> (let queue = process_children children queue visited in
		                    traverse graph queue visited)*)
		|Some children -> 
			(let rec aux children queue visited =
				match children with
				|[] ->	queue
				|h::t -> 
					(if (List.exists (fun x -> x = h) visited) 
					then 
					(aux t queue visited) 
					else 
					(Queue.add h queue; 
					aux t queue visited)) in 

			let queue = aux children queue visited in
			traverse graph queue visited)
		|None -> traverse graph queue visited 
	)


let bfs graph src =
	let visited = [] in 
	let queue = Queue.create() in 
	Queue.add src queue;
	traverse graph queue visited
	
let func =
    let graph = Hashtbl.create 6 in
	Hashtbl.add graph 1 [2;3;4];
	Hashtbl.add graph 2 [5;6];
	bfs graph 1
