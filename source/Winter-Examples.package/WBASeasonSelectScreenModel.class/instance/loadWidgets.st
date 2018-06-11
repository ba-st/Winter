initialization
loadWidgets
	titleWidget := self newSelectWidget: (self textWidgetAt: #season).
	seasonWidgets := (1 to: 6) collect: [ :i | 
		self newSeasonWidget: i ].
	arrowWidget := self newSmallArrowSelectWidget: 80.