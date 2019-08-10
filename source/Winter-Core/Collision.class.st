"
I am a basic class for Collision between 2 components.

"
Class {
	#name : #Collision,
	#superclass : #CollisionBehavior,
	#category : #'Winter-Core-Collision'
}

{ #category : #'Instance Creation' }
Collision class >> between: aComponent and: anotherComponent [
	^ self new initializeBetween: aComponent and: anotherComponent
]

{ #category : #Initialization }
Collision >> initializeBetween: aComponent and: anotherComponent [

	game := aComponent game.
	firstComponent := aComponent.
	secondComponent := anotherComponent
]
