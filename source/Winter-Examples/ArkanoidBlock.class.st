Class {
	#name : #ArkanoidBlock,
	#superclass : #WinterNonPlayer,
	#instVars : [
		'colorState'
	],
	#category : 'Winter-Examples-Arkanoid'
}

{ #category : #'Instance Creation' }
ArkanoidBlock class >> greenOn: aPoint ofExtent: anotherPoint [

	^ self on: aPoint ofExtent: anotherPoint inState: ArkanoidGreenBlockState new
]

{ #category : #private }
ArkanoidBlock class >> on: aPoint ofExtent: anotherPoint inState: aBlockState [

	^ self new initializeOn: aPoint ofExtent: anotherPoint inState: aBlockState
]

{ #category : #'Instance Creation' }
ArkanoidBlock class >> redOn: aPoint ofExtent: anotherPoint [

	^ self on: aPoint ofExtent: anotherPoint inState: ArkanoidRedBlockState new
]

{ #category : #'Instance Creation' }
ArkanoidBlock class >> yellowOn: aPoint ofExtent: anotherPoint [

	^ self on: aPoint ofExtent: anotherPoint inState: ArkanoidYellowBlockState new
]

{ #category : #Updating }
ArkanoidBlock >> changeColorStateTo: anArkanoidColorState [

	collisionShape color: anArkanoidColorState color.
	colorState := anArkanoidColorState.
	sprite := colorState sprite.
]

{ #category : #Collisions }
ArkanoidBlock >> collidedByBall [

 colorState affectCollisionWithBallTo: self.
]

{ #category : #Updating }
ArkanoidBlock >> destroy [

	scene removeComponent: self.
]

{ #category : #Initialization }
ArkanoidBlock >> initializeOn: aPoint ofExtent: anotherPoint inState: aBlockState [

	collisionShape := Winter2DSquare
		ofCenter: aPoint
		extent: anotherPoint
		color: aBlockState color
		in: game.
	colorState := aBlockState.
	sprite := colorState sprite.
]
