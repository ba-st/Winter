Class {
	#name : #ArkanoidYellowBlockState,
	#superclass : #ArkanoidBlockState,
	#category : #'Winter-Examples-Arkanoid'
}

{ #category : #Collisions }
ArkanoidYellowBlockState >> affectCollisionWithBallTo: anArkanoidBlock [

	anArkanoidBlock changeColorStateTo: ArkanoidGreenBlockState new
]

{ #category : #Accessing }
ArkanoidYellowBlockState >> color [

	^ Color yellow 
]

{ #category : #Accessing }
ArkanoidYellowBlockState >> sprite [

	^game assetsManagementSystem  assetNamed: #yellow
]
