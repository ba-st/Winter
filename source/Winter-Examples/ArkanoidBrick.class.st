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
	#superclass : #WinterNonPlayer,
	#instVars : [
		'colorState'
	],
	#category : #'Winter-Examples-Arkanoid'
}

{ #category : #'Instance Creation' }
ArkanoidBrick class >> greenOn: aPoint ofExtent: anotherPoint [

	^ self on: aPoint ofExtent: anotherPoint inState: ArkanoidGreenBrickState new
]

{ #category : #private }
ArkanoidBrick class >> on: aPoint ofExtent: anotherPoint inState: aBlockState [

	^ self new initializeOn: aPoint ofExtent: anotherPoint inState: aBlockState
]

{ #category : #'Instance Creation' }
ArkanoidBrick class >> redOn: aPoint ofExtent: anotherPoint [

	^ self on: aPoint ofExtent: anotherPoint inState: ArkanoidRedBrickState new
]

{ #category : #'Instance Creation' }
ArkanoidBrick class >> yellowOn: aPoint ofExtent: anotherPoint [

	^ self on: aPoint ofExtent: anotherPoint inState: ArkanoidYellowBrickState new
]

{ #category : #Updating }
ArkanoidBrick >> changeColorStateTo: anArkanoidColorState [

	collisionShape color: anArkanoidColorState color.
	colorState := anArkanoidColorState.
	sprite := colorState sprite.
]

{ #category : #Collisions }
ArkanoidBrick >> collidedByBall [

	colorState affectCollisionWithBallTo: self
]

{ #category : #Updating }
ArkanoidBrick >> destroy [

	scene removeComponent: self.
]

{ #category : #Initialization }
ArkanoidBrick >> initializeOn: aPoint ofExtent: anotherPoint inState: aBlockState [

	collisionShape := Winter2DSquare
		ofCenter: aPoint
		extent: anotherPoint
		color: aBlockState color
		in: game.
	colorState := aBlockState.
	sprite := colorState sprite
]

{ #category : #Printing }
ArkanoidBrick >> printOn: aStream [

	super printOn: aStream.
	aStream nextPutAll: ( ' - [<1p>]' expandMacrosWith: colorState color )
]
