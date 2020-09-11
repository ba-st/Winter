"
I represent a handler for user inputs during the scene game

Collaborators: 

- players
- schedulers

Public API and Key Messages:

- players
- players:
- schedulers:
- terminateProcesses
- visitKeyUpEvent:
- visitKeyDownEvent:
"
Class {
	#name : #SceneEventHandler,
	#superclass : #BasicEventHandler,
	#instVars : [
		'players',
		'schedulers'
	],
	#category : #'Winter-Core-Event-Handlers'
}

{ #category : #accessing }
SceneEventHandler >> players [

	^ players
]

{ #category : #accessing }
SceneEventHandler >> players: aPlayersCollection [

	players := aPlayersCollection 
]

{ #category : #printing }
SceneEventHandler >> printOn: aStream [

	aStream nextPutAll: 'Scene keywords events handler'
]

{ #category : #accessing }
SceneEventHandler >> schedulers: aSchedulersCollection [

	schedulers := aSchedulersCollection
]

{ #category : #processing }
SceneEventHandler >> terminateProcesses [

	schedulers do: [ :sc | sc terminateProcess ].
]

{ #category : #visiting }
SceneEventHandler >> visitKeyDownEvent: anEvent [

	players do: [ :each |
		each handleKeyDown: anEvent  ]
]

{ #category : #visiting }
SceneEventHandler >> visitKeyUpEvent: anEvent [

	players do: [ :each |
		each handleKeyUp: anEvent]
]
