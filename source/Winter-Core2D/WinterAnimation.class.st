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
	#name : #WinterAnimation,
	#superclass : #Object,
	#instVars : [
		'actualStep'
	],
	#category : #'Winter-Core2D-Base'
}

{ #category : #evaluating }
WinterAnimation >> animate [

	actualStep := actualStep + 1.
	self step
]

{ #category : #accessing }
WinterAnimation >> initialStep: aValue [

	actualStep  := aValue

	
]

{ #category : #initialization }
WinterAnimation >> initialize [

	super initialize.
	actualStep := 0
]

{ #category : #testing }
WinterAnimation >> isAnimationSplit: x [ 

	"if x is 8, answers true every 8th of operation"
	^ actualStep  \\ (self numberOfAnimationFrame // x) = 0
]

{ #category : #testing }
WinterAnimation >> isEndAnimation [

	^ actualStep  = self numberOfAnimationFrame
]

{ #category : #testing }
WinterAnimation >> isMidAnimation [

	^ actualStep  = (self numberOfAnimationFrame // 2)
]

{ #category : #accessing }
WinterAnimation >> numberOfAnimationFrame [

	^ 16
]

{ #category : #evaluating }
WinterAnimation >> step [

	self subclassResponsibility
]
