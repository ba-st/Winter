Actions
action

	self y = scene minY
		ifTrue: [  scene removeComponent: self. scene player reload ]
		ifFalse: [ self position: self position - (0 @ 24) ]