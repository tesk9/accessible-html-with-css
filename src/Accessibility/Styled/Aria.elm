module Accessibility.Styled.Aria exposing
    ( activeDescendant, controls
    , longDescription, details, describedBy, labelledBy, labeledBy
    , keyShortcuts, roleDescription
    , flowTo
    , placeholder
    , colCount, colIndex, colSpan, rowCount, rowIndex, rowSpan
    , setSize, posInSet
    , currentItem, currentPage, currentStep, currentLocation, currentDate, currentTime
    , errorMessage
    )

{-| Learn more about about W3C's Web Accessibility Initiative's Accessible Rich Internet Applications standards ("WAI-ARIA") at [w3.org](https://www.w3.org/WAI/standards-guidelines/aria/).

Please keep in mind that ARIA attributes are best used sparingly -- your users are better off with semantic HTML than they are with divs with many ARIA attributes. See [No ARIA is better than BAD ARIA](https://www.w3.org/TR/wai-aria-practices-1.1/#no_aria_better_bad_aria) from the WAI-ARIA Authoring Practices guide.

@docs activeDescendant, controls


### Providing More Info

  - Learn the challenges non-text content can cause your users in [Understanding Success Criterion 1.1.1: Non-text Content](https://www.w3.org/WAI/WCAG21/Understanding/non-text-content.html)
  - Learn how to define relationships between elements in [Understanding Success Criterion 1.3.1: Info and Relationships](https://www.w3.org/WAI/WCAG21/Understanding/info-and-relationships)
  - Learn how a user agent will determine the accessible name and description of an element in [Accessible Name and Description Computation 1.1](https://www.w3.org/TR/accname-1.1/)

@docs longDescription, details, describedBy, labelledBy, labeledBy
@docs keyShortcuts, roleDescription

Looking for aria-label? Please see `label` in `Accessibility.Styled.Widget`.


### Navigation and Flow

  - Audio-users experience all content linearly, since a screenreader will only read one word at a time. Learn about ordering content effectively with this constraint in mind in [Understanding Success Criterion 1.3.2: Meaningful Sequence](https://www.w3.org/WAI/WCAG21/Understanding/meaningful-sequence)
  - Now that your content is ordered, consider how much of it, like the content in the header) is annoying to hear over & over again as you switch between pages! Learn about how skip links and landmarks can make your site more usable in [Understanding Success Criterion 2.4.1: Bypass Blocks](https://www.w3.org/WAI/WCAG21/Understanding/bypass-blocks)

@docs flowTo

Looking for tab order? Please see `tabbable` in `Accessibility.Styled.Key`.

Please also remember to use a descriptive title for your pages ([Understanding Success Criterion 2.4.2: Page Titled](https://www.w3.org/WAI/WCAG21/Understanding/page-titled)). Note that you'll only use Elm to set the page title if you're using [`Browser.document`](https://package.elm-lang.org/packages/elm/browser/latest/Browser#document) to start your Elm app.


### Textbox Related

@docs placeholder


### Table Related

@docs colCount, colIndex, colSpan, rowCount, rowIndex, rowSpan


### Set Related

@docs setSize, posInSet


### Current

@docs currentItem, currentPage, currentStep, currentLocation, currentDate, currentTime

@docs errorMessage

-}

import Accessibility.Styled.Utils exposing (..)
import Html.Styled as Html
import Html.Styled.Attributes exposing (..)


{-| Convenience alias for `labelledBy`.
-}
labeledBy : String -> Html.Attribute msg
labeledBy =
    labelledBy


{-| Creates an [`aria-labelledby`](https://www.w3.org/TR/wai-aria-1.1/#aria-labelledby) attribute.

Pass the unique string id of the labelling element. Only use this property if the label is _visible_ (if the label is _not_ visible, prefer `Accessibility.Styled.Widget.label`).

-}
labelledBy : String -> Html.Attribute msg
labelledBy =
    attribute "aria-labelledby"


{-| Creates the longDesc attribute with the given url, which should point to a text description of the content. This attribute is only supported on img tags.

    import Accessibility exposing (Html, img)
    import Accessibility.Aria exposing (longDescription)

    view : Html msg
    view =
        img
            "Growth Chart in Some Sweet Unit (Quarter 4)"
            [ longDescription "/quarter_4_summary#Growth" ]

Note that this is a deprecated HTML property, not an ARIA property. See [MDN documentation on HTMLImageElement.longDesc
](https://developer.mozilla.org/en-US/docs/Web/API/HTMLImageElement/longDesc) for general documentation and [Using longdesc (Technique H45)](https://www.w3.org/WAI/WCAG21/Techniques/html/H45) for accessibility documentation.

-}
longDescription : String -> Html.Attribute msg
longDescription =
    attribute "longdesc"


{-| Supported in container-y roles: `application`, `composite`, `group`, `textbox`,
`comboBox`, `grid`, `listBox`, `menu`, `menuBar`, `radioGroup`, `row`, `searchBox`,
`select`, `spinButton`, `tabList`, `toolBar`, `tree`, and `treeGrid`.

Identifies the currently-active element.

-}
activeDescendant : String -> Html.Attribute msg
activeDescendant =
    aria "activedescendant"


{-| Supported by `table`, `grid`, `treegrid`.

Declares the number of columns in a grid in which not all of the columns are
displayed. (If all columns are present--skip using this.)

`-1` indicates total column number is unknown.

-}
colCount : Int -> Html.Attribute msg
colCount =
    aria "colcount" << String.fromInt


{-| Supported by `cell`, `row`, `columnHeader`, `gridCell`, and `rowHeader`.

Indexing begins from 1, NOT 0. Plus, the colIndex should not be greater than the `colCount`!
If a cell stretches across multiple columns, use the starting column index and `colSpan`.

The simplest rule is to put the `colIndex` on every child of a `row`.

-}
colIndex : Int -> Html.Attribute msg
colIndex =
    aria "colindex" << String.fromInt


{-| Supported by `cell`, `columnHeader`, `gridCell`, and `rowHeader`.

Indicate how many columns-wide a cell is.

-}
colSpan : Int -> Html.Attribute msg
colSpan =
    aria "colspan" << String.fromInt


{-| Supported by `table`, `grid`, `treegrid`.

Declares the number of rows in a grid in which not all of the rows are
displayed. (If all rows are present--skip using this.)

`-1` indicates total row number is unknown.

-}
rowCount : Int -> Html.Attribute msg
rowCount =
    aria "rowcount" << String.fromInt


{-| Supported by `cell`, `row`, `columnHeader`, `gridCell`, and `rowHeader`.

Analagous to `colIndex`.

-}
rowIndex : Int -> Html.Attribute msg
rowIndex =
    aria "rowindex" << String.fromInt


{-| Supported by `cell`, `columnHeader`, `gridCell`, and `rowHeader`.

Indicate how many rows-wide a cell is.

-}
rowSpan : Int -> Html.Attribute msg
rowSpan =
    aria "rowspan" << String.fromInt


{-| Supported by list-y elements: `article`, `listItem`, `menuItem`, `option`,
`radio`, `tab`, `menuitemcheckbox`, `menuitemradio`, and `treeItem`.

Only necessary when not all of the items in the set are in the DOM. Use with `setSize`.

-}
posInSet : Int -> Html.Attribute msg
posInSet =
    aria "posinset" << String.fromInt


{-| Supported by list-y elements: `article`, `listItem`, `menuItem`, `option`,
`radio`, `tab`, `menuitemcheckbox`, `menuitemradio`, and `treeItem`.

`setSize` indicates the total number of items in a set where not all the items are
currently present in the DOM.

-}
setSize : Int -> Html.Attribute msg
setSize =
    aria "setsize" << String.fromInt


{-| Creates aria controls attribute. Pass the unique string id of whatever is being controlled.
-}
controls : String -> Html.Attribute msg
controls =
    aria "controls"


{-| Supported by all elements.

Indicate that a link in a nav or list is the current location.

-}
currentPage : Html.Attribute msg
currentPage =
    aria "current" "page"


{-| Supported by all elements.

Indicate which step in a step-based flow is the current one.

-}
currentStep : Html.Attribute msg
currentStep =
    aria "current" "step"


{-| Supported by all elements.
-}
currentLocation : Html.Attribute msg
currentLocation =
    aria "current" "location"


{-| Supported by all elements.

As in a calendar widget.

-}
currentDate : Html.Attribute msg
currentDate =
    aria "current" "date"


{-| Supported by all elements.

As in a timepicker widget.

-}
currentTime : Html.Attribute msg
currentTime =
    aria "current" "time"


{-| Supported by all elements.
-}
currentItem : Bool -> Html.Attribute msg
currentItem =
    aria "current" << toBoolString


{-| Supported by all elements. Pass it a list of ids of elements that describe the given element.

Pass in ids of elements that describe the current element to create an [aria-describedby association](https://www.w3.org/TR/wai-aria-1.1/#aria-describedby).

You may wish to review the documentation for `labelledBy` and `details` as well -- which property you should use will depend on your specific UX requirements.

-}
describedBy : List String -> Html.Attribute msg
describedBy =
    aria "describedby" << toListString


{-| Supported by all elements.

Refer to a single extended description section--maybe a couple of paragraphs
and a chart. Pass in the HTML id of an element with details about the current element to create an [aria-details association](https://www.w3.org/TR/wai-aria-1.1/#aria-details).

-}
details : String -> Html.Attribute msg
details =
    aria "details"


{-| Supported by all elements.

Reference the element that has error details. e.g., if you've got an input field
that's invalid, add `errorMessage` to the input with the id of whatever element
is telling the user in what way their submission is wrong.

    input [ invalid True, errorMessage "error-message-id" ] []

-}
errorMessage : String -> Html.Attribute msg
errorMessage =
    aria "errormessage"


{-| Creates an [`aria-flowto`](https://www.w3.org/TR/wai-aria-1.1/#aria-flowto) attribute.

Provide an alternative document reading order and offer navigation to the
elements referenced in the passed-in list of ids.

Supported by all elements.

-}
flowTo : List String -> Html.Attribute msg
flowTo =
    aria "flowto" << toListString


{-| Supported by all elements. Pass in a list of keyboard shortcuts to use the [ aria-keyshortcuts property](https://www.w3.org/TR/wai-aria-1.1/#aria-keyshortcuts).

    keyShortcuts [ "Alt+Shift+P", "Control+F" ]

Note that this property only indicates to users that certain keyboard shortcuts _exist_ -- this property does not change the behavior of the element to which it is attached. Please also note that it's nice to make the existence of keyboard shortcuts known to all users, not only to screenreader users!

Learn more about the purpose of from The WAI-ARIA Authoring Practices guide's [Keyboard Shortcuts](https://www.w3.org/TR/wai-aria-practices-1.1/#kbd_shortcuts) section.

Please be aware that providing single-character keyboard shortcuts may make using your site _less_ accessible for some users. Read [Understanding Success Criterion 2.1.4: Character Key Shortcuts](https://www.w3.org/WAI/WCAG21/Understanding/character-key-shortcuts) to learn more.

-}
keyShortcuts : List String -> Html.Attribute msg
keyShortcuts =
    aria "keyshortcuts" << toListString


{-| Supported by `textbox` and `searchbox`.

Provide a hint about an expected value.

Creates an [aria-placeholder](https://www.w3.org/TR/wai-aria-1.1/#aria-placeholder) property.

Generally, you should use `Html.Styled.Attributes.placeholder` instead of using `aria-placeholder`. The only time that you should add an `aria-placeholder` attribute is if you're rolling your own widget that's required you to explicitly set a wai-aria role. See some guidance around "implicit" aria semantics [here](https://www.w3.org/TR/html-aria/).

-}
placeholder : String -> Html.Attribute msg
placeholder =
    aria "placeholder"


{-| Supported by all elements.

Provide human-readable description of the role of an element. Should be used
alongside an actual role--this is supplementary information.

Creates an [aria-roledescription property](https://www.w3.org/TR/wai-aria-1.1/#aria-roledescription).

-}
roleDescription : String -> Html.Attribute msg
roleDescription =
    aria "roledescription"
