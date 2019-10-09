Class {
	#name : #Winter2DSceneTest,
	#superclass : #TestCase,
	#category : 'Winter-Core2DTests'
}

{ #category : #'Test Support' }
Winter2DSceneTest >> component [

	^ WinterTestNonPlayer new
]

{ #category : #'Test Support' }
Winter2DSceneTest >> dimensions [

	^ 600 @ 600
]

{ #category : #'Test Support' }
Winter2DSceneTest >> game [

	^ self
]

{ #category : #'Test Support' }
Winter2DSceneTest >> player [

	^ WinterTestPlayer new
]

{ #category : #'Test Support' }
Winter2DSceneTest >> scene [
	^ WinterTestScene new
		game: self;
		yourself
]

{ #category : #Tests }
Winter2DSceneTest >> testAccessing [

	| scene game |

	game := self game.
	scene := game scene.
	
	self assert: scene background equals: Color white.
	scene background: Color orange.
	
	scene game: nil.
	self assert: scene game isNil.
	scene game: game.
	
	self
		assert: scene background equals: Color orange;
		assert: scene game equals: game;
		assert: scene dimensions equals: game dimensions;
		assert: scene surface notNil;
		assert: scene surface extent equals: scene dimensions;
		assert: scene players isEmpty
]

{ #category : #Tests }
Winter2DSceneTest >> testAddComponent [
	
	| scene game component |
	
	game := self game.
	scene := game scene.
	component := self component.
	
	self assert: scene components isEmpty.
	
	scene addComponent: component.
	
	self
		assert: scene components notEmpty;
		assert: scene components size equals: 1;
		assert: scene components first equals: component
]

{ #category : #Tests }
Winter2DSceneTest >> testAddComponents [
	
	| scene game component anotherComponent|
	
	game := self game.
	scene := game scene.
	component := self component.
	anotherComponent := self component .
	
	self assert: scene components isEmpty.
	
	scene addComponents: (Array with: component with: anotherComponent ).
	
	self
		assert: scene components notEmpty;
		assert: scene components size equals: 2;
		assert: (scene components includes: component) ;
		assert: (scene components includes: anotherComponent) 
]

{ #category : #Tests }
Winter2DSceneTest >> testAddPlayer [
	
	| scene game player |
	
	game := self game.
	scene := game scene.
	player := self player.
	
	self assert: scene players isEmpty.
	
	scene addPlayer:  player.
	
	self
		assert: scene players notEmpty;
		assert: scene players size equals: 1;
		assert: scene players first equals: player
]

{ #category : #Tests }
Winter2DSceneTest >> testRemoveComponent [

	| scene game component |

	game := self game.
	scene := game scene.
	component := self component.

	self assert: scene components isEmpty.

	scene addComponent: component.

	self
		assert: scene components notEmpty;
		assert: scene components size equals: 1;
		assert: scene components first equals: component.

	scene removeComponent: component.

	self assert: scene components isEmpty
]

{ #category : #Tests }
Winter2DSceneTest >> testRemovePlayer [
	
	| scene game player |
	
	game := self game.
	scene := game scene.
	player := self player.
	
	self assert: scene players isEmpty.
	
	scene addPlayer: player.
	
	self
		assert: scene players notEmpty;
		assert: scene players size equals: 1;
		assert: scene players first equals: player.
	
	scene removePlayer: player.
	
	self assert: scene players isEmpty
]
