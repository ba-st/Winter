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

{ #category : #Tests }
GameInteractiveMovableActorTest >> testAccessing [

	| component game collisionShape position |

	component := GameInteractiveMovableActor new.
	game := self game.
	collisionShape := self collisionShapeOn: game.
	position := self position.
	component game: game.
	component collisionShape: collisionShape.
	component position: position.
	self assert: component game equals: game
]
