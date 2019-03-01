Class {
	#name : #ArkanoidRedBlockState,
	#superclass : #ArkanoidBlockState,
	#category : #'Winter-Examples-Arkanoid'
}

{ #category : #Collisions }
ArkanoidRedBlockState >> affectCollisionWithBallTo: anArkanoidBlock [

	anArkanoidBlock changeColorStateTo: ArkanoidYellowBlockState new
]

{ #category : #Accessing }
ArkanoidRedBlockState >> color [

	^ Color red
]

{ #category : #Accessing }
ArkanoidRedBlockState >> sprite [

	^ game assetsManagementSystem  assetNamed: #red
]
