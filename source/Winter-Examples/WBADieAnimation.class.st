"
I represent the dying animation of a character

Instance Variables
- character


Public API and Key Messages:

- character
- character: 
- step
- numberOfAnimationFrame

"
Class {
	#name : #WBADieAnimation,
	#superclass : #GameAnimation,
	#instVars : [
		'character'
	],
	#category : #'Winter-Examples-WizardBattle'
}

{ #category : #Accessing }
WBADieAnimation >> character [
	^ character
]

{ #category : #Accessing }
WBADieAnimation >> character: aCharacter [
	character := aCharacter 
]

{ #category : #Accessing }
WBADieAnimation >> numberOfAnimationFrame [
	^ super numberOfAnimationFrame * 2
]

{ #category : #Stepping }
WBADieAnimation >> step [
	(self isAnimationSplit: 8) ifTrue: [ character dieRotation ].
	self isEndAnimation ifTrue: [ character bury ] 
]
