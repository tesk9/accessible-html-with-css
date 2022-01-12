[![Build Status](https://travis-ci.com/tesk9/accessible-html-with-css.svg?branch=master)](https://travis-ci.com/tesk9/accessible-html-with-css)

# accessible-html-with-css

`tesk9/accessible-html-with-css` makes writing accessible websites easier.

This library is intended to be used along with [`rtfeldman/elm-css`](https://package.elm-lang.org/packages/rtfeldman/elm-css/latest/). If you're not using elm-css, you probably want [`accessible-html`](https://package.elm-lang.org/packages/tesk9/accessible-html/latest/) instead.

## Using this Library

Use the `Accessibility.Styled` module to encourage accessible practices:

    import Accessibility.Styled as Html exposing (..)


There are also attribute helpers that enable you to do some pretty advanced cool stuff! Many of these helpers are not necessary when writing semantically correct HTML5 code, but you will still need some of them when rolling your own dynamic widgets. The import expressions below point out some of the helpers that you are more likely to need:


    import Accessibility.Styled.Aria exposing (controls, labelledBy, describedBy)
    import Accessibility.Styled.Key exposing (onKeyDown, left, right, enter, escape)
    import Accessibility.Styled.Landmark exposing (search)
    import Accessibility.Styled.Live exposing (atomic, busy, liveAssertive, livePolite)
    import Accessibility.Styled.Role exposing (presentation)
    import Accessibility.Styled.Style exposing (invisible)


## Resources

A great place to start is reading about the [principles of accessibility](https://www.w3.org/TR/UNDERSTANDING-WCAG20/intro.html). By starting out with the design goals of Perceivable, Operable, Understandable, and Robust, you'll be able to find the information you need when reading the WAI-ARIA spec.

If you know you want to make a specific kind of widget, the Web Accessibility Initiative has specific [authoring best practices](https://www.w3.org/TR/wai-aria-practices-1.1/#aria_ex) and recommendations for you, along with really great examples.

## Changelog

### 3.0.0

1. All `Accessibility.Styled.Widget` helpers were folded into `Accessibility.Styled.Aria`, in order to make finding an ARIA helper more intuitive. Depending on your codebase, doing a find-and-replace `Widget` with `Aria` followed by running `elm-format` may suffice.
2. Moved `Accessibility.Styled.Landmark.application` to `Accessibility.Styled.Role`
3. `Accessibility.Styled.Aria.controls` takes a list of strings, rather than a single string


## Modules

### Accessibility.Styled

This section extends the html library to include `tab*` elements, `radio`, `inputText`, `checkbox`, and more. It also shadows the `elm/html` library to encourage limiting interactive behavior to html5 interactable elements.

### Accessibility.Styled.Live

Describe which sections of the page are changing over time, and how aggressively assistive technologies should notify the user about those changes.

### Accessibility.Styled.Role

Much of the time, sticking with HTML5 is better than using these properties. However, the WAI-ARIA spec moves at a different pace than the HTML spec--and user agent technologies are another factor entirely! You are likely to find yourself using a combination of these `Accessibility.Styled.Role` attributes.

### Accessibility.Styled.Aria

This section includes all ARIA attributes that aren't describing Landmarks, Roles, or Live regions.

### Accessibility.Styled.Style

This section contains helpers for changing the look of your site without making it unusable.

For instance, if you prefer to use placeholders to convey what sort of values belong in an input, you can use the `invisible` helper to remove the label for screenviewers without removing it for screenreaders.

### Accessibility.Styled.Landmark

You're likely to only want `search` from this section unless you're not using HTML5 elements.

### Accessibility.Styled.Key

When making widgets, you will need to add keyboard shortcuts to make keyboard navigation possible.

For instance, `space` and on `enter` should activate a button,`space` should change a checkbox's state, `escape` should close a modal, and `up`, `down`, `left`, and `right` should navigate focus in a menu.
