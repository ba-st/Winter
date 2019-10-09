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
ArkanoidGreenBrickState >> affectCollisionWithBallTo: anArkanoidBlock [

  anArkanoidBlock destroy.
]

{ #category : #Accessing }
ArkanoidGreenBrickState >> color [

	^ Color green
]

{ #category : #Accessing }
ArkanoidGreenBrickState >> sprite [

	^ game assetsManagementSystem  assetNamed: #green
]
