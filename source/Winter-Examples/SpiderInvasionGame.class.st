"
I represent the SPider invasion game itself


Public API and Key Messages:

- dimensions
- gameSize
- player
- spriteSize

"
Class {
	#name : #SpiderInvasionGame,
	#superclass : #Game,
	#instVars : [
		'player',
		'assetsManager',
		'collisionHandlers',
		'actors'
	],
	#category : #'Winter-Examples-SpiderInvasion'
}

{ #category : #Running }
SpiderInvasionGame class >> start [

	^ self new start
]

{ #category : #accessing }
SpiderInvasionGame >> actors [

	^ actors
]

{ #category : #adding }
SpiderInvasionGame >> addActor: anActor [

	actors add: anActor
]

{ #category : #accessing }
SpiderInvasionGame >> assetsManager [

	^ assetsManager
]

{ #category : #Accessing }
SpiderInvasionGame >> background [

	^ Color black
]

{ #category : #Accessing }
SpiderInvasionGame >> dimensions [

	^ self gameSize * self spriteSize
]

{ #category : #Accessing }
SpiderInvasionGame >> eventHandler [

	| handler |

	handler := BasicEventHandler of: self.
	handler registerObserver: player.
	^ handler
]

{ #category : #Accessing }
SpiderInvasionGame >> gameSize [

	^ 8 @ 14
]

{ #category : #initialization }
SpiderInvasionGame >> initialize [

	super initialize.
	self
		initializeResources;
		initializePlayer;
		initializeCollisionHandlers;
		initializeActors
]

{ #category : #initialization }
SpiderInvasionGame >> initializeActors [

	actors := OrderedCollection new.
	self initializeWalls.
	self initializeSpiders
]

{ #category : #initialization }
SpiderInvasionGame >> initializeCollisionHandlers [

	collisionHandlers := OrderedCollection new.
	collisionHandlers
		add:
			( CollisionHandler
				between: SpiderInvasionSpider
				and: SpiderInvasionWall
				onCollisionDo: [ :collision | 
					| leftOrRight newSpiderPos |

					leftOrRight := #(-1 1) atRandom.
					newSpiderPos := collision firstComponent position - ( 0 @ 1 ) + ( leftOrRight @ 0 ).
					( self isValidPosition: newSpiderPos )
						ifTrue: [ collision firstComponent position: newSpiderPos ]
					] );
		add:
			( CollisionHandler
				between: SpiderInvasionSpider
				and: SpiderInvasionMissile
				onCollisionDo: [ :collision | 
					collision firstComponent die.
					collision secondComponent die
					] );
		add:
			( CollisionHandler
				between: SpiderInvasionWall
				and: SpiderInvasionMissile
				onCollisionDo: [ :collision | 
					collision firstComponent die.
					collision secondComponent die
					] )
]

{ #category : #initialization }
SpiderInvasionGame >> initializePlayer [

	player := SpiderInvasionPlayer on: self.

	player
		addInteractionOnKeyDownOf: Character arrowLeft doing: [ player moveLeft ];
		addInteractionOnKeyDownOf: Character arrowRight doing: [ player moveRight ];
		addInteractionOnKeyDownOf: Character tab doing: [ player fire ]
]

{ #category : #initialization }
SpiderInvasionGame >> initializeResources [

	assetsManager := AssetsManager new.
	assetsManager
		addSprite: 'resources/spider.png' named: #spider;
		addSprite: 'resources/wall.png' named: #wall;
		addSprite: 'resources/missile.png' named: #missile;
		addSprite: 'resources/explode.png' named: #explode;
		addSprite: 'resources/spaceShip.png' named: #spaceShip
]

{ #category : #initialization }
SpiderInvasionGame >> initializeSpiders [

	"Only half of the boxes in the first row contain a spider at the start of the game."
	1 to: self maxX // 2 do: [ :i |
		self newRandomSpiderTicked: self maxX + 10 + 20 atRandom ]
]

{ #category : #initialization }
SpiderInvasionGame >> initializeWalls [

	self
		withIndexItemsDo: [ :x :y | 
			( y = self minY or: [ y = self maxY ] )
				ifFalse: [ 100 atRandom < 20
						ifTrue: [ "20% of chances" self addActor: ( SpiderInvasionWall inPosition: x @ y of: self ) ]
					]
			]
]

{ #category : #testing }
SpiderInvasionGame >> isOccupiedAt: aPosition [

	^ self actors anySatisfy: [ :actor | actor position = aPosition ]
]

{ #category : #testing }
SpiderInvasionGame >> isValidPosition: aPosition [

	^ self minX @ self minY <= aPosition and: [ aPosition <= ( self maxX @ self maxY ) ]
]

{ #category : #processing }
SpiderInvasionGame >> lostGame [

	actors := OrderedCollection new.
	self
		withIndexItemsDo: [ :i :j | 
			j = self maxY
				ifFalse: [ self addActor: ( SpiderInvasionExplode atPosition: i @ j of: self tick: 30 ) ]
			]
]

{ #category : #private }
SpiderInvasionGame >> maxX [

	^ 8
]

{ #category : #private }
SpiderInvasionGame >> maxY [

	^ 14
]

{ #category : #private }
SpiderInvasionGame >> minX [

	^ 1
]

{ #category : #private }
SpiderInvasionGame >> minY [

	^ 1
]

{ #category : #private }
SpiderInvasionGame >> newRandomSpiderTicked: numTick [

	| randomX spider |

	[ randomX := self randomX.
	self isOccupiedAt: randomX @ 1
	] whileTrue.
	spider := SpiderInvasionSpider atPosition: randomX @ self minY of: self tick: numTick.
	self addActor: spider
]

{ #category : #private }
SpiderInvasionGame >> randomX [

	^ self maxX atRandom - 1 + self minX
]

{ #category : #adding }
SpiderInvasionGame >> removeActor: anActor [

	actors remove: anActor
]

{ #category : #rendering }
SpiderInvasionGame >> renderBackgroundOn: aCanvas [

	aCanvas setPaint: self background.
	aCanvas drawShape: ( 0 @ 0 fastCorner: aCanvas surface extent )
]

{ #category : #rendering }
SpiderInvasionGame >> renderOn: aCanvas [

	self renderBackgroundOn: aCanvas.
	player renderOn: aCanvas.
	player update.

	actors
		do: [ :actor | 
			actor
				renderOn: aCanvas;
				update
			]
]

{ #category : #Accessing }
SpiderInvasionGame >> spriteSize [

	^ 48@48
]

{ #category : #Accessing }
SpiderInvasionGame >> title [

	^'Spider Invasion'
]

{ #category : #private }
SpiderInvasionGame >> withIndexItemsDo: aBlock [

	self minY to: self maxY do: [ :j | self minX to: self maxX do: [ :i | aBlock value: i value: j ] ]
]
