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
	#name : #WinterNonPlayer,
	#superclass : #WinterAliveComponentXXX,
	#category : #'Winter-Core-Base'
}

{ #category : #Collisions }
WinterNonPlayer >> checkCollisions [

	"Should be reimplemented"

	
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

{ #category : #printing }
WinterNonPlayer >> printOn: aStream [

	aStream
		nextPutAll: ('<1s> - position [<2s>]' expandMacrosWith: self class name with: self position)
]
