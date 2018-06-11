initialization
loadWidgets
	| numPlayers |
	titleWidget := self newSelectWidget: (self textWidgetAt: #character).
	characterWidget := self newCharacterWidget.
	numPlayers := startingGame players size.
	arrowWidgets := self newCadreWidgets: numPlayers.
	currentChoices := { 0@0 . 2@2 . 4@4 . 6@6 } copyFrom: 1 to: numPlayers.
	