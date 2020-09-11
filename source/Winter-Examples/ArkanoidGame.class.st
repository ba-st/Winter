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
	#superclass : #Game,
	#instVars : [
		'playing',
		'collisionHandlers',
		'player',
		'assetManager',
		'actors',
		'ball'
	],
	#category : #'Winter-Examples-Arkanoid'
}

{ #category : #Collisions }
ArkanoidGame >> checkEndGame [

	ball position y > self screen extentY
		ifTrue: [ self reset ]
]

{ #category : #Accessing }
ArkanoidGame >> dimensions [

	^ 650 @ 700
]

{ #category : #Accessing }
ArkanoidGame >> eventHandler [

	| handler |

	handler := BasicEventHandler of: self.
	"handler registerObserver: ( engine systemOfType: ArkanoidInputHandlerSystem )."
	^ handler
]

{ #category : #initialization }
ArkanoidGame >> greenBrick [

	^ assetManager assetNamed: #green
]

{ #category : #initialization }
ArkanoidGame >> initialize [

	super initialize.
	playing := false.
	self
		initializeResources;
		initializeCollisionHandlers;
		initializePlayer;
		initializeActors.
	ball := ArkanoidBall representedWith: ( assetManager assetNamed: #ball )
]

{ #category : #initialization }
ArkanoidGame >> initializeActors [

	actors := OrderedCollection new
		add: ( ArkanoidWall ofCenter: 0 @ 0 extent: 626 @ 0 andColor: Color white );
		add: ( ArkanoidWall ofCenter: 0 @ 0 extent: 0 @ 600 andColor: Color white );
		add: ( ArkanoidWall ofCenter: 600 @ 0 extent: 0 @ 600 andColor: Color white );
		add: ( ArkanoidBrick yellowRepresentedWith: self yellowBrick on: 150 @ 150 ofExtent: 50 @ 25 );
		add: ( ArkanoidBrick greenRepresentedWith: self greenBrick on: 210 @ 150 ofExtent: 50 @ 25 );
		add: ( ArkanoidBrick redRepresentedWith: self redBrick on: 90 @ 150 ofExtent: 50 @ 25 );
		yourself
]

{ #category : #initialization }
ArkanoidGame >> initializeCollisionHandlers [

	collisionHandlers := OrderedCollection new.
	collisionHandlers
		add:
			( CollisionHandler
				between: ArkanoidBall
				and: ArkanoidWall
				onCollisionDo: [ :collision | 
					collision secondComponent isHorizontal
						ifTrue: [ collision firstComponent negateY ]
						ifFalse: [ collision firstComponent negateX ].
					collision firstComponent playCollisionSound
					] );
		add:
			( CollisionHandler
				between: ArkanoidBall
				and: ArkanoidBrick
				onCollisionDo: [ :collision | 
					collision secondComponent collidedByBallIn: self.
					collision firstComponent negateY.
					collision firstComponent playCollisionSound
					] );
		add:
			( CollisionHandler
				between: ArkanoidPlayer
				and: WinterScreen
				onCollisionDo: [ :collision | 
					collision firstComponent positionX = 10 negated
						ifTrue: [ collision firstComponent moveRight ]
						ifFalse: [ collision firstComponent moveLeft ]
					] );
		add:
			( CollisionHandler
				between: ArkanoidBall
				and: ArkanoidPlayer
				onCollisionDo: [ :collision | 
					collision firstComponent negateY.
					self playCollisionSound
					] )
]

{ #category : #initialization }
ArkanoidGame >> initializePlayer [

	player := ArkanoidPlayer representedWith: (assetManager assetNamed: #arkanoidBar).

	player
		addInteractionOnKeyDownOf: Character arrowLeft
			doing: [ player moveLeft.
			playing := true
			];
		addInteractionOnKeyDownOf: Character arrowRight
			doing: [ player moveRight.
			playing := true
			].

]

{ #category : #initialization }
ArkanoidGame >> initializeResources [

	assetManager := AssetsManager new.
	assetManager
		addSprite: 'arkanoid/background.png'
			named: #background
			applying: [ :aForm | aForm scaledToSize: self dimensions ];
		addSprite: 'arkanoid/yellow.png'
			named: #yellow
			applying: [ :aForm | aForm scaledToSize: 38 @ 38 ];
		addSprite: 'arkanoid/green.png' named: #green applying: [ :aForm | aForm scaledToSize: 38 @ 38 ];
		addSprite: 'arkanoid/red.png' named: #red applying: [ :aForm | aForm scaledToSize: 38 @ 38 ];
		addSprite: 'arkanoid/ball.png' named: #ball applying: [ :aForm | aForm scaledToSize: 38 @ 38 ];
		addSprite: 'arkanoid/arkanoid_bar.png' named: #arkanoidBar	";
		addSound: 'arkanoid/arkanoid_ball_collision.wav' named: #ballCollision"
]

{ #category : #Collisions }
ArkanoidGame >> playCollisionSound [

	( assetManager assetNamed: #ballCollision ) play
]

{ #category : #Accessing }
ArkanoidGame >> player [

	^player
]

{ #category : #initialization }
ArkanoidGame >> redBrick [

	^ assetManager assetNamed: #red
]

{ #category : #removing }
ArkanoidGame >> removeActor: anActor [

	actors remove: anActor ifAbsent: [  ]
]

{ #category : #rendering }
ArkanoidGame >> renderBackgroundOn: aCanvas [

	aCanvas setPaint: ( assetManager assetNamed: #background ).
	aCanvas drawShape: ( 0 @ 0 fastCorner: aCanvas surface extent )
]

{ #category : #rendering }
ArkanoidGame >> renderOn: aCanvas [

	| checker |

	checker := CollisionChecker new.

	self renderBackgroundOn: aCanvas.
	player renderOn: aCanvas.
	ball renderOn: aCanvas.
	playing
		ifTrue: [ player update.
			ball update
			].
	checker
		checkFor: ball and: player;
		checkFor: player and: self onAxis: #x.
	actors
		do: [ :actor | 
			actor
				renderOn: aCanvas;
				update.
			checker checkFor: ball and: actor
			].
	self checkEndGame
]

{ #category : #Reset }
ArkanoidGame >> reset [

	playing := false.
	self initialize 
]

{ #category : #Accessing }
ArkanoidGame >> title [

	^'Arkanoid'
]

{ #category : #initialization }
ArkanoidGame >> yellowBrick [

	^ assetManager assetNamed: #yellow
]
