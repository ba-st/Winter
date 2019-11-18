Class {
	#name : #WinterNonPlayerComponentTest,
	#superclass : #TestCase,
	#category : 'Winter-CoreTests'
}

{ #category : #'Test Support' }
WinterNonPlayerComponentTest >> collisionShapeOn: aGame [

	^ Winter2DCircle
		ofCenter: 250 @ 530
		radius: 15
		color: Color red
		in: aGame
]

{ #category : #'Test Support' }
WinterNonPlayerComponentTest >> game [

	^self
]

{ #category : #'Test Support' }
WinterNonPlayerComponentTest >> position [

	^200@200
]

{ #category : #'Test Support' }
WinterNonPlayerComponentTest >> scene [

	^self 
]

{ #category : #Tests }
WinterNonPlayerComponentTest >> testAccessing [

	| component game scene collisionShape position |

	component := WinterMovableComponent new.
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
