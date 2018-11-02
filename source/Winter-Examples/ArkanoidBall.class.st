Class {
	#name : #ArkanoidBall,
	#superclass : #WinterNonPlayer,
	#instVars : [
		'deltaPoint'
	],
	#category : 'Winter-Examples-Arkanoid'
}

{ #category : #'Instance Creation' }
ArkanoidBall class >> on: aGame [

	^ self new initializeOn: aGame
]

{ #category : #Collisions }
ArkanoidBall >> checkCollisions [

	(CollisionChecker for: self and: scene player) value.
	scene components
		do: [ :component | 
			component = self
				ifFalse: [ (CollisionChecker for: self and: component) value ] ].
	self checkEnfGame
]

{ #category : #Collisions }
ArkanoidBall >> checkEnfGame [
	self position y > game screen extentY
		ifTrue: [ game resetPlayerAndBall: self ]
]

{ #category : #Initialization }
ArkanoidBall >> initialize [

	super initialize.
	deltaPoint := 10 @ 10 negated  
]

{ #category : #Initialization }
ArkanoidBall >> initializeCollisionShape [

	collisionShape := Winter2DCircle ofCenter: 250 @ 530 radius: 15 color: Color red in: game 
]

{ #category : #Initialization }
ArkanoidBall >> initializeOn: aGame [

	game := aGame
]

{ #category : #Initialization }
ArkanoidBall >> initializeSprite [

	sprite := WinterAssetManagementSystem current spriteNamed: #ball
]

{ #category : #Updating }
ArkanoidBall >> negateX [

	deltaPoint := deltaPoint x negated @ deltaPoint y
]

{ #category : #Updating }
ArkanoidBall >> negateY [

	deltaPoint := deltaPoint x  @ deltaPoint y negated
]

{ #category : #Collisions }
ArkanoidBall >> playCollisionSound [

	(WinterAssetManagementSystem current soundNamed: #ballCollision) play
]

{ #category : #Reset }
ArkanoidBall >> resetPosition [

	self initialize.
	collisionShape position: 250 @ 530
]

{ #category : #Events }
ArkanoidBall >> updateCollisionShapeUsing: anEvent [

	game playing
		ifTrue: [ collisionShape updatePositionBy: deltaPoint ]
]
