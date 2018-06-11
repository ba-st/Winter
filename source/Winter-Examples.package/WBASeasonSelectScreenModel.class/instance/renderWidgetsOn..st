rendering
renderWidgetsOn: canvas
	titleWidget renderOn: canvas translatedBy: 210@30.
	canvas pathTransform translateBy: -200@130.
	seasonWidgets do: [ :widget |
		widget renderOn: canvas translatedBy: 100@0. ].
	arrowWidget renderOn: canvas translatedBy: ((-6 + currentChoice) * 100 - 31) @ 10