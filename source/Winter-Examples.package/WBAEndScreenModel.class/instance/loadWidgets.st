initialization
loadWidgets

	titleWidget := self textWidgetAt: #winner.
	
	spellWidget := self newAnimatedWidget: (winner character spell sprites last: 4).
		
	characterWidget := self newAnimatedWidget: { 
		winner character sprites first .
		winner character sprites third }.
		
	arrowWidget := self newLargeArrowSelectWidget: 450.
	
	choiceWidgets := self 
		newColumnWidget: { 
			self newSelectWidget: (self textWidgetAt: #arena) .
			self newSelectWidget: (self textWidgetAt: #players) } 
		space: 80
	