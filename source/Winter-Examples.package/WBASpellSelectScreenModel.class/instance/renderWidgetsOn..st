rendering
renderWidgetsOn: canvas
	| activeChoices |
	activeChoices := currentChoices. "can change while rendering"
	titleWidget renderOn: canvas translatedBy: 210@30.
	canvas pathTransform translateX: -74 Y: 0.
	1 to: spellWidgets size do: [ :i |
		(spellWidgets at: i) renderOn: canvas translatedBy: 0@90.
		(arrowWidgets at: i) renderOn: canvas temporarilyTranslatedBy: (activeChoices at: i) * 80 - 5 @ -10. ]