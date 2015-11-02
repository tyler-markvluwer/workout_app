React = require('react')

# tag factories
div = React.createFactory('div')
label = React.createFactory('label')
input = React.createFactory('input')

# View Class
formCheckboxView = React.createClass
    #################################
    #       React Functions
    #################################

    render: ->
        div
            className: 'checkbox'

            label
                for: @props.id
                input
                    type: 'checkbox'
                    id: @props.id
                    @props.innerText

module.exports = React.createFactory(formCheckboxView)