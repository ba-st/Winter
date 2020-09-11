"
I represent a brick in the Arkanoid game.

Instance variables: 

- colorState

Public API and Key Messages:

- checkCollisions
- checkEndGame
- negateX
- negateY
- playCollisionSound

"
Class {
	#name : #ArkanoidBrick,
	#superclass : #GameMovableActor,
	#instVars : [
		'colorState'
	],
	#category : #'Winter-Examples-Arkanoid'
}

{ #category : #'Instance Creation' }
ArkanoidBrick class >> greenRepresentedWith: aSprite on: aPoint ofExtent: anotherPoint [

	^ self
		on: aPoint
		ofExtent: anotherPoint
		inState: ( ArkanoidGreenBrickState representedWith: aSprite )
]

{ #category : #private }
ArkanoidBrick class >> on: aPoint ofExtent: anotherPoint inState: aBlockState [

	^ self new initializeOn: aPoint ofExtent: anotherPoint inState: aBlockState
]

{ #category : #'Instance Creation' }
ArkanoidBrick class >> redRepresentedWith: aSprite on: aPoint ofExtent: anotherPoint [

	^ self
		on: aPoint
		ofExtent: anotherPoint
		inState: ( ArkanoidRedBrickState representedWith: aSprite )
]

{ #category : #'Instance Creation' }
ArkanoidBrick class >> yellowRepresentedWith: aSprite on: aPoint ofExtent: anotherPoint [

	^ self
		on: aPoint
		ofExtent: anotherPoint
		inState: ( ArkanoidYellowBrickState representedWith: aSprite )
]

{ #category : #Updating }
ArkanoidBrick >> changeColorStateTo: anArkanoidColorState [

	collisionShape color: anArkanoidColorState color.
	colorState := anArkanoidColorState.
	sprite := colorState sprite.
]

{ #category : #Collisions }
ArkanoidBrick >> collidedByBallIn: aGame [

	colorState affectCollisionWithBallTo: self in: aGame
]

{ #category : #Initialization }
ArkanoidBrick >> initializeOn: aPoint ofExtent: anotherPoint inState: aBlockState [

	collisionShape := Square ofCenter: aPoint extent: anotherPoint color: aBlockState color.
	colorState := aBlockState.
	sprite := colorState sprite
]

{ #category : #Printing }
ArkanoidBrick >> printOn: aStream [

	super printOn: aStream.
	aStream nextPutAll: ( ' - [<1p>]' expandMacrosWith: colorState color )
]
