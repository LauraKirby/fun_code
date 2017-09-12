## Window
  - alert and location methods are part of the browser's global environment which is made from one object called "window"
  - Global scope == window object
  - All global variables are properties of the window object

## Document
  - The "document" object is a global object which represents the html and content of a web page
  - "document" is property of the window object. it is also accessible as a global variable

## DOM
  - The DOM(Document Object Model)is representation of the document that JavaScript uses to navigate and make changes to a webpage.
  - Like a map of the document that Javascript can use, changes that Javascript makes to the DOM (map) appear in the webpage

## Interactivity with JavaScript involves three basic actions:
  - selecting elements,
    - `document.getElementById`
  - manipulating elements,
    - `document.querySelector('p').innerHTML`
  - listening for user actions
    - `document.querySelector('button').onClick('click', function(){})`

## Javascript events are a 2 step process:
  1. select element then read or manipulate
  2. respond to events like user click

## Example CSS selectors
- attribute
  - `myTitle = document.querySelector('[title=label]')`
  - can access the attribute using the name of the attribuite - ex: myTitle.title = 'label'
  - match elements that contain the attribute 'title' with the value set to 'label'
  - `document.querySelector('[title~=label]')`
  - match elements that contain the attribute 'title' and if the value 'label' is one of a space-separated list of values contained
  - there are several more combinations that work like regular expressions. see: [MDN Attribute Selectors](https://developer.mozilla.org/en-US/docs/Learn/CSS/Introduction_to_CSS/Attribute_selectors)

- pseudo classes
  - `document.querySelector('li:nth-child(even)')`
  - select elements based on information that is not contained in the document tree (which only contains html and text)
  - match one or more elements that exist in a certain state
  - ex: an element that is being hovered over by the mouse pointer
  - ex: a checkbox that is currently disabled or checked,
  - ex: an element that is the first child of its parent in the DOM tree (this last one seems like it belongs in 'pseudo elements' section)

- pseudo elements
  - select elements based on abstractions of the document tree representing (beyond what HTML does)
  - match one or more parts of content that are in a certain position in relation to an element
  - ex: the first work of each paragraph
  - ex: generated content appearing just before an element

- combinators
  - adjacent sibling
    - '+' combinator nodes that immediately follow the former specified element
    - ex: div + p will match any `<p>` that immediately follows a `<div>`
  - general sibling
    - '~' combinator selects nodes that follow (not necessarily immediately) the former specified element, if both elements shared the same parent
    - ex: p ~ span will match all `<span>` elements that follow a `<p>` element inside the same element
  - child
    - '>' combinator selects nodes that are direct children of the former specified element
    - ex: `ul > li` will match all `<li>` elements that are inside a `<ul>` element.
  - descendant
    - ' ' combinator selects nodes that are children (not necessarily direct children)



## See browsers that support specific Javascript functionality:
  - caniuse.com

## Attributes
