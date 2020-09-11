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
	#name : #ScreenAnimation,
	#superclass : #GameAnimation,
	#instVars : [
		'block'
	],
	#category : #'Winter-Core-Animations'
}

{ #category : #accessing }
ScreenAnimation >> block [

	^ block
]

{ #category : #accessing }
ScreenAnimation >> block: anObject [

	block := anObject
]

{ #category : #accessing }
ScreenAnimation >> numberOfAnimationFrame [

	^ 10
]

{ #category : #evaluating }
ScreenAnimation >> step [

	actualStep \\ 10 = 0
		ifTrue: [ block value ]
]
