Class {
	#name : #ArkanoidWall,
	#superclass : #WinterNonPlayer,
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
