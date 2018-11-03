Class {
	#name : #WBADieAnimation,
	#superclass : #WinterAnimation,
	#instVars : [
		'character'
	],
	#category : 'Winter-Examples-WizardBattle'
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
