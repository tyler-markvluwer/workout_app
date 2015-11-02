React = require('react')

div = React.createFactory('div')
img = React.createFactory('img')

# View Class
ScaledImageView = React.createClass
    #################################
    #       React Functions
    #################################

    render: ->
        IMG_STYLE = {
            width: @props.scale
            height: 'auto'
        }

        img
            className: 'center-block' # not a bootstrap thing!
            src: @props.src
            style: IMG_STYLE
            alt: @props.alt

module.exports = React.createFactory(ScaledImageView)
