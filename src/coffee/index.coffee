React = require('react')
Model = require('./model')

window.model = new Model()

User = require('./user')
WorkoutView = require('./workoutView')
WorkoutPickerView = require('./workoutPickerView')
JsonWorkoutParser = require('./jsonWorkoutParser')
MasterNavBarView = require('./masterNavBarView')
LoginModal = require('./LoginModal')
RegisterModal = require('./registerModal')
key1 = require('./key1')
key2 = require('./key2')

Parse.initialize(key1, key2);

day30 = require('./workouts/day30')
day31 = require('./workouts/day31')
day32 = require('./workouts/day32')
day33 = require('./workouts/day33')
day34 = require('./workouts/day34')
day35 = require('./workouts/day35')
day36 = require('./workouts/day36')
day37 = require('./workouts/day37')
day38 = require('./workouts/day38')
day39 = require('./workouts/day39')
day40 = require('./workouts/day40')
day41 = require('./workouts/day41')
day42 = require('./workouts/day42')
day43 = require('./workouts/day43')
day44 = require('./workouts/day44')
day45 = require('./workouts/day45')
day46 = require('./workouts/day46')
day47 = require('./workouts/day47')
day48 = require('./workouts/day48')
day49 = require('./workouts/day49')
day50 = require('./workouts/day50')
day51 = require('./workouts/day51')
day52 = require('./workouts/day52')
day53 = require('./workouts/day53')
day54 = require('./workouts/day54')
day55 = require('./workouts/day55')
day56 = require('./workouts/day56')

# add the pre-loaded workouts
minVal = 30
maxVal = 56
while maxVal >= minVal
	include_string = './workouts/day' + maxVal.toString()
	maxVal -= 1
	parser = new JsonWorkoutParser(require(include_string))
	window.model.add_workout(parser.getWorkout())

# Render the modals in the background
React.render(
	RegisterModal
		id: 'register-modal'
		modal_title: 'Welcome!'
	document.getElementById('register-modal-mount') # where to mount it
)
React.render(
	LoginModal
		id: 'login-modal'
		modal_title: 'Welcome Back!'
	document.getElementById('login-modal-mount') # where to mount it
)

React.render(
	MasterNavBarView
		nullProp: null
	document.getElementById('navbar-mount')
)

React.render(
	WorkoutView
		model: window.model
	document.getElementById('workout-view-mount')
)

React.render(
	WorkoutPickerView
		model: window.model
	document.getElementById('workout-picker-view-mount')
)
