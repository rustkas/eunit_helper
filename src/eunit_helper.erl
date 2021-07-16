%% @author Anatolii Kosorukov <java1cprog@yandex.ru> [rustkas.github.io/]
%% @copyright 2021 by Anatolii Kosorukov
%% @doc Helper functions for eunit testing.
-module(eunit_helper).

-export([check_all_by_regex/3]).

%% @doc Checks whether string's elements match regular expression.
%% <br/>
%% <b>See also:</b> 
%% [http://erlang.org/doc/man/re.html#run-2 re:run/2].
%% 
%% @param MP input string
%% @param CharacterList input string
%% @param checkFirst Logic switch. It determines whether 
%% the desired solution is a match or a nomatch when the regex is executed.
%% @returns Returns true if all elements of CharacterList meet the criteria 
%% for regular expression and logical switch `checkFirst`.
-spec check_all_by_regex(MP,CharacterList,CheckFirst) -> Result when
MP :: {re_pattern, term(), term(), term(), term()},
CharacterList :: string(),
CheckFirst :: boolean(),
Result :: boolean().

check_all_by_regex(MP,CharacterList,CheckFirst)->
Result = lists:all(fun(Elem)->
                         case re:run([Elem], MP) of
                             {match, _} ->
                                 CheckFirst;
                             nomatch ->
                                 not CheckFirst
						end		 
	end, CharacterList),
Result.