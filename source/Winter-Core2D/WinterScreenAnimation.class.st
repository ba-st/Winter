"
Represents an animation on the screen
"
Class {
	#name : #WinterScreenAnimation,
	#superclass : #WinterAnimation,
	#instVars : [
		'block'
	],
	#category : #'Winter-Core2D-Base'
}

{ #category : #'as yet unclassified' }
WinterScreenAnimation >> block [

	^ block
]

{ #category : #accessing }
WinterScreenAnimation >> block: anObject [

	block := anObject
]

{ #category : #accessing }
WinterScreenAnimation >> numberOfAnimationFrame [

	^ 10
]

{ #category : #'as yet unclassified' }
WinterScreenAnimation >> step [

	actualStep  \\ 10 = 0 ifTrue: [ block value ]
]
