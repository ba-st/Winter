Actions
action
	self y = scene   maxY
		ifTrue: [ scene lostGame ]
		ifFalse: [ self position:self position + (0@1)]
	
	