"
I represent an abstract class for Animations in the game

Instance Variables
- actualStep


Public API and Key Messages:

- animate
- initialStep: 
- isAnimationSplit:
- isEndAnimation
- isMidAnimation
- step
"
Class {
	#name : #GameAnimation,
	#superclass : #Object,
	#instVars : [
		'actualStep'
	],
	#category : #'Winter-Core-Animations'
}

{ #category : #evaluating }
GameAnimation >> animate [

	actualStep := actualStep + 1.
	self step
]

{ #category : #accessing }
GameAnimation >> initialStep: aValue [

	actualStep  := aValue

	
]

{ #category : #initialization }
GameAnimation >> initialize [

	super initialize.
	actualStep := 0
]

{ #category : #testing }
GameAnimation >> isAnimationSplit: x [ 

	"if x is 8, answers true every 8th of operation"
	^ actualStep  \\ (self numberOfAnimationFrame // x) = 0
]

{ #category : #testing }
GameAnimation >> isEndAnimation [

	^ actualStep  = self numberOfAnimationFrame
]

{ #category : #testing }
GameAnimation >> isMidAnimation [

	^ actualStep  = (self numberOfAnimationFrame // 2)
]

{ #category : #accessing }
GameAnimation >> numberOfAnimationFrame [

	^ 16
]

{ #category : #evaluating }
GameAnimation >> step [

	self subclassResponsibility
]
