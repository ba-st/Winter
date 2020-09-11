"
I represent an Abstract class for os event handler

Collaborators: 


Public API and Key Messages:

- terminateProcesses
- visitWindowCloseEvent:
"
Class {
	#name : #BasicEventHandler,
	#superclass : #OSWindowEventVisitor,
	#instVars : [
		'observers',
		'game'
	],
	#category : #'Winter-Core-Event-Handlers'
}

{ #category : #'instance creation' }
BasicEventHandler class >> of: aGame [

	^ self new initializeOf: aGame
]

{ #category : #initialization }
BasicEventHandler >> initializeOf: aGame [

	game := aGame.
	observers := Set new.
]

{ #category : #Accessing }
BasicEventHandler >> observers [

	^ observers
]

{ #category : #printing }
BasicEventHandler >> printOn: aStream [

	aStream nextPutAll: 'Basic keywords events handler'
]

{ #category : #'Observer management' }
BasicEventHandler >> registerObserver: anOberver [

	observers add: anOberver
]

{ #category : #processing }
BasicEventHandler >> terminateProcesses [

	game stop 
]

{ #category : #'Observer management' }
BasicEventHandler >> unregisterObserver: anOberver [

	observers remove: anOberver ifAbsent: [  ]
]

{ #category : #'Input handling' }
BasicEventHandler >> visitKeyDownEvent: anEvent [

	observers do: [ :each | each handleKeyDown: anEvent ]
]

{ #category : #'Input handling' }
BasicEventHandler >> visitKeyUpEvent: anEvent [

	observers do: [ :each | each handleKeyUp: anEvent ]
]

{ #category : #'Input handling' }
BasicEventHandler >> visitWindowCloseEvent: anEvent [
	self terminateProcesses.
	"Smalltalk snapshot: false andQuit: true"
	
]
