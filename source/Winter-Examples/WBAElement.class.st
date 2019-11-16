"
I represent an abstract cell element


Public API and Key Messages:

- allowMovement
- die
- renderOn:
"
Class {
	#name : #WBAElement,
	#superclass : #WBAArenaComponent,
	#category : #'Winter-Examples-WizardBattle'
}

{ #category : #Testing }
WBAElement >> allowMovement [

	^ false
]

{ #category : #Actions }
WBAElement >> die [
	
]

{ #category : #Testing }
WBAElement >> initialShift [

	self subclassResponsibility
]

{ #category : #Testing }
WBAElement >> movingShift [

	^ shift - self initialShift
]

{ #category : #rendering }
WBAElement >> renderOn: canvas [
	
]
