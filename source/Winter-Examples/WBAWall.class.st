Class {
	#name : #WBAWall,
	#superclass : #WBAElement,
	#instVars : [
		'sprite'
	],
	#category : #'Winter-Examples-WizardBattle'
}

{ #category : #accessing }
WBAWall >> initialShift [

	^ 0@ -32
]

{ #category : #initialization }
WBAWall >> initialize [

	super initialize.

	self shift: self initialShift
]

{ #category : #rendering }
WBAWall >> renderOn: canvas [
	canvas pathTransform translateBy: shift.
	canvas setPaint: sprite.
	canvas draw.
	canvas pathTransform translateBy: negatedShift.
]

{ #category : #accessing }
WBAWall >> sprite [
	^ sprite
]

{ #category : #accessing }
WBAWall >> sprite: anObject [
	sprite := anObject
]
