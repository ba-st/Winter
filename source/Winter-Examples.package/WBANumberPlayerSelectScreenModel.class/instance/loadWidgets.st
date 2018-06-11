initialization
loadWidgets
	titleWidget := self newSingleSpriteWidget: (self textSpriteAt: #title).
	playersWidget := (2 to: 4) collect: [ :i | self newNumPlayersWidget: i ].
	arrowWidget := self newLargeArrowSelectWidget: 300.