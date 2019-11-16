Class {
	#name : #WinterPlayerComponentTest,
	#superclass : #TestCase,
	#category : 'Winter-CoreTests'
}

{ #category : #'Test Support' }
WinterPlayerComponentTest >> collisionShapeOn: aGame [

	^ Winter2DCircle
		ofCenter: 250 @ 530
		radius: 15
		color: Color red
		in: aGame
]

{ #category : #'Test Support' }
WinterPlayerComponentTest >> game [

	^ self
]

{ #category : #'Test Support' }
WinterPlayerComponentTest >> position [

	^ 200 @ 200
]

{ #category : #'Test Support' }
WinterPlayerComponentTest >> scene [

	^ self
]

{ #category : #Tests }
WinterPlayerComponentTest >> testAccessing [

	| component game scene collisionShape position |

	component := WinterTestPlayer new.
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
