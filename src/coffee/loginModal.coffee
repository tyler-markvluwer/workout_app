React = require('react')
# toastr = require('toastr')
FormGroupView = require('./formGroupView')
FormCheckboxView = require('./formCheckboxView')
FormButton = require('./formButton')
LoginFormSerializer = require('./loginFormSerializer')

# tag factories
div = React.createFactory('div')
form = React.createFactory('form')
button = React.createFactory('button')
h4 = React.createFactory('h4')
p = React.createFactory('p')

# View Class
LoginModal = React.createClass
    #################################
    #       User Functions
    #################################
    show_toast: (first, last) ->
        full_name = first + ' ' + last
        # toastr.success('Thanks for submitting!', 'Hey ' + full_name + '!')

    submit: ->
        formSerializer = new LoginFormSerializer()
        data = formSerializer.serialize()
        
        Parse.User.logIn(data['username-login'], data['password-login'], {
          success: (user) ->
            $('#login-modal').modal('hide')
            window.model.set_new_user()

          error: (user, error) ->
            alert("Error: " + error.code + " " + error.message)
        })

    #################################
    #       React Functions
    #################################
    render: ->
        div
            className: 'modal fade'
            id: @props.id
            role: 'dialog'

            div
                className: 'modal-dialog'

                div
                    className: 'modal-content'

                    div
                        className: 'modal-header'

                        button
                            className: 'close'
                            'data-dismiss': 'modal'
                            'x'
                        h4
                            className: 'modal-title'
                            @props.modal_title
                    div
                        className: 'modal-body'

                        form
                            role: 'form'

                            # First Name input
                            FormGroupView
                                id: 'username-login'
                                innerText: 'Username:'
                                type: 'text'

                            FormGroupView
                                id: 'password-login'
                                innerText: 'Password:'
                                type: 'password'

                            FormCheckboxView
                                id: 'remember-login'
                                innerText: 'Remember on device?'

                            FormButton
                                id: 'submit-button'
                                innerText: 'Submit'
                                onClick: @submit
                    div
                        className: 'modal-footer'

                        button
                            className: 'btn btn-default'
                            'data-dismiss': 'modal'
                            'Close'

module.exports = React.createFactory(LoginModal)