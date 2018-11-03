Class {
	#name : #WBAExplodeAnimation,
	#superclass : #WinterAnimation,
	#instVars : [
		'spell'
	],
	#category : 'Winter-Examples-WizardBattle'
}

{ #category : #Accessing }
WBAExplodeAnimation >> numberOfAnimationFrame [
	^ super numberOfAnimationFrame * 1.5
]

{ #category : #Accessing }
WBAExplodeAnimation >> spell [
	^spell
]

{ #category : #Accessing }
WBAExplodeAnimation >> spell: anObject [
	spell := anObject
]

{ #category : #Stepping }
WBAExplodeAnimation >> step [
	self isEndAnimation ifTrue: [ spell endExplodeAnimation ].
	(self isAnimationSplit: 3) ifTrue: [ spell nextSprite ]
]
