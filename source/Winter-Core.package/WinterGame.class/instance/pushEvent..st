events
pushEvent: anEvent

	anEvent isGameEvent
		ifTrue: [ anEvent execute: self window  ]
		ifFalse: [ self scene pushEvent: anEvent ]