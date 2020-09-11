"
I represent a wall used as borders of the scene. I can be at horizonal or vertical position. 


Public API and Key Messages:

- isHorizontal
"
Class {
	#name : #ArkanoidWall,
	#superclass : #GameMovableActor,
	#category : #'Winter-Examples-Arkanoid'
}

{ #category : #'Instance Creation' }
ArkanoidWall class >> ofCenter: aPoint extent: anotherPoint andColor: aColor [

	^ self new initializeOfCenter: aPoint extent: anotherPoint andColor: aColor
]

{ #category : #Initialization }
ArkanoidWall >> initializeCollisionShape [

	collisionShape := WinterBoldWallShape new
]

{ #category : #Initialization }
ArkanoidWall >> initializeOfCenter: aPoint extent: anotherPoint andColor: aColor [

	collisionShape position: aPoint ; extent: anotherPoint ; color: aColor 
]

{ #category : #Testing }
ArkanoidWall >> isHorizontal [

	^ collisionShape position y = collisionShape extent y
]

{ #category : #Printing }
ArkanoidWall >> printOn: aStream [

	super printOn: aStream.
	aStream
		nextPutAll:
			(' - <1s>'
				expandMacrosWith:
					(self isHorizontal
						ifTrue: [ 'Horizontal' ]
						ifFalse: [ 'Vertical' ]))
]
