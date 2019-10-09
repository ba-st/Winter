"
I represent an abstract color state of a brick

Public API and Key Messages:

- affectCollisionWithBallTo:
- color
- sprite

"
Class {
	#name : #ArkanoidBrickState,
	#superclass : #WinterReactiveObject,
	#category : #'Winter-Examples-Arkanoid'
}

{ #category : #Collisions }
ArkanoidBrickState >> affectCollisionWithBallTo: anArkanoidBlock [

	self subclassResponsibility
]

{ #category : #Accessing }
ArkanoidBrickState >> color [

	self subclassResponsibility
]

{ #category : #Accessing }
ArkanoidBrickState >> printOn: aStream [

	aStream
		nextPutAll:
			('ArkanoidBrickState - [<1s>]'
				expandMacrosWith: self color printString)
]

{ #category : #Accessing }
ArkanoidBrickState >> sprite [

	self subclassResponsibility
]
