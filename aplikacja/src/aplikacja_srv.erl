-module(aplikacja_srv).
-behaviour(gen_server).

-export([start_link/0]).

-export([init/1, handle_call/3, handle_cast/2, service/3]).

start_link() ->
    gen_server:start_link({local, ?MODULE}, ?MODULE, [], []).

init([]) ->
    io:format("Started"),
    {ok, started}.

%handle_call(Args, From, OldState) -> 
%    io:format("A:~p~n:B~p~n:C~p~n",[Args, From, OldState]),
%     io:format("Received call"),
%     if                                                          nie rozumiem jak te ify dzialaja
%         (lists:nth(3, Args)=='+') ->
%             {reply, lists:nth(1, Args)+lists:nth(2, Args)};
%         (lists:nth(3, Args)=='-') ->
%             {reply, lists:nth(1, Args)-lists:nth(2, Args)};
%         (lists:nth(3, Args)=='*') ->
%             {reply, lists:nth(1, Args)*lists:nth(2, Args)};
%         (lists:nth(3, Args)=='/') ->
%             {reply, lists:nth(1, Args)/lists:nth(2, Args)};
%         true ->
%             {reply, error}
%         end.

handle_call(Args, From, OldState) ->
    io:format("A:~p~n:B~p~n:C~p~n",[Args, From, OldState]),
    io:format("Received call"),
    {reply, a(lists:nth(1, Args), lists:nth(3, Args), lists:nth(2, Args)), ok}.
a(A, B, '+') ->
    A + B;
a(A, B, '-') ->
    A - B;
a(A, B, '*') ->
    A * B;
a(A, B, '/') ->
    A / B. %nie rozumiem ifow i nie pamietam gdzie w funkcji taki warunek moge wstawic

handle_cast(Args, B) ->
    io:format("error"),
    {noreply, ok}.

service() ->
    gen_server:call(?MODULE, [argument]).

service(N1, O, N2)->
    gen_server:call(?MODULE, [N1, O, N2]).