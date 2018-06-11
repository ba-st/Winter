rendering
renderWidgetsOn: canvas
	titleWidget renderOn: canvas translatedBy: 260@30.
	spellWidget renderOn: canvas translatedBy: -12@90.
	characterWidget renderOn: canvas translatedBy: 90@0.
	spellWidget renderOn: canvas translatedBy: 90@0.
	choiceWidgets renderOn: canvas translatedBy: -220@90.
	arrowWidget renderOn: canvas translatedBy: -90 @ (10 + (80 * currentChoice)).