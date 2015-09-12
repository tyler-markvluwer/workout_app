React = require('react')
div = React.createFactory('div')

print = (args) ->
	console.log args

WorkoutNavBarView = React.createClass
	componentDidMount: ->
		# print "exercise mount"
		@props.model.on 'change', @update

	update: ->
		# print "WorkoutNavBarView update"
		@forceUpdate()

	nextExercise: ->
		# print @props.workout
		@props.model.get_next_exercise()

	prevExercise: ->
		@props.model.get_prev_exercise()

	render: ->
		# print "WorkoutNavBarView render"
		div
			className: 'workout-navbar-container container'
			div
				className: 'row'
				div
					className: 'button-container'
					div
						className: 'btn btn-default'
						onClick: @prevExercise
						'<- Prev'
					div
						className: 'btn btn-default pull-right'
						onClick: @nextExercise
						'Next ->'

module.exports = React.createFactory(WorkoutNavBarView)
