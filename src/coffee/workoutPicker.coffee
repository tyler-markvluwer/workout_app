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

WorkoutPicker = React.createClass
	componentDidMount: ->
		@props.model.on 'change', @update

	update: ->
		@forceUpdate()

	setCurrentWorkout: (index) ->
		current_workout = @props.model.set_current_workout(index)

	render: ->
		# print "exercise render"
		div
			className: 'container'
			ul
				className: 'workout-list list-inline'
				for i in [@props.model.workouts.length-1..0]
					li
						className: 'workout-summary'
						onClick: @setCurrentWorkout.bind(this, i)
						@props.model.workouts[i].name


module.exports = React.createFactory(WorkoutPicker)
