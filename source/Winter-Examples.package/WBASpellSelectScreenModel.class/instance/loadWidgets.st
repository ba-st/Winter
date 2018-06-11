initialization
loadWidgets
	| numPlayers |
	titleWidget := self newSelectWidget: (self textWidgetAt: #spell).
	numPlayers := startingGame players size.
	spellWidgets := self newSpellWidgets: numPlayers.
	arrowWidgets := self newCadreWidgets: numPlayers.
	currentChoices :=  #(0 1 2 3) copyFrom: 1 to: numPlayers.