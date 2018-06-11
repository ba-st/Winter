rendering
renderWidgetsOn: canvas
	titleWidget renderOn: canvas translatedBy: 30@30.
	canvas pathTransform translateBy: 220@30.
	playersWidget do: [ :widget |
		widget renderOn: canvas translatedBy: 0@100. ].
	arrowWidget renderOn: canvas translatedBy: -75 @ ((-3 + currentChoice) * 100 + 10)