%Esame 01/09/2017
-module(esame01092017).
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
    lists:foreach(fun(L) ->
                          spawn(?MODULE, worker, [self(), L, X])
                  end,
                  LofL),
    get_result(length(LofL)).