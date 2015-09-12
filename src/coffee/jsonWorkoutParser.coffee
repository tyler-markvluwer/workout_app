Motion = require('./motion')
Exercise = require('./exercise')
Workout = require('./workout')
Timer = require('./timer')

print = (args) ->
	console.log args

class JsonWorkoutParser
	constructor: (@json) ->
		@workout_name = @json['workout_name']

	getWorkout: () ->
		timer = new Timer(60) # 60 seconds
		user = 'vluwer' # TODO(tmarkvluwer): get rid of hard coding

		workout = new Workout(@workout_name, user, timer)

		exercises = @json['exercises']
		for exercise in exercises
			workout.add_exercise @exercise_builder(exercise)

		return workout

	exercise_builder: (exercise_object) ->
		name = exercise_object['name']
		weight = 'undefined'
		reps = exercise_object['reps_max']
		sets = exercise_object['sets']
		rest = exercise_object['rest']
		desc = exercise_object['desc']

		return new Exercise(name, desc, weight, reps, sets, rest)

module.exports = JsonWorkoutParser
