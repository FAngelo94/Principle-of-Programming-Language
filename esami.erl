%Esame 01/09/2017
-module(esami).
-compile(export_all).

worker(Dad, List, X) ->
    case lists:member(X, List) of
        true ->  Dad ! {found, List};
        false -> Dad ! nay
    end.
get_result(0) -> false;
get_result(V) -> 
    receive 
        nay -> get_result(V-1);
        {found, L} -> L
    end.
parfind(LofL, X) ->
    lists:foreach(fun(L) -> %lists is the module that contains foreach
                          spawn(?MODULE, worker, [self(), L, X])
                  end,
                  LofL),
    get_result(length(LofL)).
	
	
%Esame 20/07/2017
cell(Value) ->
    receive
        {set, V} ->
            cell(V);
        {get, Pid} ->
            Pid ! Value,
            cell(Value)
    end.
	
delement_get(Element) ->
    Element ! {get, self()},
    receive
        V -> V
    end.
delement_set(Element, New) ->
    Element ! {set, New}.

create_dlist(0) -> [];
create_dlist(Size) -> [spawn(?MODULE, cell, [0]) | create_dlist(Size-1)].

dlist_map([], _) -> ok;
dlist_map([X|Xs], Fun) ->
    delement_set(X, Fun(delement_get(X))),
    dlist_map(Xs, Fun).