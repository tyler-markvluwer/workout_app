EventEmitter = require('events').EventEmitter

print = (args) ->
	console.log args

class Workout extends EventEmitter
	constructor: (@name, @username, @timer) ->
		@exercises = []
		@current_exercise = null
		@ex_index = 0

	start_workout: () ->
		start_date = new Date()
		@start = start_date.toString()

	add_exercise: (new_exercise) ->
		@exercises.push new_exercise

		# now that we have an exercise set, the current one
		@current_exercise = @exercises[@ex_index]
		@timer.set(@current_exercise.rest_time)

	end_workout: () ->
		end_date = new Date()
		@end = end_date.toString()

	get_current_exercise: () ->
		return @exercises[@ex_index]

	get_next_exercise: () ->
		if @ex_index < @exercises.length - 1
			@ex_index++
			@current_exercise = @exercises[@ex_index]
			@timer.set(@current_exercise.rest_time)
			@current_exercise.force_emit()

		@emit 'change'

	get_prev_exercise: () ->
		if @ex_index > 0
			@ex_index--
			@current_exercise = @exercises[@ex_index]
			@timer.set(@current_exercise.rest_time)
			@current_exercise.force_emit()

		@emit 'change'

	to_json: () ->
		this_json = JSON.stringify(this)
		print this_json
		return this_json

module.exports = Workout
