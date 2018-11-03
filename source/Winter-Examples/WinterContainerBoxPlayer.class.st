"
A container box being the main player of a game
"
Class {
	#name : #WinterContainerBoxPlayer,
	#superclass : #WinterPlayer,
	#category : 'Winter-Examples-Resources'
}

{ #category : #'Instance Creation' }
WinterContainerBoxPlayer class >> on: aGame [
	^ self new initializeOn: aGame
]

{ #category : #initialization }
WinterContainerBoxPlayer >> initializeCollisionShape [

	collisionShape := WinterContainerBoxShape ofBounds: (200 @ 280 extent: 200 @ 0).


]

{ #category : #initialization }
WinterContainerBoxPlayer >> initializeOn: aGame [

	game := aGame
]

{ #category : #initialization }
WinterContainerBoxPlayer >> moveLeft [
	
		collisionShape  position: collisionShape position - self stepPoint  
]

{ #category : #initialization }
WinterContainerBoxPlayer >> moveRight [
	
		collisionShape  position: collisionShape position + self stepPoint  
]

{ #category : #initialization }
WinterContainerBoxPlayer >> stepPoint [

	^ 8 @ 0
]
