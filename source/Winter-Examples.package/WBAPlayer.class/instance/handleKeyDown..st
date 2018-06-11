Events
handleKeyDown: anEvent


	keyDownInteractions
		at: anEvent scanCode 
		ifPresent: [ :interaction | interaction value ]
		ifAbsent: [ "Do nothing" ]