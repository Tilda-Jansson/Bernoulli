%% erl
%% c(bernoulli).
%% bernoulli:main().

-module(bernoulli).

-export([main/0,loop/4, binom/2, bernoulli/0]).

% bernoulli function calculates and prints a list with the 20 first bernoulli numbers
bernoulli() ->
    M = lists:seq(2,20),
    Dict = dict:new(),
    Dict_B = dict:store(1,1,Dict), % accumulating the list B

    Dict_B_complete = lists:foldl(fun(M_counter,Acc_B)->
                            Value = lists:foldl(
                                   fun(K,Bm)-> 
                                       Bm - binom(M_counter, K-1) * dict:fetch(K,Acc_B) end, %B[m] <-- B[m] − BINOM (m, k-1) * B[k]
                                   0, %Bm
                                   lists:seq(1,M_counter-1)), % for k ← 1 to m −1 do (K)
                            dict:store(M_counter,Value/M_counter,Acc_B) %index, value, B
                        end,
                        Dict_B, %Acc_b
                        M % for m <-- 2 to 20 do (M_counter)
                        ),

    io:format("~p",[lists:sort(dict:to_list(Dict_B_complete))]).


% binom calculates the binomial coefficient
binom(N, K) ->
    R = 1,
    I = 1,
    K1 = K + 1,
    R_new = loop(K1, I, R, N),
    R_new.

% Helper function to the binom function
loop(I, I, R, _) ->
    R;
loop(K, I, R, N) ->
    R_new = (R *(N - I + 1))/I,
    loop(K, I+1, R_new, N).

main() -> 
   bernoulli().


