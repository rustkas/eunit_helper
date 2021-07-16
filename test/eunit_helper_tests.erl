-module(eunit_helper_tests).

%%
%% Tests
%%
-ifdef(TEST).

-include_lib("eunit/include/eunit.hrl").

-import(eunit_helper, [check_all_by_regex/3]).

get_valid_character_list() ->
    ValidCharacterList =
        lists:seq(65, 90)
        ++ [97, 122]
        ++ [170, 181, 186]
        ++ lists:seq(192, 214)
        ++ lists:seq(216, 246)
        ++ lists:seq(248, 255),
    ValidCharacterList.

check_all_by_regex_01_test() ->
    Expected = true,
    ValidCharacterList = get_valid_character_list(),
    RegularExpression = "[[:alpha:]]",
    {ok, MP} = re:compile(RegularExpression),
    Result = check_all_by_regex(MP, ValidCharacterList, true),
    ?assertEqual(Expected, Result).

check_all_by_regex_02_test() ->
    Expected = true,
    ValidCharacterList = get_valid_character_list(),
    RegularExpression = "[[:^alpha:]]",
    {ok, MP} = re:compile(RegularExpression),
    Result = Result = check_all_by_regex(MP, ValidCharacterList, false),
    ?assertEqual(Expected, Result).

-endif.
