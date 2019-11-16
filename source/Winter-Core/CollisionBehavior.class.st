"
I am an Abstract class for collisions.


Instance Variables
- firstComponent
- secondComponent

Public API and Key Messages:

- applyOnGame
- firstComponent 
- secondComponent 
"
Class {
	#name : #CollisionBehavior,
	#superclass : #WinterReactiveObject,
	#instVars : [
		'firstComponent',
		'secondComponent'
	],
	#category : #'Winter-Core-Collision'
}

{ #category : #Evaluating }
CollisionBehavior >> applyOnGame [

	game handleCollision: self
]

{ #category : #Accessing }
CollisionBehavior >> firstComponent [

	^ firstComponent
]

{ #category : #printing }
CollisionBehavior >> printOn: aStream [

	aStream
		nextPutAll: ( 'Collission between <1p> and <2p>' expandMacrosWith: firstComponent with: secondComponent )
]

{ #category : #Accessing }
CollisionBehavior >> secondComponent [
	^ secondComponent
]
