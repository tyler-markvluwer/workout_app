React = require('react')
Utils = require('./utils')
print = new Utils().print

div = React.createFactory('div')
ul = React.createFactory('ul')
li = React.createFactory('li')
br = React.createFactory('br')
button = React.createFactory('button')

TimerView = React.createClass
	componentDidMount: ->
		@state.timer.on 'change', @update
		@props.model.on 'change', @update

	update: ->
		print "timer update"
		# remove old listener
		@props.model.get_current_workout().timer.removeListener 'change', @update
		@props.model.get_current_workout().timer.on 'change', @update

		# set new state and new listeners
		@forceUpdate()

	getInitialState: ->
		return {timer: @props.timer}

	toggleTimer: ->
		if @props.model.get_current_workout().timer.paused
			@props.model.get_current_workout().timer.start()
		else
			@props.model.get_current_workout().timer.reset()

	isPaused: ->
		return @props.model.get_current_workout().timer.paused

	render: ->
		print "timer render"
		div
			className: 'timer-container container'
			div
				className: 'timer-info row'
				if @isPaused()
					print "timer paused"
					button
						className: 'col-xs-12 btn-lg btn-success timer-view'
						onClick: @toggleTimer
						@props.model.get_current_workout().timer.secs_remaining
				else
					print "timer running"
					button
						className: 'col-xs-12 btn-lg btn-danger timer-view'
						onClick: @toggleTimer
						@props.model.get_current_workout().timer.secs_remaining
			# div
			# 	className: 'timer-control row'
			# 	button
			# 		className: 'col-xs-12 btn btn-success'
			# 		onClick: @toggleTimer
			# 		if @props.model.get_current_workout().timer.paused
			# 			'Start'
			# 		else
			# 			'Reset'

module.exports = React.createFactory(TimerView)
