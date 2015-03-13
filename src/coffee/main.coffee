mountNode = document.getElementsByClassName('app')[0];

storage = {

}

CharList = React.createClass(
  displayName: 'CharList',
  render: () -> React.createElement(
    'div',
    null,
    "Hello #{this.props.name}",
    React.createElement(CharName, null))
);

CharName = React.createClass(
  displayName: 'CharName',
  getInitialState: () ->
    { name: '' }
  handleChange: (event) ->
    this.setState({name: event.target.value})
  render: () ->
    React.createElement('div', null,
      React.createElement('input', {type: 'text', className: 'char-name', onChange: @handleChange}))
)

application = React.render(React.createElement(CharList, {name: ''}), mountNode)
