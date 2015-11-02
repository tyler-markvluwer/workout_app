React = require('react')

# tag factories
div = React.createFactory('div')
label = React.createFactory('label')
input = React.createFactory('input')

# View Class
FormGroupView = React.createClass
	#################################
    #       React Functions
    #################################

    render: ->
        div
            className: 'form-group'

            label
                for: @props.id
                @props.innerText
            input
                type: @props.type
                className: 'form-control'
                id: @props.id
                placeholder: "Enter " + @props.innerText[0..-2] + " Here"


module.exports = React.createFactory(FormGroupView)
