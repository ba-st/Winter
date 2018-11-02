"
Abstract class for collisions
"
Class {
	#name : #CollisionBehavior,
	#superclass : #WinterReactiveObject,
	#instVars : [
		'firstComponent',
		'secondComponent'
	],
	#category : 'Winter-Core-Collision'
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
