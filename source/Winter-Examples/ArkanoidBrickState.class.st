"
I represent an abstract color state of a brick

Public API and Key Messages:

- affectCollisionWithBallTo:
- color
- sprite

"
Class {
	#name : #ArkanoidBrickState,
	#superclass : #GameActor,
	#instVars : [
		'sprite'
	],
	#category : #'Winter-Examples-Arkanoid'
}

{ #category : #'as yet unclassified' }
ArkanoidBrickState class >> representedWith: aSprite [

	^ self new initializeRepresendtadWith: aSprite
]

{ #category : #Collisions }
ArkanoidBrickState >> affectCollisionWithBallTo: anArkanoidBlock in: aGame [

	self subclassResponsibility
]

{ #category : #Accessing }
ArkanoidBrickState >> color [

	self subclassResponsibility
]

{ #category : #Accessing }
ArkanoidBrickState >> initializeRepresendtadWith: aSprite [

	sprite := aSprite
]

{ #category : #Accessing }
ArkanoidBrickState >> printOn: aStream [

	aStream nextPutAll: ( 'ArkanoidBrickState - [<1p>]' expandMacrosWith: self color )
]

{ #category : #Accessing }
ArkanoidBrickState >> sprite [

	^ sprite
]
