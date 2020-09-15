"
I am a base class for a game. I handle the basic animation and physics simulation loop, and provide hooks for my subclasses to define application-specific behavior.

Instance Variables
- scheduler
- collisionHandlers
- screen
- scene
- rootSystem

Public API and Key Messages:

- addPlayer:
- assetsManagementSystem
- eventHandlerFor:
- extent
- handleCollision:
- renderOn:
- scene
- scene:
- scheduler
- screen
- screen:
- start
- updateUsing:





"
Class {
	#name : #Game,
	#superclass : #Object,
	#instVars : [
		'screen',
		'dimensions'
	],
	#category : #'Winter-Core-Base'
}

{ #category : #Running }
Game class >> start [

	^ self new start
]

{ #category : #Accessing }
Game >> dimensions [

	^ 650 @ 700
]

{ #category : #Accessing }
Game >> dimensions: aPoint [

	dimensions := aPoint
]

{ #category : #Accessing }
Game >> extent [
	^self screen window handle extent
]

{ #category : #'Screen Model Compatibility' }
Game >> loadWidgets [
	
]

{ #category : #printing }
Game >> printOn: aStream [

	aStream nextPutAll: self title
]

{ #category : #Rendering }
Game >> renderOn: aCanvas [ 
	
]

{ #category : #Accessing }
Game >> screen [

	screen isNil
		ifTrue: [ self buildWindow ].
	^ screen
]

{ #category : #Accessing }
Game >> screen: aScreen [ 

	screen := aScreen.
]

{ #category : #'start/stop' }
Game >> start [

	self screen show.
	
]

{ #category : #'Screen Model Compatibility' }
Game >> startAnimation [
	
]

{ #category : #'start/stop' }
Game >> stop [

	screen
		ifNotNil: [ screen terminateRendering.
			screen := nil
			].

]

{ #category : #Updating }
Game >> updateUsing: aCanvas [ 
	
]
