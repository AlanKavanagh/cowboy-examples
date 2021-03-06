-module(static_handler).
-export([init/3, handle/2, terminate/2]).

init({tcp, http}, Req, _Opts) ->
    {ok, Req, undefined_state}.

handle(Req, State) ->
    {ok, Reply} = cowboy_http_req:reply(
        200,
        [],
        <<"
            <html>
                A static (awesome) image: <img src='/static_resource/cowboy.jpg'/>
            </html>
        ">>, 
        Req
    ),
    {ok, Reply, State}.

terminate(_Req, _State) ->
    ok.
