Class {
	#name : #CollisionOcurred,
	#superclass : #Notification,
	#instVars : [
		'firstComponent',
		'secondComponent'
	],
	#category : #'Winter-Physics-Collisions'
}

{ #category : #'magnitude protocol' }
CollisionOcurred class >> between: aComponent and: anotherComponent [

	^ self new initializeBetween: aComponent and: anotherComponent
]

{ #category : #'magnitude protocol' }
CollisionOcurred class >> of: aComponent onWindowAxis: anAxisSymbol [

	^ self between: aComponent and: anAxisSymbol
]

{ #category : #Accessing }
CollisionOcurred >> firstComponent [

	^ firstComponent
]

{ #category : #initialization }
CollisionOcurred >> initializeBetween: aComponent and: anotherComponent [

	firstComponent := aComponent.
	secondComponent := anotherComponent.
	messageText := 'A collision ocurred'
]

{ #category : #Accessing }
CollisionOcurred >> secondComponent [

	^ secondComponent
]
