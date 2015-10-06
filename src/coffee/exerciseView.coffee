React = require('react')

print = (args) ->
	console.log args

div = React.createFactory('div')
ul = React.createFactory('ul')
li = React.createFactory('li')
br = React.createFactory('br')
form = React.createFactory('form')
label = React.createFactory('label')
button = React.createFactory('button')
input = React.createFactory('input')

ExerciseView = React.createClass
	#################################
	#		User Functions
	#################################
	completeSet: ->
		@props.model.get_current_exercise().complete_set()
		@update()

	modifyWeight: ->
		new_weight = $('#weightInput').val()

		@props.model.get_current_exercise().motion.set_weight(new_weight, 'vluwer') # TODO(tmarkvluwer): get rid of hard-coded
		@toggleModifyWeightModal()
		@update()

	toggleModifyWeightModal: ->
		if $('#modify-weight-dialog').hasClass('hidden')
			print 'removing class'
			$('#modify-weight-dialog').removeClass('hidden')
		else
			print 'adding class'
			$('#modify-weight-dialog').addClass('hidden')

	#################################
	#		React Functions
	#################################

	componentDidMount: ->
		# print "exercise mount"
		@props.model.on 'change', @update

	update: ->
		# print "exercise update"
		@forceUpdate()

	render: ->
		# print "exercise render: " + @props.model.get_current_exercise().name
		div
			className: 'exercise-container container'
			div
				className: 'exercise-description row'
				div
					className: 'col-lg-12'
					@props.model.get_current_exercise().desc

			div
				className: 'exercise-info row'
				div
					className: 'col-lg-12'
					'\nSets Remaining: ' + @props.model.get_current_exercise().sets_remaining
			div
				className: 'exercise-info row'
				div
					className: 'col-md-6'
					id: 'weight-test'
					onClick: @toggleModifyWeightModal
					'\nWeight: ' + @props.model.get_current_exercise().motion.weight
			div
				className: 'hidden modify-weight row'
				id: 'modify-weight-dialog'
				form
					div
						className: 'form-group'
					label
						for: "weightInput"
						'New Weight'
					input
						type: "number"
						className: "form-control"
						id: "weightInput"
						placeholder: 'e.g. ' + @props.model.get_current_exercise().motion.get_bump_estimate()
				button
					type: "submit"
					onClick: @modifyWeight
					className: "btn btn-default"
					"Submit"
			div
				className: 'row'
				button
					id: 'complete-set-btn'
					className: 'col-xs-12 btn-lg btn-primary'
					onClick: @completeSet
					'Complete Set'

module.exports = React.createFactory(ExerciseView)
