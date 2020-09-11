"
I represent the arkanoid player or bar

Public API and Key Messages:

- arkanoidBarSprite
- checkCollisions
- moveLeft
- moveRight
- positionX
- positionY
- resetPosition
- startGame
"
Class {
	#name : #ArkanoidPlayer,
	#superclass : #GameInteractiveMovableActor,
	#category : #'Winter-Examples-Arkanoid'
}

{ #category : #'Instance Creation' }
ArkanoidPlayer class >> representedWith: aSprite [

	^ self new initializeRepresendtadWith: aSprite
]

{ #category : #Initialization }
ArkanoidPlayer >> initializeCollisionShape [

	collisionShape := Square ofCenter: 250 @ 530 extent: 200 @ 0 color: Color red
]

{ #category : #Initialization }
ArkanoidPlayer >> initializeRepresendtadWith: aSprite [

	sprite := aSprite
]

{ #category : #Movement }
ArkanoidPlayer >> moveLeft [

	| newX |

	newX := self positionX - 10 max: 0.
	collisionShape position: newX @ self positionY
]

{ #category : #Movement }
ArkanoidPlayer >> moveRight [

	| newX |

	newX := self positionX + 10 min: 626.
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
