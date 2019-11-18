"
I am a class to handle collissions with a given behavior


Instance Variables
- firstType 
- secondType 
- action


Public API and Key Messages:

- canHandle:
- value:
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

{ #category : #printing }
CollisionHandler >> printOn: aStream [

	aStream
		nextPutAll:
			('Collission handler for type of: <1s> and type of: <2>'
				expandMacrosWith: firstType   printString with: secondType  printString)
]

{ #category : #Evaluating }
CollisionHandler >> value: aCollision [

	^ action cull: aCollision
]
