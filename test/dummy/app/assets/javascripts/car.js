(function() {
  var Car;

  Car = React.createClass({
    render: function() {
      var ref;
      return React.createElement("div", {
        "doors": 4.,
        "date": Date.now() * 2,
        "data-top-down": "yep",
        "checked": true
      }, "Car", React.createElement("hr", null), React.createElement("hr", null), React.createElement("p", null, ((ref = this.props) != null ? ref.color : void 0) || 'none'));
    }
  });

  $(function() {
    return React.renderComponent(React.createElement(Car, {
      "color": "red"
    }), $('<div />').appendTo($('body')).get(0));
  });

}).call(this);
