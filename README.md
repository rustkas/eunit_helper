# Eunit helper
A collection of helper functions that can be useful when parsing data from various data types of the Erlang standart library.

----------------

An OTP library

Build
-----

    $ rebar3 compile

EUnit
-----

    $ rebar3 eunit -v


EDoc
-----

    $ rebar3 edoc


Publishing on hex.pm
--------------------

hex.pm Publish project
-----
rebar3 hex publish --replace --yes

hex.pm Publish documentation
-----
    $ rebar3 hex docs

Make several commands one by one
-----	
    $ rebar3 do hex cut -i patch, hex publish --yes, hex docs
	


