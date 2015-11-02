React = require('react')

# toastr = require('toastr')
FormGroupView = require('./formGroupView')
FormCheckboxView = require('./formCheckboxView')
FormButton = require('./formButton')
FormSerializer = require('./formSerializer')

# tag factories
div = React.createFactory('div')
form = React.createFactory('form')
button = React.createFactory('button')
h4 = React.createFactory('h4')
p = React.createFactory('p')

# View Class
RegisterModal = React.createClass
    #################################
    #       User Functions
    #################################
    show_toast: (first, last) ->
        full_name = first + ' ' + last

        # toastr.success('Thanks for submitting!', 'Hey ' + full_name + '!')

    submit: ->
        formSerializer = new FormSerializer()
        data = formSerializer.serialize()

        # client side verification of password
        if data['password-register'] != data['confirm-password']
            alert('password fields do not match! - ' + data['password'] + " " + data['confirm-password'])
        else
            # server side verification
            user = new Parse.User()
            user.set("username", data['username-register'])
            user.set("password", data['password-register'])
            user.set("email", data['email'])

            user.signUp(null, {
                success: (user) =>
                    @show_toast(data['first-name'], data['last-name'])
                    $('#register-modal').modal('hide')
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
                            # FormGroupView
                            #     id: 'first-name'
                            #     innerText: 'First Name:'
                            #     type: 'text'

                            # # Last Name input
                            # FormGroupView
                            #     id: 'last-name'
                            #     innerText: 'Last Name:'
                            #     type: 'text'

                            FormGroupView
                                id: 'username-register'
                                innerText: 'Username:'
                                type: 'text'

                            FormGroupView
                                id: 'email'
                                innerText: 'Email Address:'
                                type: 'email'

                            FormGroupView
                                id: 'password-register'
                                innerText: 'Password:'
                                type: 'password'

                            FormGroupView
                                id: 'confirm-password'
                                innerText: 'Confirm Password:'
                                type: 'password'

                            FormCheckboxView
                                id: 'taco-box'
                                innerText: 'Do you want tacos?'

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

module.exports = React.createFactory(RegisterModal)