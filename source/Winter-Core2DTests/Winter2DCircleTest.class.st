Class {
	#name : #Winter2DCircleTest,
	#superclass : #TestCase,
	#category : 'Winter-Core2DTests'
}

{ #category : #'Test Support' }
Winter2DCircleTest >> game [

	^ self
]

{ #category : #'Test Support' }
Winter2DCircleTest >> scene [

	^ self
]

{ #category : #Tests }
Winter2DCircleTest >> testAccessing [

	| game circle |
	
	game := self game.
	circle := Winter2DCircle
		ofCenter: 250 @ 530
		radius: 15
		color: Color red
		in: game.
		
	circle scene: game scene .		
	
	self
		assert: circle bounds equals: (250 @ 530 extent: 15 @ 15);
		assert: circle radius equals: 15;
		assert: circle position equals: 250 @ 530;
		assert: circle color equals: Color red;
		assert: circle game equals: game;
		assert: circle scene equals: game scene 
]

{ #category : #Tests }
Winter2DCircleTest >> testDoNotIntersectsASquare [

	| game circle square |

	game := self game.
	circle := Winter2DCircle
		ofCenter: 250 @ 530
		radius: 15
		color: Color red
		in: game.
	square := Winter2DSquare
		ofCenter: 200 @ 560
		extent: 20 @ 5
		color: Color red
		in: game.
		
	self deny: (circle intersects: square)
]

{ #category : #Tests }
Winter2DCircleTest >> testDoNotIntersectsAnotherCircle [

	| game circle anotherCircle |

	game := self game.
	circle := Winter2DCircle
		ofCenter: 250 @ 530
		radius: 15
		color: Color red
		in: game.
	anotherCircle := Winter2DCircle
		ofCenter: 100 @ 200
		radius: 15
		color: Color red
		in: game.
		
	self deny: (circle intersects: anotherCircle)
]

{ #category : #Tests }
Winter2DCircleTest >> testIntersectsASquare [

	| game circle square |

	game := self game.
	circle := Winter2DCircle
		ofCenter: 250 @ 530
		radius: 15
		color: Color red
		in: game.
	square := Winter2DSquare
		ofCenter: 250 @ 530
		extent: 200 @ 50
		color: Color red
		in: game.
		
	self assert: (circle intersects: square)
]

{ #category : #Tests }
Winter2DCircleTest >> testIntersectsAnotherCircle [

	| game circle anotherCircle |

	game := self game.
	circle := Winter2DCircle
		ofCenter: 250 @ 530
		radius: 15
		color: Color red
		in: game.
	anotherCircle := Winter2DCircle
		ofCenter: 240 @ 520
		radius: 15
		color: Color red
		in: game.
		
	self assert: (circle intersects: anotherCircle)
]
