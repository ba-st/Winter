"
I represent the green color state of a brick

Public API and Key Messages:

- affectCollisionWithBallTo:
- color
- sprite
"
Class {
	#name : #ArkanoidGreenBrickState,
	#superclass : #ArkanoidBrickState,
	#category : #'Winter-Examples-Arkanoid'
}

{ #category : #Collisions }
ArkanoidGreenBrickState >> affectCollisionWithBallTo: anArkanoidBlock in: aGame [

	aGame removeActor: anArkanoidBlock
]

{ #category : #Accessing }
ArkanoidGreenBrickState >> color [

	^ Color green
]
