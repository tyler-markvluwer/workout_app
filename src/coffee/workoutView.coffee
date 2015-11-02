React = require('react')
ExerciseView = require('./exerciseView')
TimerView = require('./timerView')
WorkoutNavBarView = require('./workoutNavBarView')

print = (args) ->
	console.log args

div = React.createFactory('div')

WorkoutView = React.createClass
	componentDidMount: ->
		@props.model.on 'change', @update

	update: ->
		# print "workout update"
		@forceUpdate()

	render: ->
		# print "workout render"
		div
			className: 'container'
				
			ExerciseView
				model: @props.model
			TimerView
				model: @props.model
				timer: @props.model.get_current_workout().timer
			WorkoutNavBarView
			 	model: @props.model

module.exports = React.createFactory(WorkoutView)
