React = require('react')
ScaledImageView = require('./scaledImageView')

div = React.createFactory('div')
nav = React.createFactory('nav')
a = React.createFactory('a')
img = React.createFactory('img')
button = React.createFactory('button')
ul = React.createFactory('ul')
p = React.createFactory('p')
li = React.createFactory('li')

MasterNavBarView = React.createClass
    componentDidMount: ->
        window.model.on 'user-change', @update

    update: ->
        @forceUpdate()

    render: ->
        nav
            className: "navbar navbar-default"
            
            div
                className: "container-fluid"
                
                div
                    className: "navbar-header"
                    
                    ul
                        className: "nav nav-pills navbar-btn"
                        
                        li
                            className: "active"
                            role: "presentation"
                            a
                                href: "#"
                                "Home"

                        li
                            className: 'inactive'
                            role: "presentation"
                            a
                                href:"#"
                                'data-toggle': 'modal'
                                'data-target': '#register-modal'
                                'Register'
                        li
                            className: 'inactive'
                            role: "presentation"
                            a
                                href:"#"
                                'data-toggle': 'modal'
                                'data-target': '#login-modal'
                                'Login'
                        p
                            className: "navbar-text"

                            if Parse.User.current()
                                "Signed in as " + window.model.get_curr_user()
                            else
                                "Not signed in"

module.exports = React.createFactory(MasterNavBarView)
