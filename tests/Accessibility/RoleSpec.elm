module Accessibility.RoleSpec exposing (spec)

import Accessibility.Styled as Html
import Accessibility.Styled.Role exposing (..)
import Html.Attributes
import Html.Styled exposing (toUnstyled)
import Json.Encode
import Test exposing (..)
import Test.Html.Query as Query
import Test.Html.Selector as Selector


spec : Test
spec =
    describe "Accessibility.Role" <|
        List.map (\( a, b ) -> addsRole a b)
            [ ( alert, "alert" )
            , ( alertDialog, "alertdialog" )
            , ( application, "application" )
            , ( article, "article" )
            , ( button, "button" )
            , ( checkBox, "checkbox" )
            , ( columnHeader, "columnheader" )
            , ( comboBox, "combobox" )
            , ( comment, "comment" )
            , ( definition, "definition" )
            , ( dialog, "dialog" )
            , ( directory, "directory" )
            , ( document, "document" )
            , ( grid, "grid" )
            , ( gridCell, "gridcell" )
            , ( group, "group" )
            , ( heading, "heading" )
            , ( img, "img" )
            , ( link, "link" )
            , ( list, "list" )
            , ( listBox, "listbox" )
            , ( listItem, "listitem" )
            , ( log, "log" )
            , ( marquee, "marquee" )
            , ( math, "math" )
            , ( menu, "menu" )
            , ( menuBar, "menubar" )
            , ( menuItem, "menuitem" )
            , ( menuItemCheckBox, "menuitemcheckbox" )
            , ( menuItemRadio, "menuitemradio" )
            , ( note, "note" )
            , ( mark, "mark" )
            , ( option, "option" )
            , ( presentation, "presentation" )
            , ( progressBar, "progressbar" )
            , ( radio, "radio" )
            , ( radioGroup, "radiogroup" )
            , ( row, "row" )
            , ( rowGroup, "rowgroup" )
            , ( rowHeader, "rowheader" )
            , ( scrollBar, "scrollbar" )
            , ( separator, "separator" )
            , ( slider, "slider" )
            , ( spinButton, "spinbutton" )
            , ( status, "status" )
            , ( suggestion, "suggestion" )
            , ( switch, "switch" )
            , ( tab, "tab" )
            , ( tabList, "tablist" )
            , ( tabPanel, "tabpanel" )
            , ( textBox, "textbox" )
            , ( timer, "timer" )
            , ( toolBar, "toolbar" )
            , ( toolTip, "tooltip" )
            , ( tree, "tree" )
            , ( treeGrid, "treegrid" )
            , ( treeItem, "treeitem" )
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
