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
	#name : #ConfigurableAnimation,
	#superclass : #GameAnimation,
	#instVars : [
		'block',
		'numberOfAnimationFrame'
	],
	#category : #'Winter-Core-Animations'
}

{ #category : #'instance creation' }
ConfigurableAnimation class >> doing: aBlock every: aNumberOfGameCycles [

	^ self new initializeDoing: aBlock every: aNumberOfGameCycles
]

{ #category : #initialization }
ConfigurableAnimation >> initializeDoing: aBlock every: aNumberOfGameCycles [

	block := aBlock.
	numberOfAnimationFrame := aNumberOfGameCycles
]

{ #category : #accessing }
ConfigurableAnimation >> numberOfAnimationFrame [

	^numberOfAnimationFrame
]

{ #category : #evaluating }
ConfigurableAnimation >> step [

	actualStep \\ numberOfAnimationFrame = 0
		ifTrue: [ block value ]
]
