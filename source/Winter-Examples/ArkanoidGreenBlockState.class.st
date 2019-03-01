Class {
	#name : #ArkanoidGreenBlockState,
	#superclass : #ArkanoidBlockState,
	#category : #'Winter-Examples-Arkanoid'
}

{ #category : #Collisions }
ArkanoidGreenBlockState >> affectCollisionWithBallTo: anArkanoidBlock [

 anArkanoidBlock destroy.
]

{ #category : #Accessing }
ArkanoidGreenBlockState >> color [

	^ Color green
]

{ #category : #Accessing }
ArkanoidGreenBlockState >> sprite [

	^ game assetsManagementSystem  assetNamed: #green
]
