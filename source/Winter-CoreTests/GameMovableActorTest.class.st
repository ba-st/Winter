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

{ #category : #Tests }
GameMovableActorTest >> testAccessing [

	| component game collisionShape position |

	component := GameMovableActor new.
	game := self game.
	collisionShape := self collisionShapeOn: game.
	position := self position.
	component game: game.
	component collisionShape: collisionShape.
	component position: position.
	self assert: component game equals: game
]
