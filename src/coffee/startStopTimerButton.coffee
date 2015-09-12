React = require('react')
div = React.createFactory('div')


StartStopTimerButton = React.createClass
	componentDidMount: ->
		@props.timer.on 'change', @update

	update: ->
		@forceUpdate()

	toggleTimer: ->
		if @props.timer.paused
			@props.timer.start()
		else
			@props.timer.reset()

	render: ->
		div
			id: 'start-stop-timer-button'
			onClick: @toggleTimer
			if @props.timer.paused
				'Start'
			else
				'Reset'

module.exports = React.createFactory(StartStopTimerButton)