"
I represent an animation on the screen

Instance Variables
- block


Public API and Key Messages:

- block
- block: 
- step
"
Class {
	#name : #WinterScreenAnimation,
	#superclass : #WinterAnimation,
	#instVars : [
		'block'
	],
	#category : #'Winter-Core2D-Base'
}

{ #category : #accessing }
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

{ #category : #evaluating }
WinterScreenAnimation >> step [

	actualStep \\ 10 = 0
		ifTrue: [ block value ]
]
