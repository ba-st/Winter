"
I represent the ball of the Arkanoid game.

Instance variables: 

- deltaPoint

Public API and Key Messages:

- checkCollisions
- checkEndGame
- negateX
- negateY
- playCollisionSound

"
Class {
	#name : #ArkanoidBall,
	#superclass : #GameMovableActor,
	#instVars : [
		'deltaPoint'
	],
	#category : #'Winter-Examples-Arkanoid'
}

{ #category : #'Instance Creation' }
ArkanoidBall class >> representedWith: aSprite [

	^ self new initializeRepresendtadWith: aSprite
]

{ #category : #Initialization }
ArkanoidBall >> initialize [

	super initialize.
	deltaPoint := 10 @ 10 negated
]

{ #category : #Initialization }
ArkanoidBall >> initializeCollisionShape [

	collisionShape := Circle 
		ofCenter: 250 @ 530
		radius: 15
		color: Color red
]

{ #category : #Initialization }
ArkanoidBall >> initializeRepresendtadWith: aSprite [

	sprite := aSprite 
]

{ #category : #Updating }
ArkanoidBall >> negateX [

	deltaPoint := deltaPoint x negated @ deltaPoint y
]

{ #category : #Updating }
ArkanoidBall >> negateY [

	deltaPoint := deltaPoint x  @ deltaPoint y negated
]

{ #category : #Reset }
ArkanoidBall >> resetPosition [

	self initialize.
]

{ #category : #Updating }
ArkanoidBall >> update [

	super update.
	collisionShape position: collisionShape position + deltaPoint
]
