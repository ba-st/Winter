Class {
	#name : #ArkanoidPlayer,
	#superclass : #WinterPlayer,
	#category : #'Winter-Examples-Arkanoid'
}

{ #category : #'Instance Creation' }
ArkanoidPlayer class >> on: aGame [
	^ self new initializeOn: aGame
]

{ #category : #Accessing }
ArkanoidPlayer >> arkanoidBarSprite [
	^ WinterAssetManagementSystem current spriteNamed: #arkanoidBar
]

{ #category : #Collisions }
ArkanoidPlayer >> checkCollisions [

	(CollisionAgainstMapBordersChecker for: self)
		value: #x
]

{ #category : #Initialization }
ArkanoidPlayer >> initializeCollisionShape [

	collisionShape := Winter2DSquare ofCenter: 200 @ 560 extent: 200 @ 0 color: Color red in: game 
]

{ #category : #Initialization }
ArkanoidPlayer >> initializeOn: aGame [
	game := aGame.
	collisionShape game: game.
	sprite := self arkanoidBarSprite.
	
]

{ #category : #Initialization }
ArkanoidPlayer >> initializeSprite [

	sprite := WinterAssetManagementSystem current spriteNamed: #arkanoidBar
	
]

{ #category : #Movement }
ArkanoidPlayer >> moveLeft [

	| newX |

	newX := (self positionX - 10)  max: 0.
	collisionShape position: newX @ self positionY
]

{ #category : #Movement }
ArkanoidPlayer >> moveRight [

	| newX |
	
	newX := (self positionX + 10 )  min: 626.
	collisionShape position: newX @ self positionY
]

{ #category : #Accessing }
ArkanoidPlayer >> positionX [

	^ self position x
]

{ #category : #Accessing }
ArkanoidPlayer >> positionY [

	^ self position y
]

{ #category : #Reset }
ArkanoidPlayer >> resetPosition [

	collisionShape position: 200 @ 560
]

{ #category : #Movement }
ArkanoidPlayer >> startGame [

	game playing: true
]
