# @cjsx React.DOM

Car = React.createClass
  render: ->
    <div doors={4} date={Date.now()*2}  data-top-down="yep" checked>
      Car
      <hr />
      <hr />
      <p>{@props?.color or 'none'}</p>
    </div>

$ ->
  React.renderComponent <Car color="red" />, $('<div />').appendTo($('body')).get(0)
  