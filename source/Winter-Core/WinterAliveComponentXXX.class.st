Class {
	#name : #WinterAliveComponentXXX,
	#superclass : #WinterComponent,
	#instVars : [
		'sprite',
		'collisionShape'
	],
	#category : #'Winter-Core-Base'
}

{ #category : #Accessing }
WinterAliveComponentXXX >> collisionShape [

	^ collisionShape
]

{ #category : #Accessing }
WinterAliveComponentXXX >> collisionShape: aCollisionshape [

	collisionShape := aCollisionshape
]

{ #category : #initialization }
WinterAliveComponentXXX >> initialize [

	super initialize.
	self
		initializeCollisionShape;
		initializeSprite;
		initializeResources
]

{ #category : #Accessing }
WinterAliveComponentXXX >> position [

	^ collisionShape position
]

{ #category : #Accessing }
WinterAliveComponentXXX >> position: aPosition [

	collisionShape position: aPosition
]

{ #category : #Rendering }
WinterAliveComponentXXX >> renderOn: aCanvas [

	sprite
		ifNil: [  collisionShape  renderOn: aCanvas ]
		ifNotNil: [ self renderSpriteOn: aCanvas ]
]

{ #category : #Rendering }
WinterAliveComponentXXX >> renderSpriteOn: aCanvas [

	aCanvas pathTransform
		restoreAfter: [ aCanvas pathTransform translateBy: self translation.
			aCanvas setPaint: (sprite asAthensPaintOn: aCanvas).
			sprite drawOnAthensCanvas: aCanvas ]
]

{ #category : #Accessing }
WinterAliveComponentXXX >> translation [

	^ self position
]

{ #category : #Events }
WinterAliveComponentXXX >> updateUsing: aCanvas [

	collisionShape updateUsing: aCanvas.
	self checkCollisions
]
