rendering
renderWidgetsOn: canvas
	| activeChoices |
	activeChoices := currentChoices. "can change while rendering"
	titleWidget renderOn: canvas translatedBy: 210@30.
	characterWidget renderOn: canvas translatedBy: -160@70.
	canvas pathTransform translateX: -5 Y: -2.
	arrowWidgets withIndexDo: [ :w :i |
		w renderOn: canvas temporarilyTranslatedBy: (activeChoices at: i) * (52@50) ] 