class LoginFormSerializer
	constructor: () ->
		@data_dict = {}

	serialize: () ->
		@getFieldValue('username-login')
		@getFieldValue('password-login')

		console.log @data_dict

		return @data_dict

	getFieldValue: (id) ->
		@data_dict[id] = document.getElementById(id).value

	getCheckboxValue: (id) ->
		checked = $('#' + id + ':checked').val()

		# forces value to be 'on'/'off' vs 'on'/undefined
		checked = if checked then checked else 'off'
		@data_dict[id] = checked

module.exports = LoginFormSerializer