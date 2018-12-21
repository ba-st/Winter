Class {
	#name : #SpiderInvasionGame,
	#superclass : #WinterGame,
	#category : #'Winter-Examples-SpiderInvasion'
}

{ #category : #Accessing }
SpiderInvasionGame >> dimensions [
	^ self gameSize * self spriteSize
]

{ #category : #Accessing }
SpiderInvasionGame >> gameSize [
	^ 8 @ 14
]

{ #category : #initialization }
SpiderInvasionGame >> initializeCollisionHandlers [

	collisionHandlers
		add:
			(CollisionHandler
				between: SpiderInvasionSpider
				and: SpiderInvasionWall
				onCollisionDo: [ :collision | 
					| leftOrRight newSpiderPos |
					leftOrRight := #(-1 1) atRandom.
					newSpiderPos := collision firstComponent position - (0 @ 1) + (leftOrRight @ 0).
					(scene isValidPosition: newSpiderPos)
						ifTrue: [ collision firstComponent position: newSpiderPos ] ]);
		add:
			(CollisionHandler
				between: SpiderInvasionSpider
				and: SpiderInvasionMissile 
				onCollisionDo: [ :collision | 
					collision firstComponent die.
					collision secondComponent die]);
		add:
			(CollisionHandler
				between: SpiderInvasionWall
				and: SpiderInvasionMissile 
				onCollisionDo: [ :collision | 
					collision firstComponent die.
					collision secondComponent die])
]

{ #category : #initialization }
SpiderInvasionGame >> initializePlayers [

	| player |

	player := SpiderInvasionPlayer on: self.

	player
		addInteractionOnKeyDownOf: Character arrowLeft
			doing: [ player moveLeft];
		addInteractionOnKeyDownOf: Character arrowRight
			doing: [ player moveRight];
		addInteractionOnKeyDownOf: Character tab  
			doing: [ player fire].
	
	self addPlayer: player
]

{ #category : #initialization }
SpiderInvasionGame >> initializeResources [

	WinterAssetManagementSystem current
		addSprite: 'spider.png' named: #spider;
		addSprite: 'wall.png' named: #wall;
		addSprite:  'missile.png' named: #missile;
		addSprite:  'explode.png' named: #explode;
		addSprite:  'spaceShip.png' named: #spaceShip
]

{ #category : #initialization }
SpiderInvasionGame >> initializeScenes [

	self scene: SpiderInvesionScene new
]

{ #category : #Accessing }
SpiderInvasionGame >> player [

	^ scene players anyOne
]

{ #category : #Accessing }
SpiderInvasionGame >> spriteSize [

	^ 48@48
]

{ #category : #Accessing }
SpiderInvasionGame >> title [

	^'Spider Invasion'
]
