React = require('react')

User = require('./user')
WorkoutView = require('./workoutView')
WorkoutPicker = require('./workoutPicker')
JsonWorkoutParser = require('./jsonWorkoutParser')
Model = require('./model')
key1 = require('./key1')
key2 = require('./key2')

Parse.initialize(key1, key2);

day30 = require('./day30')
day31 = require('./day31')
day32 = require('./day32')
day33 = require('./day33')
day34 = require('./day34')
day35 = require('./day35')
day36 = require('./day36')
day37 = require('./day37')
day38 = require('./day38')
day39 = require('./day39')
day40 = require('./day40')
day41 = require('./day41')
day42 = require('./day42')
day43 = require('./day43')
day44 = require('./day44')
day45 = require('./day45')
day46 = require('./day46')
day47 = require('./day47')
day48 = require('./day48')
day49 = require('./day49')
day50 = require('./day50')
day51 = require('./day51')
day52 = require('./day52')
day53 = require('./day53')
day54 = require('./day54')
day55 = require('./day55')
day56 = require('./day56')

workout_array = []

maxVal = 41
minVal = 30
while maxVal >= minVal
	include_string = './day' + maxVal.toString()
	maxVal -= 1
	parser = new JsonWorkoutParser(require(include_string))
	workout_array.push parser.getWorkout()

model = new Model(workout_array)

workout_view = React.render(
	WorkoutView
		model: model
	document.getElementById('workout-view-mount')
)

React.render(
	WorkoutPicker
		model: model
	document.getElementById('workout-picker-view-mount')
)
