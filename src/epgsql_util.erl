%%%-------------------------------------------------------------------
%%% @author maxvel <maxvel@maxvel-ubuntu>
%%% @copyright (C) 2015, maxvel
%%% @doc
%%%
%%% @end
%%% Created : 29 Sep 2015 by maxvel <maxvel@maxvel-ubuntu>
%%%-------------------------------------------------------------------
-module(epgsql_util).

-behaviour(gen_server).

%% API
-export([start_link/1]).

%% gen_server callbacks
-export([init/1, handle_call/3, handle_cast/2, handle_info/2,
         terminate/2, code_change/3]).

-define(SERVER, ?MODULE).

-record(state, {}).

%%%===================================================================
%%% API
%%%===================================================================

start_link(Tabname) when is_atom(Tabname) ->
    gen_server:start_link({local, ?SERVER}, ?MODULE, [Tabname], []).

%%%===================================================================
%%% gen_server callbacks
%%%===================================================================

init([Tabname]) ->
    ets:new(Tabname, [public, named_table]),
    {ok, #state{}, hibernate}.

handle_call(_Request, _From, State) ->
    Reply = ok,
    {reply, Reply, State}.

handle_cast(_Msg, State) ->
    {noreply, State}.

handle_info(_Info, State) ->
    {noreply, State}.

terminate(_Reason, _State) ->
    ok.

code_change(_OldVsn, State, _Extra) ->
    {ok, State}.

%%%===================================================================
%%% Internal functions
%%%===================================================================
