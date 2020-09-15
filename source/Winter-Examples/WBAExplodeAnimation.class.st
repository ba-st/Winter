"
I represent the exploding animation of a spell

Instance Variables
- spell


Public API and Key Messages:

- spell
- spell: 
- step
- numberOfAnimationFrame

"
Class {
	#name : #WBAExplodeAnimation,
	#superclass : #GameAnimation,
	#instVars : [
		'spell'
	],
	#category : #'Winter-Examples-WizardBattle'
}

{ #category : #Accessing }
WBAExplodeAnimation >> numberOfAnimationFrame [

	^ 16 * 1.5
]

{ #category : #Accessing }
WBAExplodeAnimation >> spell [

	^ spell
]

{ #category : #Accessing }
WBAExplodeAnimation >> spell: anObject [

	spell := anObject
]

{ #category : #Stepping }
WBAExplodeAnimation >> step [

	self isEndAnimation
		ifTrue: [ spell endExplodeAnimation ].
	( self isAnimationSplit: 3 )
		ifTrue: [ spell nextSprite ]
]
