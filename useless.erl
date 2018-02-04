-module(useless).
-compile(export_all).
%-export([add/2, hello/0, greet_and_add_two/1]). 
add(A,B) ->
A + B.
 
%% Shows greetings.
%% io:format/1 is the standard function used to output text.
hello() ->
io:format("Hello, world!~n").
 
greet_and_add_two(X) ->
hello(),
add(X,2).

greet(male, Name) ->
io:format("Hello, Mr. ~s!", [Name]);
greet(female, Name) ->
io:format("Hello, Mrs. ~s!", [Name]);
greet(_, Name) ->
io:format("Hello, ~s!", [Name]).

%FUNCTION
same(X,X) ->
true;
same(_,_) ->
false.
%guards
minorenne(X) when X =< 17, X>0 ->
	minorenne; %if I remove next sentences "minorenne(19)" will gi me exception
minorenne(X) when X >17, X<100 ->
	maggiorenne;
minorenne(_)->
	errore.
%if
heh_fine() ->
	if 1 =:= 1 ->
		works
	end,
	if 1 =:= 2; 1 =:= 1 ->
		works
	end,
	if 1 =:= 2, 1 =:= 1 ->
		fails
	end.

oh_god(N) ->
	if N =:= 2 -> might_succeed;
		true -> always_does  %% this is Erlang's if's 'else!'
	end.
	
help_me(Animal) ->
	Talk = if 	Animal == cat  -> "meow";
				Animal == beef -> "mooo";
				Animal == dog  -> "bark";
				Animal == tree -> "bark";
				true -> "fgdadfgna"
			end,
	{Animal, "says " ++ Talk ++ "!"}.
%case of
beach(Temperature) ->
	case Temperature of
		{celsius, N} when N >= 20, N =< 45 ->
			'favorable';
		{kelvin, N} when N >= 293, N =< 318 ->
			'scientifically favorable';
		{fahrenheit, N} when N >= 68, N =< 113 ->
			'favorable in the US';
		_ ->
			'avoid beach'
	end.
	
	
%%messages
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
	
send(Message) ->
	self() ! {messaggio, Message},
	io:format("spedito").

get_message() ->
	io:format("Boh"),
	receive
		{messaggio, M} -> io:format(M)
	end.

%%spawn
send2(Dad,Message) ->
	Dad ! {messaggio, Message},
	io:format("spedito").
get_message2() ->
	io:format("Boh"),
	receive
		{messaggio, M} -> M
	end.
father(N) ->
	spawn(?MODULE, send2, [self(),N]),
	get_message2().
	
son(0) -> io:format("Minore di 0");
son(N) -> io:format("Maggiore di 0").
