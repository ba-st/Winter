Class {
	#name : #GameMovableActorTest,
	#superclass : #TestCase,
	#category : #'Winter-CoreTests-Base'
}

{ #category : #'Test Support' }
GameMovableActorTest >> collisionShapeOn: aGame [

	^ Circle
		ofCenter: 250 @ 530
		radius: 15
		color: Color red
]

{ #category : #'Test Support' }
GameMovableActorTest >> game [

	^self
]

{ #category : #'Test Support' }
GameMovableActorTest >> position [

	^200@200
]

{ #category : #'Test Support' }
GameMovableActorTest >> scene [

	^self 
]

{ #category : #Tests }
GameMovableActorTest >> testAccessing [

	| component game scene collisionShape position |

	component := GameMovableActor new.
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
