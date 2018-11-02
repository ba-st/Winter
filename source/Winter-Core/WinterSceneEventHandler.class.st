Class {
	#name : #WinterSceneEventHandler,
	#superclass : #WinterEventHandler,
	#instVars : [
		'players',
		'schedulers'
	],
	#category : 'Winter-Core-Event-Handlers'
}

{ #category : #'as yet unclassified' }
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

{ #category : #'as yet unclassified' }
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
