print = (args) ->
	console.log args

class User
	constructor: (@username) ->
		# get info from 3rd party
		user_info = localStorage.getItem(@username)

		#@weight_history = if user_info and user_info.weight_history then user_info.weight_history else []
		#@workouts = if user_info and user_info.workouts then user_info.workouts else []
		@weight_history = []
		@workouts = []

	add_weight: (weight, date) ->
		if typeof date == 'undefined'
			weight_date = Date().toString()
		else
			weight_date = date

		print date
		@weight_history.push ({
			date: weight_date,
			weight: weight,
			unit: 'lbs'
		})

	add_workout: (workout) ->
		@workouts.push workout
		print @workouts

	to_json: () ->
		this_json = JSON.stringify(this)
		console.log(this_json)

module.exports = User
