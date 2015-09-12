EventEmitter = require('events').EventEmitter
Utils = require('./utils')

utils = new Utils()

class Model extends EventEmitter
	constructor: (@workouts, @curr_workout_index, @curr_exercise_index) ->
		@curr_workout_index = utils.set_default_value(@curr_workout_index, 0)
		@curr_exercise_index = utils.set_default_value(@curr_exercise_index, 0)

	get_current_workout: ->
		return @workouts[@curr_workout_index]

	get_current_exercise: ->
		return @get_current_workout().get_current_exercise()

	get_next_exercise: ->
		@emit 'change'
		return @get_current_workout().get_next_exercise()

	get_prev_exercise: ->
		@emit 'change'
		return @get_current_workout().get_prev_exercise()

	set_current_workout: (index) ->
		if index > @workouts.length - 1
			return

		@curr_workout_index = index
		@curr_exercise_index = 0
		@emit 'change'


module.exports = Model
