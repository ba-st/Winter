"
Represents a general animation
"
Class {
	#name : #WinterAnimation,
	#superclass : #Object,
	#instVars : [
		'actualStep'
	],
	#category : #'Winter-Core2D'
}

{ #category : #'as yet unclassified' }
WinterAnimation >> animate [

	actualStep := actualStep + 1.
	self step
]

{ #category : #'as yet unclassified' }
WinterAnimation >> initialStep: aValue [

	actualStep  := aValue

	
]

{ #category : #'as yet unclassified' }
WinterAnimation >> initialize [

	super initialize.
	actualStep := 0
]

{ #category : #'as yet unclassified' }
WinterAnimation >> isAnimationSplit: x [ 

	"if x is 8, answers true every 8th of operation"
	^ actualStep  \\ (self numberOfAnimationFrame // x) = 0
]

{ #category : #'as yet unclassified' }
WinterAnimation >> isEndAnimation [

	^ actualStep  = self numberOfAnimationFrame
]

{ #category : #'as yet unclassified' }
WinterAnimation >> isMidAnimation [

	^ actualStep  = (self numberOfAnimationFrame // 2)
]

{ #category : #'as yet unclassified' }
WinterAnimation >> numberOfAnimationFrame [

	^ 16
]

{ #category : #'as yet unclassified' }
WinterAnimation >> step [

	"Should reImplement"

	
]
