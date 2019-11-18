"
I represent the yellow color state of a brick

Public API and Key Messages:

- affectCollisionWithBallTo:
- color
- sprite
"
Class {
	#name : #ArkanoidYellowBrickState,
	#superclass : #ArkanoidBrickState,
	#category : #'Winter-Examples-Arkanoid'
}

{ #category : #Collisions }
ArkanoidYellowBrickState >> affectCollisionWithBallTo: anArkanoidBlock [

	anArkanoidBlock changeColorStateTo: ArkanoidGreenBrickState new
]

{ #category : #Accessing }
ArkanoidYellowBrickState >> color [

	^ Color yellow 
]

{ #category : #Accessing }
ArkanoidYellowBrickState >> sprite [

	^game assetsManagementSystem  assetNamed: #yellow
]
