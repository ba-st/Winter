Class {
	#name : #WBAMoveAnimation,
	#superclass : #WinterAnimation,
	#instVars : [
		'shiftIncr'
	],
	#category : 'Winter-Examples-WizardBattle'
}

{ #category : #Accessing }
WBAMoveAnimation >> cellSize [
	^ 48@32
]

{ #category : #Accessing }
WBAMoveAnimation >> direction: index [
	shiftIncr := self shiftIncrForDirection: index
]

{ #category : #initialization }
WBAMoveAnimation >> initialStep: startStep [
	super initialStep: startStep.
	self movingElement shiftBy: (startStep * shiftIncr)
]

{ #category : #Accessing }
WBAMoveAnimation >> movingElement [
	self subclassResponsibility 
]

{ #category : #Accessing }
WBAMoveAnimation >> shiftIncrForDirection: index [
	"Maps the direction to the base deplacement in the graphics axis
	1 (down) -> 0@ -2.
	2 (left) -> 3@0.
	3 (right) -> -3 @0.
	4 (up) -> 0@2 "
	
	^ index \\ 3 - 1 @ (index // 2 - 1) * self cellSize / self numberOfAnimationFrame
]

{ #category : #Stepping }
WBAMoveAnimation >> step [
	self movingElement shiftBy: shiftIncr.
	self isMidAnimation ifTrue: [ self midAnimation ].
	self isEndAnimation ifTrue: [ self movingElement finishMoveAnimation ] 
]
