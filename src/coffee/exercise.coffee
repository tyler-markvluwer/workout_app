Timer = require('./timer')
Motion = require('./motion')
EventEmitter = require('events').EventEmitter

print = (args) ->
	console.log args

class Exercise extends EventEmitter
	constructor: (@name, @desc, weight, reps, @sets, @rest_time, @warmup) ->
		@motion = new Motion(@name, weight, reps)

		@sets_remaining = @sets

		if @warmup == 'undefined'
			@warmup = false

	complete_set: () ->
		if @sets_remaining
			@sets_remaining--
			@emit 'change'

	add_set: () ->
		@sets_remaining++
		@emit 'change'

	force_emit: () ->
		print @name + " emitting"
		@emit 'change'

	get_rest_time: () ->
		return @rest_time

	to_json: () ->
		this_json = JSON.stringify(this)
		print this_json
		return this_json

	write_to_memory: (username) ->
		key = username + '-exercise-' + @name
		localStorage.setItem(key, @to_json())

module.exports = Exercise
