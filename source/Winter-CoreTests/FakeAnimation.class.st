Class {
	#name : #FakeAnimation,
	#superclass : #GameAnimation,
	#instVars : [
		'timesAnimated'
	],
	#category : #'Winter-CoreTests-Test-Resources'
}

{ #category : #accessing }
FakeAnimation >> actualStep [

	^ actualStep
]

{ #category : #initialization }
FakeAnimation >> initialize [

	super initialize.
	timesAnimated := 0
]

{ #category : #accessing }
FakeAnimation >> numberOfAnimationFrame [

	^ 10
]

{ #category : #evaluating }
FakeAnimation >> step [

	timesAnimated := timesAnimated + 1
]

{ #category : #accessing }
FakeAnimation >> timesAnimated [

	^ timesAnimated
]
