React = require('react')

# tag factories
button = React.createFactory('button')

# View Class
formButtonView = React.createClass
	#################################
    #       React Functions
    #################################

    render: ->
        button
            id: @props.id
            className: 'btn btn-default form-control'
            type: 'button'
            onClick: @props.onClick
            @props.innerText

module.exports = React.createFactory(formButtonView)