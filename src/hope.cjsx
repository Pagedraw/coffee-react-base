React = require 'react'

exports.foo = -> alert 'quadling!'

exports.RC = React.createClass
    render: ->
        <div>
            <p>Hello from the other side!</p>
            <p>trance</p>
        </div>