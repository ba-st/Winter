"
Class for collison with borders
"
Class {
	#name : #CollisionAgainstMapBorders,
	#superclass : #CollisionBehavior,
	#instVars : [
		'axisSymbol'
	],
	#category : #'Winter-Core-Collision'
}

{ #category : #'Instance Creation' }
CollisionAgainstMapBorders class >> of: aComponent on: anAxisSymbol [
	^ self new initializeOf: aComponent on: anAxisSymbol
]

{ #category : #Accessing }
CollisionAgainstMapBorders >> axisSymbol [
	^ axisSymbol
]

{ #category : #Initialization }
CollisionAgainstMapBorders >> initializeOf: aComponent on: anAxisSymbol [
	game := aComponent game.
	firstComponent := aComponent.
	secondComponent := game screen.
	axisSymbol := anAxisSymbol
]
