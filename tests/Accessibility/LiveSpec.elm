module Accessibility.LiveSpec exposing (spec)

import Accessibility.Styled.Live exposing (..)
import SpecHelpers exposing (..)
import Test exposing (..)


spec : Test
spec =
    describe "Accessibility.Aria"
        [ describe "atomic" <|
            expectAriaBoolAttribute atomic "atomic"
        , describe "busy" <|
            expectAriaBoolAttribute busy "busy"
        , test "polite" <|
            expectAria ( \() -> polite, () ) ( "live", "polite" )
        , test "assertive" <|
            expectAria ( \() -> assertive, () ) ( "live", "assertive" )
        , test "off" <|
            expectAria ( \() -> off, () ) ( "live", "off" )
        , test "relevantAdditions" <|
            expectAria ( \() -> relevantAdditions, () ) ( "relevant", "additions" )
        , test "relevantAdditionsText" <|
            expectAria ( \() -> relevantAdditionsText, () ) ( "relevant", "additions text" )
        , test "relevantAll" <|
            expectAria ( \() -> relevantAll, () ) ( "relevant", "all" )
        , test "relevantRemovals" <|
            expectAria ( \() -> relevantRemovals, () ) ( "relevant", "removals" )
        , test "relevantText" <|
            expectAria ( \() -> relevantText, () ) ( "relevant", "text" )
        ]
