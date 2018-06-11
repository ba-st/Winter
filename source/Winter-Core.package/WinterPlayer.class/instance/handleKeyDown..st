Events
handleKeyDown: anEvent


	keyDownInteractions
		at: anEvent character
		ifPresent: [ :interaction | interaction value ]
		ifAbsent: [ "Do nothing" ]