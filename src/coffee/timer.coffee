EventEmitter = require('events').EventEmitter


class Timer extends EventEmitter
	constructor: (@countdown_time) ->
		@secs_remaining = @countdown_time
		@paused = true

	set: (new_time) ->
		@countdown_time = new_time

		if @paused
			@reset()

	start: () ->
		@paused = false
		@countdown = setInterval(
			() =>
				@secs_remaining--
				@emit 'change'
				# console.log(@secs_remaining)
			1000
		)

	pause: () ->
		@paused = true
		@emit 'change'
		clearInterval(@countdown)

	reset: () ->
		@pause()
		@secs_remaining = @countdown_time
		@emit 'change'
		# console.log "resetting to: " + @secs_remaining


module.exports = Timer
