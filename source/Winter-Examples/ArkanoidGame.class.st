"
I represent the arkanoid game itself

Instance variables: 

- playing

Public API and Key Messages:

- player
- playing
- playing:
- resetPlayerAndBall:
"
Class {
	#name : #ArkanoidGame,
	#superclass : #WinterGame,
	#instVars : [
		'playing'
	],
	#category : #'Winter-Examples-Arkanoid'
}

{ #category : #Accessing }
ArkanoidGame >> dimensions [
	^ 650 @ 700
]

{ #category : #initialization }
ArkanoidGame >> initialize [

	super initialize.
	playing := false
]

{ #category : #initialization }
ArkanoidGame >> initializeCollisionHandlers [
	collisionHandlers
		add:
			(CollisionHandler
				between: ArkanoidBall
				and: ArkanoidWall
				onCollisionDo: [ :collision | 
					collision secondComponent isHorizontal
						ifTrue: [ collision firstComponent negateY ]
						ifFalse: [ collision firstComponent negateX ].
					collision firstComponent playCollisionSound ]);
		add:
			(CollisionHandler
				between: ArkanoidBall
				and: ArkanoidBrick
				onCollisionDo: [ :collision | 
					collision secondComponent collidedByBall.
					collision firstComponent negateY.
					collision firstComponent playCollisionSound ]);
		add:
			(CollisionHandler
				between: ArkanoidPlayer
				and: WinterScreen
				onCollisionDo: [ :collision | 
					collision firstComponent positionX = 10 negated
						ifTrue: [ collision firstComponent moveRight ]
						ifFalse: [ collision firstComponent moveLeft ] ]);
		add:
			(CollisionHandler
				between: ArkanoidBall
				and: ArkanoidPlayer
				onCollisionDo: [ :collision | 
					collision firstComponent
						negateY;
						playCollisionSound ])
]

{ #category : #initialization }
ArkanoidGame >> initializePlayers [

	| player |

	player := ArkanoidPlayer on: self.

	player
		addInteractionOnKeyDownOf: Character arrowLeft
			doing: [ player moveLeft.
			playing := true ];
		addInteractionOnKeyDownOf: Character arrowRight
			doing: [ player moveRight.
			playing := true ].
	
	self addPlayer: player
]

{ #category : #initialization }
ArkanoidGame >> initializeResources [

	| assetsSystem |

	assetsSystem := self assetsManagementSystem.
	(assetsSystem addSprite: 'background.png' named: #background)
		scaledToSize: self dimensions.
	(assetsSystem addSprite: 'yellow.png' named: #yellow)
		scaledToSize: 38 @ 38.
	(assetsSystem addSprite: 'green.png' named: #green)
		scaledToSize: 38 @ 38.
	(assetsSystem addSprite: 'red.png' named: #red) scaledToSize: 38 @ 38.
	(assetsSystem
		addSprite: 'arkanoid_bar.png' named: #arkanoidBar;
		addSound: 'arkanoid_ball_collision.wav' named: #ballCollision;
		addSprite: 'ball.png' named: #ball) scaledToSize: 38 @ 38
]

{ #category : #initialization }
ArkanoidGame >> initializeScenes [

	self scene: ArkanoidScene new
]

{ #category : #Accessing }
ArkanoidGame >> player [

	^ scene players anyOne
]

{ #category : #Accessing }
ArkanoidGame >> playing [

	^ playing
]

{ #category : #Accessing }
ArkanoidGame >> playing: aBoolean [

	playing := aBoolean
]

{ #category : #Reset }
ArkanoidGame >> resetPlayerAndBall: anArkanoidBall [

	| player |

	player := self player.
	playing := false.
	player resetPosition.
	anArkanoidBall resetPosition.
	scene initialize.
	scene addPlayer: player
]

{ #category : #Accessing }
ArkanoidGame >> title [

	^'Arkanoid'
]
