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
	#name : #WinterSceneEventHandler,
	#superclass : #WinterEventHandler,
	#instVars : [
		'players',
		'schedulers'
	],
	#category : #'Winter-Core-Event-Handlers'
}

{ #category : #accessing }
WinterSceneEventHandler >> players [

	^ players
]

{ #category : #accessing }
WinterSceneEventHandler >> players: aPlayersCollection [

	players := aPlayersCollection 
]

{ #category : #accessing }
WinterSceneEventHandler >> schedulers: aSchedulersCollection [

	schedulers := aSchedulersCollection
]

{ #category : #processing }
WinterSceneEventHandler >> terminateProcesses [

	schedulers do: [ :sc | sc terminateProcess ].
]

{ #category : #visiting }
WinterSceneEventHandler >> visitKeyDownEvent: anEvent [

	players do: [ :each |
		each handleKeyDown: anEvent  ]
]

{ #category : #visiting }
WinterSceneEventHandler >> visitKeyUpEvent: anEvent [

	players do: [ :each |
		each handleKeyUp: anEvent]
]
