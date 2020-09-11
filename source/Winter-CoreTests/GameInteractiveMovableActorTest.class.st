Class {
	#name : #GameInteractiveMovableActorTest,
	#superclass : #TestCase,
	#category : #'Winter-CoreTests-Base'
}

{ #category : #'Test Support' }
GameInteractiveMovableActorTest >> collisionShapeOn: aGame [

	^ Circle
		ofCenter: 250 @ 530
		radius: 15
		color: Color red
]

{ #category : #'Test Support' }
GameInteractiveMovableActorTest >> game [

	^ self
]

{ #category : #'Test Support' }
GameInteractiveMovableActorTest >> position [

	^ 200 @ 200
]

{ #category : #'Test Support' }
GameInteractiveMovableActorTest >> scene [

	^ self
]

{ #category : #Tests }
GameInteractiveMovableActorTest >> testAccessing [

	| component game scene collisionShape position |

	component := GameInteractiveMovableActor new.
	game := self game.
	scene := self scene.
	collisionShape := self collisionShapeOn: game.
	position := self position.
	component game: game.
	component scene: scene.
	component collisionShape: collisionShape.
	component position: position.
	self
		assert: component game equals: game;
		assert: component scene equals: scene
]
