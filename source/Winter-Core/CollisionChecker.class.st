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

{ #category : #Evaluating }
CollisionChecker >> checkFor: aComponent and: anotherComponent [

	( aComponent collisionShape intersects: anotherComponent collisionShape )
		ifTrue: [ ( Collision between: aComponent and: anotherComponent ) applyOnGame ]
]

{ #category : #printing }
CollisionChecker >> printOn: aStream [

	aStream nextPutAll: 'Collission checker'
]
