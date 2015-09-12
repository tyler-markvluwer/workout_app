
class Utils
	constructor: ->
		# pass

	print: (args) ->
		console.log args

	set_default_value: (dest_var, default_val) ->
		if typeof(dest_var) is 'undefined'
			return default_val
		else
			return dest_var

module.exports = Utils