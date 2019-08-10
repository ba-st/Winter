"
I am the base class for game elements that are updated in the game.


Instance Variables
- game

Public API and Key Messages:

- game
- game:
- updateUsing:
"
Class {
	#name : #WinterReactiveObject,
	#superclass : #Object,
	#instVars : [
		'game'
	],
	#category : #'Winter-Core-Base'
}

{ #category : #Accessing }
WinterReactiveObject >> game [

	^game
]

{ #category : #Accessing }
WinterReactiveObject >> game: aGame [

	game := aGame
]

{ #category : #events }
WinterReactiveObject >> updateUsing: aCanvas [

	
]
