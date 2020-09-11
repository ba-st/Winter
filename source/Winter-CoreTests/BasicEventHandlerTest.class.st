Class {
	#name : #BasicEventHandlerTest,
	#superclass : #TestCase,
	#instVars : [
		'processTermianted',
		'keyPressed'
	],
	#category : #'Winter-CoreTests-Event-Handling'
}

{ #category : #'Test Support' }
BasicEventHandlerTest >> handleKeyDown: aBasicEventHandlerTest [ 
	
	keyPressed := true
]

{ #category : #'Test Support' }
BasicEventHandlerTest >> handleKeyUp: aBasicEventHandlerTest [

	keyPressed := false
]

{ #category : #initialization }
BasicEventHandlerTest >> setUp [

	super setUp.
	processTermianted := false.
	keyPressed := false
]

{ #category : #'Test Support' }
BasicEventHandlerTest >> stop [

	processTermianted := true
]

{ #category : #Tests }
BasicEventHandlerTest >> testKeyDownAndUpEventsReceived [

	| handler |

	handler := BasicEventHandler of: self.

	handler registerObserver: self.

	self deny: keyPressed.
	
	handler visitKeyDownEvent: self.
	self assert: keyPressed.

	handler visitKeyUpEvent: self.
	self deny: keyPressed
]

{ #category : #Tests }
BasicEventHandlerTest >> testPrintng [

	| handler |

	handler := BasicEventHandler of: self.

	self assert: handler printString equals: 'Basic keywords events handler'
]

{ #category : #Tests }
BasicEventHandlerTest >> testRegisteringObserver [

	| handler |

	handler := BasicEventHandler of: self.

	self assert: handler observers isEmpty.

	handler registerObserver: self.
	self
		deny: handler observers isEmpty;
		assert: ( handler observers includes: self )
]

{ #category : #Tests }
BasicEventHandlerTest >> testUnregisteringObserver [

	| handler |

	handler := BasicEventHandler of: self.

	self assert: handler observers isEmpty.

	handler registerObserver: self.
	self deny: handler observers isEmpty.

	handler unregisterObserver: self.
	self assert: handler observers isEmpty
]

{ #category : #Tests }
BasicEventHandlerTest >> testWindowsCloseEventReceived [

	| handler |

	handler := BasicEventHandler of: self.

	self deny: processTermianted.

	handler visitWindowCloseEvent: self.
	self assert: processTermianted
]
