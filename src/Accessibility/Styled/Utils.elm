module Accessibility.Styled.Utils exposing (aria, nonInteractive, role, toBoolString, toListString, toTriStateString)

import Html.Styled as Html
import Html.Styled.Attributes exposing (..)



-- ARIA


aria : String -> String -> Html.Attribute msg
aria =
    attribute << (++) "aria-"



-- WIDGET STATE


toBoolString : Bool -> String
toBoolString bool =
    if bool then
        "true"

    else
        "false"


toTriStateString : Maybe Bool -> String
toTriStateString =
    Maybe.withDefault "mixed" << Maybe.map toBoolString


toListString : List String -> String
toListString =
    String.join " "



-- NEVER-ing


nonInteractive : List (Html.Attribute Never) -> List (Html.Attribute a)
nonInteractive =
    List.map (Html.Styled.Attributes.map Basics.never)



-- ROLE


role : String -> Html.Attribute msg
role role_ =
    attribute "role" role_
