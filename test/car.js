(function() {
  var Car, React;

  React = require('react');

  Car = React.createClass({
    render: function() {
      var _ref;
      return Car({
        "doors": 4.,
        "safety": getSafetyRating() * 2,
        "data-top-down": "yep",
        "checked": true
      }, FrontSeat(null), BackSeat(null), React.DOM.p(null, "Which seat can I take? ", ((_ref = this.props) != null ? _ref.seat : void 0) || 'none'));
    }
  });

  React.renderComponent(Car({
    "seat": "front, obvs"
  }), document.getElementById('container'));

}).call(this);
