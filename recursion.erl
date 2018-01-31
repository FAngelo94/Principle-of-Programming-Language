%recursion
-module(recursion).
-compile(export_all).

fac(N) when N == 0 -> 1;
fac(N) when N > 0  -> N*fac(N-1).

fibonacci (N) ->
	if  N == 0 	-> 0;
		N == 1 	-> 1;
		true 	-> fibonacci(N-1) + fibonacci(N-2)
	end.

%% find the maximum of a list
max([H|T]) -> max2(T, H).
 
max2([], Max) -> Max;
max2([H|T], Max) when H > Max -> max2(T, H);
max2([_|T], Max) -> max2(T, Max).