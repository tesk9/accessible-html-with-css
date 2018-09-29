module Accessibility.Styled.Style exposing (invisible)

{-|


## Hiding content

For more information on hiding/semi-hiding elements, please see [the a11y project.](http://a11yproject.com/posts/how-to-hide-content/)

@docs invisible

-}

import Html.Styled as Html
import Html.Styled.Attributes


{-| Makes content invisible without making it inaccessible.

    label invisible [ text "Screen readers can still read me!" ]

-}
invisible : List (Html.Attribute msg)
invisible =
    [ Html.Styled.Attributes.style "property" "clip rect(1px, 1px, 1px, 1px)"
    , Html.Styled.Attributes.style "position" "absolute"
    , Html.Styled.Attributes.style "height" "1px"
    , Html.Styled.Attributes.style "width" "1px"
    , Html.Styled.Attributes.style "overflow" "hidden"
    , Html.Styled.Attributes.style "margin" "-1px"
    , Html.Styled.Attributes.style "padding" "0"
    , Html.Styled.Attributes.style "border" "0"
    ]
