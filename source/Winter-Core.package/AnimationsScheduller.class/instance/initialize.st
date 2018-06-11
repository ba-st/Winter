initialization
initialize

	super initialize.

	gameStepActions := Dictionary new.
	process := self 
		newProcessAt: 35 
		do: [ gameStepActions keysAndValuesDo: [ :element :animation |
			animation animate ] ]
		every: self animationStepTime.