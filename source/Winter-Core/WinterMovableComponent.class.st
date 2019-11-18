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
	#name : #WinterMovableComponent,
	#superclass : #WinterComponent,
	#instVars : [
		'sprite',
		'collisionShape'
	],
	#category : #'Winter-Core-Base'
}

{ #category : #Collisions }
WinterMovableComponent >> checkCollisions [

	"re implement if you want to do something"

	
]

{ #category : #Accessing }
WinterMovableComponent >> collisionShape [

	^ collisionShape
]

{ #category : #Accessing }
WinterMovableComponent >> collisionShape: aCollisionshape [

	collisionShape := aCollisionshape
]

{ #category : #initialization }
WinterMovableComponent >> initialize [

	super initialize.
	self
		initializeCollisionShape;
		initializeSprite;
		initializeResources
]

{ #category : #initialization }
WinterMovableComponent >> initializeCollisionShape [

	"re implement if you want to do something"

	
]

{ #category : #initialization }
WinterMovableComponent >> initializeResources [

	"re implement if you want to do something"

	
]

{ #category : #initialization }
WinterMovableComponent >> initializeSprite [

	"re implement if you want to do something"

	
]

{ #category : #Accessing }
WinterMovableComponent >> position [

	^ collisionShape position
]

{ #category : #Accessing }
WinterMovableComponent >> position: aPosition [

	collisionShape position: aPosition
]

{ #category : #Rendering }
WinterMovableComponent >> renderOn: aCanvas [

	sprite
		ifNil: [  collisionShape  renderOn: aCanvas ]
		ifNotNil: [ self renderSpriteOn: aCanvas ]
]

{ #category : #Rendering }
WinterMovableComponent >> renderSpriteOn: aCanvas [

	aCanvas pathTransform
		restoreAfter: [ aCanvas pathTransform translateBy: self translation.
			aCanvas setPaint: (sprite asAthensPaintOn: aCanvas).
			sprite drawOnAthensCanvas: aCanvas ]
]

{ #category : #Accessing }
WinterMovableComponent >> translation [

	^ self position
]

{ #category : #Events }
WinterMovableComponent >> updateUsing: aCanvas [

	collisionShape updateUsing: aCanvas.
	self checkCollisions
]
