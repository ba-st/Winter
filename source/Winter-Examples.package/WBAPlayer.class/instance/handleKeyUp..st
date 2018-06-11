Events
handleKeyUp: anEvent


	keyUpInteractions
		at: anEvent scanCode 
		ifPresent: [ :interaction | interaction value ]
		ifAbsent: [ "Do nothing" ]