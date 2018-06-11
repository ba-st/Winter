Events
handleKeyUp: anEvent

	keyUpInteractions
		at: anEvent character
		ifPresent: [ :interaction | interaction value ]
		ifAbsent: [ "Do nothing" ]