Class {
	#name : #Winter2DSquareTest,
	#superclass : #TestCase,
	#category : 'Winter-Core2DTests'
}

{ #category : #'Test Support' }
Winter2DSquareTest >> game [

	^ self
]

{ #category : #Tests }
Winter2DSquareTest >> testAccessing [

	| game circle |

	game := self game.
	circle := Winter2DSquare
		ofCenter: 200 @ 560
		extent: 200 @ 0
		color: Color red
		in: game.

	self
		assert: circle extent equals: 200 @ 0;
		assert: circle position equals: 200 @ 560;
		assert: circle bounds equals: ( circle position extent: circle extent );
		assert: circle color equals: Color red;
		assert: circle game equals: game
]

{ #category : #Tests }
Winter2DSquareTest >> testDoNotIntersectsACircle [

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

	self deny: ( square intersects: circle )
]

{ #category : #Tests }
Winter2DSquareTest >> testDoNotIntersectsAnotherSquare [

	| game square anotherSquare |

	game := self game.
	square := Winter2DSquare
		ofCenter: 200 @ 560
		extent: 20 @ 5
		color: Color red
		in: game.
	anotherSquare := Winter2DSquare
		ofCenter: 150 @ 500
		extent: 20 @ 5
		color: Color red
		in: game.

	self deny: ( square intersects: anotherSquare )
]

{ #category : #Tests }
Winter2DSquareTest >> testIntersectsACircle [

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

	self assert: ( square intersects: circle )
]

{ #category : #Tests }
Winter2DSquareTest >> testIntersectsAnotherSquare [

	| game square anotherSquare |

	game := self game.
	square := Winter2DSquare
		ofCenter: 200 @ 560
		extent: 20 @ 5
		color: Color red
		in: game.
	anotherSquare := Winter2DSquare
		ofCenter: 200 @ 560
		extent: 20 @ 5
		color: Color red
		in: game.

	self assert: ( square intersects: anotherSquare )
]
