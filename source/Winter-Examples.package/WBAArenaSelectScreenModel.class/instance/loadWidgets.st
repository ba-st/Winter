initialization
loadWidgets
	titleWidget := self newSelectWidget: (self textWidgetAt: #arena).
	arenas := WBAArenaDescriptor perform: ('available' , startingGame players size printString, 'Players') asSymbol.
	arenaWidget := self newArenaWidget: self numArenas.
	arrowWidget := self newLargeArrowSelectWidget: 300.