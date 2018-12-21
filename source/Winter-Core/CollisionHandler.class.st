"
A class to handle collitions with a behavior
"
Class {
	#name : #CollisionHandler,
	#superclass : #WinterReactiveObject,
	#instVars : [
		'firstType',
		'secondType',
		'action'
	],
	#category : #'Winter-Core-Collision'
}

{ #category : #'Instance Creation' }
CollisionHandler class >> between: aType and: anotherType onCollisionDo: anAction [
	^ self new initializeBetween: aType and: anotherType onCollisionDo: anAction
]

{ #category : #Testing }
CollisionHandler >> canHandle: aCollission [

	| firstComponent secondComponent |
	
	firstComponent := aCollission firstComponent.
	secondComponent := aCollission secondComponent.
	^ ((firstComponent isKindOf: firstType) and: [ secondComponent isKindOf: secondType ])
		or: [ (secondComponent isKindOf: firstType) and: [ firstComponent isKindOf: secondType ] ]
]

{ #category : #Initialization }
CollisionHandler >> initializeBetween: aType and: anotherType onCollisionDo: anAction [

	firstType := aType.
	secondType := anotherType.
	action := anAction 
]

{ #category : #Evaluating }
CollisionHandler >> value: aCollision [
	"Se asume por ahora que son bloques de un colaborador"

	^ action value: aCollision
]
