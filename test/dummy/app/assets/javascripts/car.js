(function() {
  var Car;

  Car = React.createClass({
    render: function() {
      var _ref;
      return React.createElement("div", {
        "doors": 4.,
        "date": Date.now() * 2,
        "data-top-down": "yep",
        "checked": true
      }, "Car", React.createElement("hr", null), React.createElement("hr", null), React.createElement("p", null, ((_ref = this.props) != null ? _ref.color : void 0) || 'none'));
    }
  });

  $(function() {
    return React.renderComponent(React.createElement(Car, {
      "color": "red"
    }), $('<div />').appendTo($('body')).get(0));
  });

}).call(this);
