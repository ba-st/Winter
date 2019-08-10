"
I am an Abstract class for collisions.


Instance Variables
- firstComponent
- secondComponent

Public API and Key Messages:

- applyOnGame
- firstComponent 
- secondComponent 
"
Class {
	#name : #CollisionBehavior,
	#superclass : #WinterReactiveObject,
	#instVars : [
		'firstComponent',
		'secondComponent'
	],
	#category : #'Winter-Core-Collision'
}

{ #category : #Evaluating }
CollisionBehavior >> applyOnGame [
	game handleCollision: self
]

{ #category : #Accessing }
CollisionBehavior >> firstComponent [
	^ firstComponent
]

{ #category : #Accessing }
CollisionBehavior >> secondComponent [
	^ secondComponent
]
