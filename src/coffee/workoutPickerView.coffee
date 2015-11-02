React = require('react')

print = (args) ->
    console.log args

div = React.createFactory('div')
ul = React.createFactory('ul')
li = React.createFactory('li')
br = React.createFactory('br')
form = React.createFactory('form')
label = React.createFactory('label')
button = React.createFactory('button')
input = React.createFactory('input')
span = React.createFactory('span')

WorkoutPickerView = React.createClass
    componentDidMount: ->
        @props.model.on 'change', @update

    update: ->
        @forceUpdate()

    setCurrentWorkout: (index) ->
        current_workout = @props.model.set_current_workout(index)

    render: ->
        div
            className: 'container'

            div
                className: 'row'

                div
                    className: "btn-group col-xs-12"

                    button
                        className: "btn dropdown-toggle col-xs-12"
                        type: "button"
                        'data-toggle': "dropdown"
                        'aria-haspopup': "true"
                        'aria-expanded': "false"
                        'Select Workout'
                        span
                            className: 'caret'

                    ul
                        className: "dropdown-menu"

                        for i in [@props.model.workouts.length-1..0]
                            li
                                className: 'workout-summary'
                                onClick: @setCurrentWorkout.bind(this, i)
                                @props.model.workouts[i].name

module.exports = React.createFactory(WorkoutPickerView)
