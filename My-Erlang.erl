-module(useless).
-export([add/2, hello/0, greet_and_add_two/1]).
 
add(A,B) ->
A + B.
 
%% Shows greetings.
%% io:format/1 is the standard function used to output text.
hello() ->
io:format("Hello, world!~n").
 
greet_and_add_two(X) ->
hello(),
add(X,2).

%% messages
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