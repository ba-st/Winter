Events
handleKeyDown: anEvent

	| key |

	(anEvent character isNil and: [ anEvent scanCode = 79 ])
		ifTrue: [ key := Character arrowRight ]
		ifFalse: [ key := anEvent character ].
	keyDownInteractions
		at: key
		ifPresent: [ :interaction | interaction value ]
		ifAbsent: [ "Do nothing" ]