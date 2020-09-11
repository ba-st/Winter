"
I am a class to represent active elements in a game, not controlled by the user

Instance Variables
- sprite
- collisionShape 


Public API and Key Messages:

- collisionShape
- collisionShape:
- position
- position:
- renderOn:
- updateUsing:

"
Class {
	#name : #GameMovableActor,
	#superclass : #GameActor,
	#instVars : [
		'sprite',
		'collisionShape'
	],
	#category : #'Winter-Core-Base'
}

{ #category : #Collisions }
GameMovableActor >> checkCollisions [

	"re implement if you want to do something"

	
]

{ #category : #Accessing }
GameMovableActor >> collisionShape [

	^ collisionShape
]

{ #category : #Accessing }
GameMovableActor >> collisionShape: aCollisionshape [

	collisionShape := aCollisionshape
]

{ #category : #initialization }
GameMovableActor >> initialize [

	super initialize.
	self
		initializeCollisionShape;
		initializeSprite;
		initializeResources
]

{ #category : #initialization }
GameMovableActor >> initializeCollisionShape [

	"re implement if you want to do something"

	
]

{ #category : #initialization }
GameMovableActor >> initializeResources [

	"re implement if you want to do something"

	
]

{ #category : #initialization }
GameMovableActor >> initializeSprite [

	"re implement if you want to do something"

	
]

{ #category : #Accessing }
GameMovableActor >> position [

	^ collisionShape position
]

{ #category : #Accessing }
GameMovableActor >> position: aPosition [

	collisionShape position: aPosition
]

{ #category : #Rendering }
GameMovableActor >> renderOn: aCanvas [

	sprite
		ifNil: [  collisionShape  renderOn: aCanvas ]
		ifNotNil: [ self renderSpriteOn: aCanvas ]
]

{ #category : #Rendering }
GameMovableActor >> renderSpriteOn: aCanvas [

	aCanvas pathTransform
		restoreAfter: [ aCanvas pathTransform translateBy: self translation.
			aCanvas setPaint: (sprite asAthensPaintOn: aCanvas).
			sprite drawOnAthensCanvas: aCanvas ]
]

{ #category : #Accessing }
GameMovableActor >> translation [

	^ self position
]

{ #category : #Events }
GameMovableActor >> update [

	self checkCollisions
]
