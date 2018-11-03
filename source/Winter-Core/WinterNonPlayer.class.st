"
Active element in a game, not controlled by the user
"
Class {
	#name : #WinterNonPlayer,
	#superclass : #WinterComponent,
	#instVars : [
		'sprite',
		'collisionShape'
	],
	#category : 'Winter-Core-Base'
}

{ #category : #Collisions }
WinterNonPlayer >> checkCollisions [

	"Should be reimplemented"

	
]

{ #category : #Accessing }
WinterNonPlayer >> collisionShape [
	^ collisionShape 
]

{ #category : #Accessing }
WinterNonPlayer >> collisionShape: aCollisionshape [
	collisionShape := aCollisionshape 
]

{ #category : #Events }
WinterNonPlayer >> eventUpdated: anEvent [

	self updateCollisionShapeUsing: anEvent  .
	self checkCollisions.
]

{ #category : #initialization }
WinterNonPlayer >> initialize [

	super initialize.
	self
		initializeCollisionShape;
		initializeSprite;
		initializeResources
]

{ #category : #initialization }
WinterNonPlayer >> initializeCollisionShape [

	"Should be re implementd"

	
]

{ #category : #initialization }
WinterNonPlayer >> initializeResources [

	"Should be re implementd"

	
]

{ #category : #initialization }
WinterNonPlayer >> initializeSprite [

	"Should be re implementd"

	
]

{ #category : #Accessing }
WinterNonPlayer >> position [
	^ collisionShape position
]

{ #category : #Accessing }
WinterNonPlayer >> position: aPosition [
	collisionShape position: aPosition
]

{ #category : #Rendering }
WinterNonPlayer >> renderOn: aCanvas [

	sprite
		ifNil: [  collisionShape  renderOn: aCanvas ]
		ifNotNil: [ self renderSpriteOn: aCanvas ]
]

{ #category : #Rendering }
WinterNonPlayer >> renderSpriteOn: aCanvas [

	aCanvas pathTransform
		restoreAfter: [ aCanvas pathTransform translateBy: self translation.
			aCanvas setPaint: (sprite asAthensPaintOn: aCanvas).
			sprite drawOnAthensCanvas: aCanvas ]
]

{ #category : #Accessing }
WinterNonPlayer >> translation [

	^ self position
]

{ #category : #Events }
WinterNonPlayer >> updateCollisionShapeUsing: anEvent [

	collisionShape eventUpdated: anEvent
]

{ #category : #Events }
WinterNonPlayer >> updateUsing: aCanvas [

	collisionShape updateUsing: aCanvas.
	self checkCollisions.
]
