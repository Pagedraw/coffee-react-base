React = require 'react'

exports.foo = -> alert 'quadling!'

exports.RC = React.createClass
    getInitialState: ->
        foo: 'bar'

    componentDidMount: ->
        await new Promise (resolve, reject) -> setTimeout((-> resolve()), 2000)
        @setState(foo: 'baz')

    render: ->
        <div>
            <p>Hello from the other side!</p>
            <p>trance</p>
            <p>{@state.foo}</p>
        </div>