"
I represent the red color state of a brick

Public API and Key Messages:

- affectCollisionWithBallTo:
- color
- sprite
"
Class {
	#name : #ArkanoidRedBrickState,
	#superclass : #ArkanoidBrickState,
	#category : #'Winter-Examples-Arkanoid'
}

{ #category : #Collisions }
ArkanoidRedBrickState >> affectCollisionWithBallTo: anArkanoidBlock [

	anArkanoidBlock changeColorStateTo: ArkanoidYellowBrickState new
]

{ #category : #Accessing }
ArkanoidRedBrickState >> color [

	^ Color red
]

{ #category : #Accessing }
ArkanoidRedBrickState >> sprite [

	^ game assetsManagementSystem  assetNamed: #red
]
