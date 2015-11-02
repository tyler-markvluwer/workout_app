EventEmitter = require('events').EventEmitter

print = (args) ->
	console.log args

ParseMotion = Parse.Object.extend("Motion")

class Motion extends EventEmitter
	constructor: (@name, @weight, @reps) ->
		@parseMotion = new ParseMotion()

		try
			username = window.model.get_curr_user()
		catch
			console.log("no current user logged in")

		# check for existence in memory
		@check_for_parse_attrs(username)
		if not @check_for_saved_attrs(username) and typeof(@weight) != 'undefined'
			# store this new motion into the db
			@write_to_memory(username)

	set_weight: (new_weight) ->
		try
			username = window.model.get_curr_user()
		catch
			console.log("no current user logged in")

		print "old weight: " + @weight
		@weight = new_weight
		@write_to_memory(username)

	check_for_parse_attrs: () ->
		console.log ("checking for parse attrs")
		try
			username = window.model.get_curr_user()
		catch
			console.log("no current user logged in")

		key = @get_store_key(username)
		query = new Parse.Query(ParseMotion)

		query.equalTo('user', username)
		query.equalTo('motion', key)
		query.addDescending('createdAt')
		query.first(
			success: (result) =>
				if result
					@weight = result.get("weight")
					localStorage.setItem(key, @to_json()) #TODO(tmarkvluwer): this is a quick fix. There are issues involved with it
					console.log @weight
					@emit 'change'

			error: (error) =>
				print "error retrieving weight"
		)

	check_for_saved_attrs: () ->
		try
			username = window.model.get_curr_user()
		catch
			console.log("no current user logged in")
		
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

	get_store_key: () ->
		modified_exercise_name = @name.toLowerCase()
		# get rid of spaces
		modified_exercise_name = modified_exercise_name.replace(/\s/g, '');
		return modified_exercise_name

	write_to_memory: () ->
		try
			username = window.model.get_curr_user()
		catch
			console.log("no current user logged in")

		key = @get_store_key(username)

		query = new Parse.Query(ParseMotion)
		query.equalTo('user', username)
		query.equalTo('motion', key)
		query.addDescending('createdAt')
		query.first(
			success: (result) =>
				if result
					result.set("weight", @weight)
					result.save()
				else
					@parseMotion.set('user', username)
					@parseMotion.set('motion', key)
					@parseMotion.set('weight', @weight)
					if @weight != "undefined"
						@parseMotion.save(null,
							success: (parseMotion) =>
								print key + " saved!"
								localStorage.setItem(key, @to_json())
							error: (parseMotion, error) =>
								print key + " failed!"
						)

			error: (error) =>
				print "error retrieving weight"
		)

module.exports = Motion
