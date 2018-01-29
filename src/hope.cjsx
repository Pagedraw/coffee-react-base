React = require 'react'

export foo = -> alert 'quadling!'


export find_unused = find_unused = (existing_items, elem_gen, i = 0) ->
    if (candidate = elem_gen(i)) not in existing_items then candidate else find_unused(existing_items, elem_gen, i+1)



export RC = React.createClass
    componentWillMount: ->
        #await (new Promise (resolve) -> setTimeout(resolve, 2000))
        find_unused

    render: ->
        <div>
            <p>Hello from the other side!</p>
            <p>trance</p>
        </div>