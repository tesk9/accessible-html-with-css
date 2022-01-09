module Accessibility.Styled.Style exposing (invisibleStyle, invisible)

{-|


## Focus rings

Please be aware that hiding a user's focus can make your site completely unusable for them. Learn more about focus ring styling options in [Understanding Success Criterion 2.4.7: Focus Visible](https://www.w3.org/WAI/WCAG21/Understanding/focus-visible).


## Hiding content

For more information on hiding/semi-hiding elements, please see [the a11y project.](http://a11yproject.com/posts/how-to-hide-content/)

@docs invisibleStyle, invisible

-}

import Css exposing (Style)
import Html.Styled as Html
import Html.Styled.Attributes


{-| Makes content invisible without making it inaccessible.

    label [ css invisibleStyle ] [ text "Screen readers can still read me!" ]

-}
invisibleStyle : Style
invisibleStyle =
    Css.batch
        [ Css.property "clip" "rect(1px, 1px, 1px, 1px)"
        , Css.position Css.absolute
        , Css.height (Css.px 1)
        , Css.width (Css.px 1)
        , Css.overflow Css.hidden
        , Css.margin (Css.px -1)
        , Css.padding Css.zero
        , Css.border Css.zero
        ]


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
