module Accessibility.LandmarkSpec exposing (spec)

import Accessibility.Styled as Html
import Accessibility.Styled.Landmark exposing (..)
import Html.Attributes
import Html.Styled exposing (toUnstyled)
import Json.Encode
import Test exposing (..)
import Test.Html.Query as Query
import Test.Html.Selector as Selector


spec : Test
spec =
    describe "Accessibility.Landmark" <|
        List.map (\( a, b ) -> addsRole a b)
            [ ( banner, "banner" )
            , ( complementary, "complementary" )
            , ( contentInfo, "contentinfo" )
            , ( form, "form" )
            , ( main_, "main" )
            , ( navigation, "navigation" )
            , ( region, "region" )
            , ( search, "search" )
            ]


addsRole : Html.Attribute Never -> String -> Test
addsRole role_ expected =
    test ("sets the role attribute: " ++ expected) <|
        \() ->
            Html.div [] [ Html.div [ role_ ] [] ]
                |> toUnstyled
                |> Query.fromHtml
                |> Query.has
                    [ Selector.attribute <|
                        Html.Attributes.property "role" (Json.Encode.string expected)
                    ]
