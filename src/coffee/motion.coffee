EventEmitter = require('events').EventEmitter

print = (args) ->
	console.log args

username = 'vluwer' # TODO(tmarkvluwer): don't make this hard coded
ParseMotion = Parse.Object.extend("ParseMotion")

class Motion extends EventEmitter
	constructor: (@name, @weight, @reps) ->
		@parseMotion = new ParseMotion()
		@parseQuery = new Parse.Query(ParseMotion)

		# check for existence in memory
		@check_for_parse_attrs(username)
		if not @check_for_saved_attrs(username) and typeof(@weight) != 'undefined'
			# store this new motion into the db
			@write_to_memory(username)

	set_weight: (new_weight, username) ->
		print "old weight: " + @weight
		@weight = new_weight
		@write_to_memory(username)

	check_for_parse_attrs: (username) ->
		key = @get_store_key(username)
		if key == 'vluwerlegextensions'
			@parseQuery.exists(key)
			@parseQuery.addDescending('createdAt')
			@parseQuery.first(
				success: (result) =>
					weight = result.get(key)
					@weight = weight
					localStorage.setItem(key, @to_json()) #TODO(tmarkvluwer): this is a quick fix. There are issues involved with it
					$('#weight-test').val(@weight)
					console.log @weight
				error: (error) =>
					print "error retrieving weight"
			)

	check_for_saved_attrs: (username) ->
		key = @get_store_key(username)
		stored_values = JSON.parse(localStorage.getItem(key))

		if stored_values == null
			return false
		else
			@weight = stored_values['weight']
			return true

	# Once a current weight is 'easy'
	# estimates what weight you should jump up to
	get_bump_estimate: () ->
		rough_estimate = @weight*1.05
		if (rough_estimate - @weight) < 5
			rough_estimate = @weight + 5

		return rough_estimate

	to_json: () ->
		this_json = JSON.stringify(this)
		print this_json
		return this_json

	get_store_key: (username) ->
		modified_exercise_name = @name.toLowerCase()
		# get rid of spaces
		modified_exercise_name = modified_exercise_name.replace(/\s/g, '');
		return username + modified_exercise_name

	write_to_memory: (username) ->
		key = @get_store_key(username)
		@parseMotion.set(key, @weight)
		if @weight != "undefined"
			@parseMotion.save(null,
				success: (parseMotion) =>
					print key + " saved!"
				error: (parseMotion, error) =>
					print key + " failed!"
			)

		localStorage.setItem(key, @to_json())

module.exports = Motion
