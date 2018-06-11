events
pushEvent: anEvent

	anEvent isGameEvent
		ifTrue: [ anEvent execute: self screen  ]
		