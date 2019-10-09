"
I am a class to check if theres is a collision between 2 components.


Instance Variables
- firstComponent 
- secondComponent  


Public API and Key Messages:

- value
"
Class {
	#name : #CollisionChecker,
	#superclass : #WinterReactiveObject,
	#instVars : [
		'firstComponent',
		'secondComponent'
	],
	#category : #'Winter-Core-Collision'
}

{ #category : #'Instance Creation' }
CollisionChecker class >> for: aComponent and: anotherComponent [
	^ self new initializeFor: aComponent and: anotherComponent
]

{ #category : #Initialization }
CollisionChecker >> initializeFor: aComponent and: anotherComponent [
	firstComponent := aComponent.
	secondComponent := anotherComponent
]

{ #category : #printing }
CollisionChecker >> printOn: aStream [

	aStream
		nextPutAll:
			('Collission checker for <1s> against <2>'
				expandMacrosWith: firstComponent  printString with: secondComponent printString)
]

{ #category : #Evaluating }
CollisionChecker >> value [

	(firstComponent collisionShape intersects: secondComponent collisionShape)
		ifTrue: [ (Collision between: firstComponent and: secondComponent) applyOnGame ]
]
