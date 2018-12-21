"
I am the base class for game elements that react to events in the game.
"
Class {
	#name : #WinterReactiveObject,
	#superclass : #Object,
	#instVars : [
		'game'
	],
	#category : #'Winter-Core-Base'
}

{ #category : #events }
WinterReactiveObject >> eventUpdated: anEvent [
	
]

{ #category : #Accessing }
WinterReactiveObject >> game [

	^game
]

{ #category : #Accessing }
WinterReactiveObject >> game: aGame [

	game := aGame
]

{ #category : #events }
WinterReactiveObject >> handleEvent: anEvent [

	anEvent execute: self. 
	
]

{ #category : #events }
WinterReactiveObject >> updateUsing: aCanvas [

	
]
