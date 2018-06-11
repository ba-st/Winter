Rendering
renderWidgetsOn: canvas
	titleWidget renderOn: canvas translatedBy: 210@30.
	canvas pathTransform translateBy: -40@90.
	arenaWidget renderOn: canvas translatedBy: 100@0.
	arrowWidget renderOn: canvas translatedBy: -75 @ (currentChoice * 80 - 70)