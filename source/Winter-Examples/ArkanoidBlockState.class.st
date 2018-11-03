Class {
	#name : #ArkanoidBlockState,
	#superclass : #WinterReactiveObject,
	#category : 'Winter-Examples-Arkanoid'
}

{ #category : #Collisions }
ArkanoidBlockState >> affectCollisionWithBallTo: anArkanoidBlock [

	self subclassResponsibility
]

{ #category : #Accessing }
ArkanoidBlockState >> color [

	self subclassResponsibility
]

{ #category : #Accessing }
ArkanoidBlockState >> sprite [

	self subclassResponsibility
]
